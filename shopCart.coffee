###
@api {get} /cart/lists 购物车列表
@apiName cart/lists
@apiGroup shopcart
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "22916": {  //商家id
      "demand_4416": {      //商品表名_商品id
        "business": "22916",  //商家id
        "id": "demand_4416",
        "name": "求学姐学长",
        "price": "200.00",
        "brand": "xzb",
        "thumb": "",
        "num": 2,
        "shipping": ""
      }
    }
  }
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###



###
@api {post} /cart/add_cart  添加商品到购物车
@apiName cart/add_cart
@apiGroup shopcart
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} cart 新增商品

@apiParam (请求参数：cart) {String} table 商品表名  'bid', 'demand', 'book', 'learning_periods'
@apiParam (请求参数：cart) {String} id 商品id
@apiParam (请求参数：cart) {String} num 商品数量 

@apiParamExample {json} Body示例：
{
 "cart":{
     "table":"demand",
     "id":"234",
     "num":2
   }
}


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 5012 商品类型不存在
@apiError (error_title) 5013 商品不存在
@apiError (error_title) 5014 添加购物车失败
@apiError (error_title) 9001 系统错误
###



###
@api {put} /cart/modNum  修改购物车商品数量 (删除商品)
@apiName cart/modNum
@apiGroup shopcart
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} cart 商品

@apiParam (请求参数：cart) {String} business 商家id
@apiParam (请求参数：cart) {String} id 商品id 注：商品表名_商品id
@apiParam (请求参数：cart) {String} num 商品数量  注：当小于等于0 为删除商品 大于0的时为修改商品数量

@apiParamExample {json} Body示例：
{
    "cart":{
        "business":"22916",
        "id":"demand_4416",
        "num":4
    }
}


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 5011 修改产品不存在
@apiError (error_title) 9001 系统错误
###


