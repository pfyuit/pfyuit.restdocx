<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/include.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Wedding App Documentation</title>
</head>
<body>
   <pre>
	<br> #define USER_URL "http://"APP_DOMAIN"/weddingapp/user/"
	<br> #define WEDDING_URL "http://"APP_DOMAIN"/weddingapp/wedding/"
	<br> #define TASK_URL "http://"APP_DOMAIN"/weddingapp/task/"
	<br> #define COMMENT_URL "http://"APP_DOMAIN"/weddingapp/comment/"
	<br> #define MERCHANT_URL "http://"APP_DOMAIN"/weddingapp/merchant/"
	<br> #define INVITATION_URL "http://"APP_DOMAIN"/weddingapp/invitation/"
	<br> #define TAG_URL "http://"APP_DOMAIN"/weddingapp/tag/"
	<br> #define IMAGE_URL "https://s3-us-west-2.amazonaws.com/litb.weddingapp/"
	<br />
1 url rules, we try to format the url by /feature/ID/action
currently we have these features:
/comment, it's where people post comment to the tasks.
/group, here saves all the user group we have, currently we have only four, so it's like contants.
/invitation, it's for generating 6 digit verification key for invitation
/tag, it's the category for tasks, cause we want to have multiple dimension category, so use tag, one task can have multiple tag
/task, it's the main object, hold task information
/user, it's user mangement
/wedding, it's wedding management.

ID is the mongodb id, it's an uniq string

for example, /user/{userid}/addgroup?groupName=xxx&weddingid=xxx
in this api, userid is the id of user we are trying to add group to.
groupName and weddingid the group and wedding we are trying to add him into.

About time, we use Long for time saving, it's get based on
return new Date().getTime()/1000;
so it's seconds after 1970, we use it to avoid time zone or string format conversion, and it's easy to sort. :)

2 general apis.
each feature has REST api
/feature/{id}
                      get that object
/feature/{id},POST,DELETE
                      delete the object
/feature/all
                      get all list, for security reason, only tag getall is retained, all other is disabled.
/feature/saveorupdate, POST, json format input
                      POST object to do new or update, let's get an example for user.
I strongly recommend you get a copy of our java code, so you will get our entity, you can use it directly.
for example, our user entity:
private String password;
private String firstName;
private String lastName;
private String email;
private Boolean hasImage=false;
private String groupName;
private String deviceToken;
all entity is extened from baseobject, baseobject has two properies
private String id;
private Long lastModify = -1L;

If you post with id, we will take it as an update request, if you leave id null, we will take it as an insert.
The lastModify will be updated by the server side automatcially, so just leave it be.
there is no must have fields, you just fill with the field what the interface have input for.
for example, the user password is no use now, cause we don't need password for registration.
Also we don't need email. So for simplest way to create a user, just set firstName, you can call saveorupdate to create a user.

3 create user and wedding
first important use case is create wedding, typically, you need three steps to create a wedding.

a create user
/user/saveorupdate

b create wedding
/wedding/create

c add the user to wedding as some role
/{userid}/addgroup?groupName=xxx&weddingid=xxx

we only have 4 groups, we take the name directly
[{"id":"529c3176e4b00c48e28d941c","lastModify":1385967990530,"groupName":"bride"},{"id":"529c318fe4b00c48e28d941d","lastModify":1385968015691,"groupName":"groom"},{"id":"529c319ee4b00c48e28d941e","lastModify":1385968030439,"groupName":"planer"},{"id":"529c31cde4b00c48e28d941f","lastModify":1385968077091,"groupName":"guest"}]

after wedding is created, about 60 predefined tasks will be created automatically.

4 update wedding information
/wedding/saveorupdate
use this api for update wedding information, including wedding date, if wedding date is updated, all task due date will be recalculated.

5 user manage
/user/{userid}/removeuser?groupName=xxx&weddingid=xxx
remove user from the group of the wedding

/user/{userid}/uploadFile, POST with
file=filecontent
isCustom=1 or null, if it's null (no set), it means it's upload image for himself, or it is uploading image for comment or something else.

/user/findUserByWeddingGroup?weddingid=xxx&groupName=xxx
get all the users of the group of the wedding

6 /task
/task/find?weddingid=xxx&userid=xxx&tagName=xxx
get task list by weddingid userid
weddingid, MUST
userid, MUST, it's for verification
tagName , NOT MUST, just get task list for one tag

use /saveorupdate to change task category.
task:
{
id:xxx
tagName:[xxxx,xxxx]
}
just set the tagName, we designed to make it support multiple categroy, but now we just use one.

also use /saveorupdate to update the state of task, current we have 2 state:
public static Long INPROCESSING = 1L;
public static Long FINISHED = 2L;
but we may add more.

7 /comment
/comment/find?taskid=xxx&userid=xxx&lastModify=xxx
get comment for one task, userid is just for verification, these two is MUST
lastModify is NOT MUST, it's for incremental upating, if you input a time, and there is no new comment after that time, the api will return null, or it will return all.

use /saveorupdate for new comment.

8 /inviatation
/invitation/generateInvitation?inviterid=xxx&groupName=xxx&weddingid=xxx
generate an invitation for the group of wedding from the inviter(yourself)

/invitation/{id}
decode the id into weddingid, groupid, inviterid


9 Image Upload / Download
A) Image for comments
The comment can only have two kinds of formats. One format is all text, another is a picture. So currently we don't support text and picture mixed comments. 

If the user try to upload a picture for comments, the client will first use the upload endpoint to upload a picutre, server side will upload the file to AWS S3, and a FileEntry object will be returned, and then the url of the file is 
 https://s3-us-west-2.amazonaws.com/litb.weddingapp/[fileid]
[fileid] is the id proprety of the FileEntry object.

Also, the client need to record the id to a new comment using the format <fileid>, the text property of the comment object need to be set to <fileid>.

For example, if the fileid is 
52a6e874c622b7220407bf25
you can get the file from 
 https://s3-us-west-2.amazonaws.com/litb.weddingapp/52a6e874c622b7220407bf25

And a comment object with text set to "<52a6e874c622b7220407bf25>" need to be added.
(Liuyu: Correct me if I am wrong, It's important to keep the same rule for both ios client and android client).

B) Image for avatar
About the user avatar, it's some different. There is a property named "hasImage" in User Object. When a user object first created, the property is set to false or null by default. Client can use the same endpoint  to upload avatar, only need to make sure "isCustom" parameter is set to null or be missing . After that, an FileEntry object will also be returned, but the id of the FileEntry is the same as the id of the User object.

So to get user avatar, first check the "hasImage" of the User object, if it's true, then you can get user avatar from the url:
 https://s3-us-west-2.amazonaws.com/litb.weddingapp/[userid]
   
   </pre>
</body>
</html>