###
@api {post} /comment/add 发表评论
@apiName /comment/add 
@apiGroup Comment
@apiVersion 1.0.0

@apiUse header_token

@apiParam {String} pid 评论值为0  回复传评论ID   
@apiParam {String} table 评论表名    demand/information/listen
@apiParam {String} table_id 评论表ID
@apiParam {String} content 评论详情

@apiParamExample {json} body示例：
{
 "comment":{
     "pid":0,
     "table":"demand",
     "table_id":100,
     "content":"fewfwefewfew"
   }
}

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": 387
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###


###
@api {post} /comment/list 评论列表
@apiName /comment/list
@apiGroup Comment
@apiVersion 1.0.0

@apiUse header_token

@apiParam {String} table 评论表名    demand/information/listen
@apiParam {String} table_id 表ID

@apiParamExample {json} body示例：
{
 "comment":{
     "table":"demand",
     "table_id":21
   }
}

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "10",
      "pid": "0",
      "table": "demand",
      "table_id": "21",
      "member_id": "8309",
      "content": "自己评论自己",
      "status": "1",
      "add_time": "2014-09-28 18:12:22",
      "praise_num": "0",
      "child": {
        "id": "10",
        "pid": "0",
        "table": "demand",
        "table_id": "21",
        "member_id": "8309",
        "content": "自己评论自己",
        "status": "1",
        "add_time": "2014-09-28 18:12:22",
        "praise_num": "0"
      }
    },
    {
      "id": "13",
      "pid": "0",
      "table": "demand",
      "table_id": "21",
      "member_id": "8309",
      "content": "评论",
      "status": "1",
      "add_time": "2014-09-28 18:14:50",
      "praise_num": "0",
      "child": {
        "id": "13",
        "pid": "0",
        "table": "demand",
        "table_id": "21",
        "member_id": "8309",
        "content": "评论",
        "status": "1",
        "add_time": "2014-09-28 18:14:50",
        "praise_num": "0"
      }
    },
    {
      "id": "14",
      "pid": "0",
      "table": "demand",
      "table_id": "21",
      "member_id": "8309",
      "content": "提交评论",
      "status": "1",
      "add_time": "2014-09-28 18:15:03",
      "praise_num": "0",
      "child": {
        "id": "14",
        "pid": "0",
        "table": "demand",
        "table_id": "21",
        "member_id": "8309",
        "content": "提交评论",
        "status": "1",
        "add_time": "2014-09-28 18:15:03",
        "praise_num": "0"
      }
    }
  ]
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###



###
@api {get} /comment/praise/:id 点赞/取消赞
@apiName /comment/praise 
@apiGroup Comment
@apiVersion 1.0.0

@apiUse header_token

@apiParam {String} id 评论ID


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###
