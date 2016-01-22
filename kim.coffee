

###
@apiDefine MyError
@apiError 1001 The <code>id</code> of the User was not found.
###

###
@api {post} /register 用户注册
@apiName register
@apiGroup user
@apiVersion 1.0.0


@apiParam (register(参数)) {String} username 用户名
@apiParam (register(参数)) {String} password 密码
@apiParam (register(参数)) {int} phone 手机号
@apiParam (register(参数)) {JsonObject} verify 验证信息
@apiParam (verify(参数)) {String} code 验证码
@apiParam (verify(参数)) {String} signKey 验证Key

@apiParamExample {json} body示例：
{
    "register": {
        "username": "xxxxxx",
        "password": "xxxxx",
        "phone": "13800000000",
        "verify": {
            "code": "xxxx",
            "signKey": "signKey"
        }
    }
}


@apiSuccessExample {json} Success-Response:
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "id": "24326",
    "phone": null,
    ......
  }
}

@apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
@apiSuccess (返回数据) {JsonObject} data 封装返回用户数据，字段详见《数据表与字段注释》

@apiUse error_1001
@apiError (error_title) 3001 用户名已存在
@apiError (error_title) 3002 手机号已存在
@apiError (error_title) 3003 密码必须是6-30位
###

###
@api {post} /security 账号与安全
@apiName security
@apiGroup Security
@apiVersion 1.0.0
@apiDescription
<p>账号与安全页面，验证用户token，返回用户ID、手机号及验证信息、邮箱及验证信息、QQ号、用户状态</p>

@apiUse header_token

@apiSuccessExample {json} 返回示例:
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "id": "24326",
    "phone": null,
    "phone_verified": "0",
    "email": "xxx@qq.com",
    "email_verified": "1",
    "qq": null,
    "status": "1"
  }
}

@apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
@apiSuccess (返回数据) {JsonObject} data 封装返回数据
@apiSuccess (data(返回数据)) {int} id 用户ID
@apiSuccess (data(返回数据)) {int} phone 手机号
@apiSuccess (data(返回数据)) {int} phone_verified 是否验证手机：0=为验证 1=已验证
@apiSuccess (data(返回数据)) {int} email 邮箱
@apiSuccess (data(返回数据)) {int} email_verified 是否验证邮箱：0=为验证 1=已验证
@apiSuccess (data(返回数据)) {int} qq QQ号
@apiSuccess (data(返回数据)) {int} status 用户状态：状态 0=未激活 1=正常 2=冻结


###

###
@api {post} /account/paypassword 设置支付密码
@apiName set_paypwd
@apiGroup Account
@apiVersion 1.0.0
@apiDescription
<p></p>

@apiUse header_token

@apiParam (请求参数) {String} paypassword 支付密码

@apiParamExample {json} body示例：
{
  "paypassword": "xxxxxxxxxx"
}

@apiSuccessExample {json} 返回示例:
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
@apiSuccess (返回数据) {JsonObject} data 成功无返回数据

@apiUse error_1001
@apiError (error_title) 2006 设置支付密码不能为空
@apiError (error_title) 2007 支付密码已存在
@apiError (error_title) 2008 支付密码长度8~16位，数字、字母、字符至少包含两种

###

###
@api {post} /account/get_banklist 获取银行列表
@apiName get_banklist
@apiGroup Account
@apiVersion 1.0.0
@apiDescription
<p></p>

@apiUse header_token

@apiSuccessExample {json} 返回示例:
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "title": "中国银行",
      "img": "/Public/Home/images/bank/zg.jpg",
      "code": "BOCB2C",
      "id": 0
    },
    {
      "title": "中国建设银行",
      "img": "/Public/Home/images/bank/zg.jpg",
      "code": "CCB",
      "id": 1
    },
    {
      "title": "中国工商银行",
      "img": "/Public/Home/images/bank/gs.jpg",
      "code": "ICBCB2C",
      "id": 2
    },
    {
      "title": "中国农业银行",
      "img": "/Public/Home/images/bank/ny.jpg",
      "code": "ABC",
      "id": 3
    },
    {
      "title": "中国邮政储蓄银行",
      "img": "/Public/Home/images/bank/yz.jpg",
      "code": "PSBC-DEBIT",
      "id": 4
    },
    {
      "title": "交通银行",
      "img": "/Public/Home/images/bank/jt.jpg",
      "code": "COMM",
      "id": 5
    },
    {
      "title": "招商银行",
      "img": "/Public/Home/images/bank/zs.jpg",
      "code": "CMB",
      "id": 6
    }
  ]
}

@apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
@apiSuccess (返回数据) {JsonArray} data 返回银行列表数据
@apiSuccess (data(返回数据)) {String} title 银行名称
@apiSuccess (data(返回数据)) {String} img 银行icon
@apiSuccess (data(返回数据)) {String} code 银行代码
@apiSuccess (data(返回数据)) {String} id  银行ID 

@apiUse error_1001

###


###
@api {post} /account/set_bankcard 设置银行卡
@apiName set_bankcard
@apiGroup Account
@apiVersion 1.0.0
@apiDescription
<p></p>

@apiUse header_token

@apiParam (set_bankcard(参数)) {Int} card_type 银行ID
@apiParam (set_bankcard(参数)) {String} card_num 银行卡号
@apiParam (set_bankcard(参数)) {String} card_name 银行开户名

@apiParamExample {json} body示例：
{
  "card_type": "1",
  "card_num": "3444 4444 4444 4444444",
  "card_name": "234234"
}

@apiSuccessExample {json} 返回示例:
HTTP/1.1 200 OK
{
  "success": true,
  "data": "提交成功，请等待审核"
}

@apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
@apiSuccess (返回数据) {String} data 成功审核提示信息

@apiUse error_1001
@apiError (error_title) 2009 银行ID不能为空
@apiError (error_title) 2010 银行卡号不能为空
@apiError (error_title) 2011 开户名不能为空
###

###
@api {get} /about/updata_version 获取版本更新
@apiName updata_version
@apiGroup About
@apiVersion 1.0.0
@apiDescription
<p>获取APP最新版本号及更新下载地址</p>




@apiSuccessExample {json} 返回示例:
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "version": "1.1",
    "update_url": "http://www.alhelp.net",
    "update_time": "1446391079",
    "version_info": null
  }
}

@apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
@apiSuccess (返回数据) {String} data 成功审核提示信息
@apiSuccess (data(返回数据)) {String} version 更新版本号
@apiSuccess (data(返回数据)) {String} update_url 更新地址
@apiSuccess (data(返回数据)) {Int} update_time 更新时间
@apiSuccess (data(返回数据)) {String} version_info 版本功能介绍
@apiUse error_1001
###