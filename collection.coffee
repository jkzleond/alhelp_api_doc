###
@api {get} /collection/lists 收藏列表
@apiName collection/lists 
@apiGroup Collection  
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "231",   //收藏编号
      "member_id": "24476",   //用户ID
      "table_name": "information",   //产品表名称
      "table_id": "1805",   //产品ID
      "status": "1",   //状态 
      "add_time": "2015-09-15 16:51:43"   //添加时间
      "title": "需求/服务",   // 表名的翻译
      "content": {   //  收藏的内容
        "id": "327",
        "pid": null,
        "member_id": "5304",
        "member_name": "科大科院考研网",
        "role_type": "2",
        "demand_type": "1",
        ......
      }
    },
  ]
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###


###
@api {post} /collection/add 添加收藏
@apiName collection/add
@apiGroup Collection  
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} collection 收藏

@apiParam (请求参数：collection) {String} table_id 商品ID
@apiParam (请求参数：collection) {String} table_name 产品表名称 (可选值：demand information book)

@apiParamExample {json} Body示例：
{
    "collection":{
        "table_id":"4681",
        "table_name":"demand"
    }
}


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
@apiError (error_title) 5997 收藏商品部存在
@apiError (error_title) 5998 收藏失败
@apiError (error_title) 5999 已经收藏过
###