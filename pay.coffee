###
@api {get} /alipay/24104154 支付宝支付
@apiName alipay
@apiGroup Pay
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} order 商户订单号

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "service": "mobile.securitypay.pay",   //接口名称，固定值。
    "partner": "xxxxxxxx",    //合作者身份ID
    "_input_charset": "utf-8",   //参数编码字符集
    "sign_type": "RSA",    //签名方式
    "notify_url": "http://api.alhelp.net/index.php?m=Api&c=Alipay&a=callback", //服务器异步通知页面路径
    "out_trade_no": "24104154",  //商户网站唯一订单号
    "subject": "testname",   //商品名称
    "payment_type": 1,   //支付类型
    "seller_id": "xxxx@xx.com",  //卖家支付宝账号
    "total_fee": "120.00",   //总金额
    "body": "describe"   //商品详情
  }
}

@apiUse error_1001
@apiError (error_title) 5015 未支付订单不存在 
@apiError (error_title) 9001 系统错误
###


###
@api {get} /wxpay/24104154 微信APP支付
@apiName wxpay
@apiGroup Pay
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} order 商户订单号

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "appid": "wx8d1fd459ddd5f49b",
    "mch_id": "1284712301",
    "nonce_str": "eD7HGuowDvPl2s4g",
    "prepay_id": "wx20151115153125317dfadfd70237615195",
    "result_code": "SUCCESS",
    "return_code": "SUCCESS",
    "return_msg": "OK",
    "sign": "64400555B6CED9A3094414BD5143245E",
    "trade_type": "APP"
  }
}

@apiUse error_1001
@apiError (error_title) 5015 未支付订单不存在 
@apiError (error_title) 9001 系统错误
###