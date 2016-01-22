###
@api {post} /chat/goods 添加商品
@apiName chat_goods_1
@apiGroup Chat
@apiVersion 1.0.0

@apiParam (request) {String} a_user_id 用户A
@apiParam (request) {String} b_user_id 用户B
@apiParam (request) {String} goods_id 商品ID

@apiParamExample {json} Body示例：
{
  "a_user_id":"xxx",
  "b_user_id": "xxx",
  "goods_id":"xxx"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 7001
###

###
@api {get} /chat/goods/a/:a_user_id/b/:b_user_id 获取最新商品类型
@apiName chat_goods_2
@apiGroup Chat
@apiVersion 1.0.0

@apiParam (request) {String} a_user_id 用户A
@apiParam (request) {String} b_user_id 用户B

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
  	"type":xxx
  }
}

@apiUse error_1001
@apiError (error_title) 1404 没有商品
###

###
@api {get} /chat/goods/u/:user_id/t/:type_id 获取指定用户指定类型的商品列表
@apiName chat_goods_3
@apiGroup Chat
@apiVersion 1.0.0

@apiParam (request) {String} user_id 用户
@apiParam (request) {String} type_id 商品类型

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
###