###
@api {get} /accounts/:type 获取指定类型的收支详情列表
@apiName account_type_get
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token


@apiUse header_token

@apiParam (request) {String} type 需求类型，all：全部，pay_in：收入，pay_out：支出，income_in：充值，income_out：提现
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
    {
      "id": "2",
      "from_member_id": "24398",
      "to_member_id": "1",
      "table_name": "orders",
      "table_id": "706",
      "field": "balance",
      "title": "购买商品",
      "price": "0.01",
      "type": "1",
      "payment_number": "25177548",
      "paid": "1",
      "status": "1",
      "paid_time": "2014-11-17 17:44:19",
      "add_time": "2014-11-17 17:44:19",
      "json_content": "{\"content\":\"%E8%B4%AD%E4%B9%B0%E5%9B%BE%E4%B9%A6%27%E6%96%B0%E5%A2%9E%E5%9B%BE%E4%B9%A6%27\",\"remark\":\"%E5%95%86%E5%93%81%E8%AE%A2%E5%8D%95%E5%8F%B725177548\",\"info\":null}",
      "income_type": "0",
      "is_frozen": "0",
      "pay_way": "1",
      "is_real_frozen": "0",
      "is_show": "1"
    },
    ......
    ]
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 收支id
@apiSuccess (return_title) {String} from_member_id 资金流向的源头(用户id)
@apiSuccess (return_title) {String} to_member_id 资金流向的末尾(用户id)
@apiSuccess (return_title) {String} table_name 未知
@apiSuccess (return_title) {String} table_id 未知
@apiSuccess (return_title) {String} field 未知
@apiSuccess (return_title) {String} title 收支标题
@apiSuccess (return_title) {Float} price 资金数量
@apiSuccess (return_title) {Integer} type 未知
@apiSuccess (return_title) {Integer} payment_number 未知
@apiSuccess (return_title) {Integer} paid 未知
@apiSuccess (return_title) {Integer} status 未知
@apiSuccess (return_title) {String} paid_time 支付时间
@apiSuccess (return_title) {String} add_time 支付生成时间
@apiSuccess (return_title) {JsonObject} json_content 收支详情
@apiSuccess (return_title) {Integer} income_type 未知
@apiSuccess (return_title) {Integer} is_frozen 未知
@apiSuccess (return_title) {Integer} pay_way 未知
@apiSuccess (return_title) {Integer} is_real_frozen 未知
@apiSuccess (return_title) {Integer} is_show 未知


@apiError (error_title) 3015 收支类型不存在
###

###
@api {post} /account/cash 提现
@apiName account_get_cash
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token


@apiUse header_token

@apiParam (request) {String} address 银行卡开户地址
@apiParam (request) {Integer} balance 提现额
@apiParam (request) {Integer} card_id 银行卡id
@apiParamExample {json} Body示例：
{
  "get_cash_info": {
    "address": "test address",
    "balance": "101",
    "card_id": 1
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiError (error_title) 1001 参数不正确
@apiError (error_title) 3019 该用户不存在
@apiError (error_title) 3020 余额不足
###

###
@api {get} /accounts/expire/:n:unit 获取指定时间段的收支详情列表
@apiName account_expire_get
@apiGroup Account
@apiVersion 1.0.0

@apiParam (request) {String} n 数量 
@apiParam (request) {String} unit 单位，d: 天, w: 星期, m: 月, y: 年, c: 世纪
@apiParamExample 获取1天:
/accounts/expire/1d
@apiParamExample 获取1周:
/accounts/expire/1w
@apiParamExample 获取1月:
/accounts/expire/1m
@apiParamExample 获取1年:
/accounts/expire/1y
@apiParamExample 获取1世纪:
/accounts/expire/1c

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
  	"list": [
    {
      "id": "2",
      "from_member_id": "24398",
      "to_member_id": "1",
      "table_name": "orders",
      "table_id": "706",
      "field": "balance",
      "title": "购买商品",
      "price": "0.01",
      "type": "1",
      "payment_number": "25177548",
      "paid": "1",
      "status": "1",
      "paid_time": "2014-11-17 17:44:19",
      "add_time": "2014-11-17 17:44:19",
      "json_content": "{\"content\":\"%E8%B4%AD%E4%B9%B0%E5%9B%BE%E4%B9%A6%27%E6%96%B0%E5%A2%9E%E5%9B%BE%E4%B9%A6%27\",\"remark\":\"%E5%95%86%E5%93%81%E8%AE%A2%E5%8D%95%E5%8F%B725177548\",\"info\":null}",
      "income_type": "0",
      "is_frozen": "0",
      "pay_way": "1",
      "is_real_frozen": "0",
      "is_show": "1"
    },
    ......
  	]
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 收支id
@apiSuccess (return_title) {String} from_member_id 资金流向的源头(用户id)
@apiSuccess (return_title) {String} to_member_id 资金流向的末尾(用户id)
@apiSuccess (return_title) {String} table_name 未知
@apiSuccess (return_title) {String} table_id 未知
@apiSuccess (return_title) {String} field 未知
@apiSuccess (return_title) {String} title 收支标题
@apiSuccess (return_title) {Float} price 资金数量
@apiSuccess (return_title) {Integer} type 未知
@apiSuccess (return_title) {Integer} payment_number 未知
@apiSuccess (return_title) {Integer} paid 未知
@apiSuccess (return_title) {Integer} status 未知
@apiSuccess (return_title) {String} paid_time 支付时间
@apiSuccess (return_title) {String} add_time 支付生成时间
@apiSuccess (return_title) {JsonObject} json_content 收支详情
@apiSuccess (return_title) {Integer} income_type 未知
@apiSuccess (return_title) {Integer} is_frozen 未知
@apiSuccess (return_title) {Integer} pay_way 未知
@apiSuccess (return_title) {Integer} is_real_frozen 未知
@apiSuccess (return_title) {Integer} is_show 未知


@apiError (error_title) 3015 收支类型不存在
###

###
@api {get} /orders/:type 获取指定类型的订单列表
@apiName orders_type_get
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type 订单类型，99：全部，88：购买订单，77：出售订单，
0：未付款订单，
1：已付款订单，
2：已发货订单，
3：已收货订单，
4：已评价订单，
5：已申请退款，
6：已同意退款, 
7：拒绝退款，
8：退款已发货，
9：已退款收货，
10：申请仲裁，
11：已同意换货

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
    {
      "id": "22",
      "from_member_id": "24398",
      "to_member_id": "1167",
      "order_number": "34898275",
      "total": "1.00",
      "shipping": "0.00",
      "province": "1",
      "city": "2",
      "area": "3",
      "address": "测试地址",
      "postcode": "111111",
      "name": "杨帆",
      "phone": "11111111111",
      "content": "",
      "status": "3",
      "add_time": "2014-10-09 09:42:06",
      "group_num": null,
      "send_time": null,
      "pay_time": null,
      "shipping_template_id": "0",
      "bid_id": "0",
      "demand_id": "0",
    },
    ......
  ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 订单id
@apiSuccess (return_title) {Integer} from_member_id 订单发起人id
@apiSuccess (return_title) {Integer} from_member_id 订单接收人id
@apiSuccess (return_title) {Integer} order_number 订单号
@apiSuccess (return_title) {Float} total 订单金额
@apiSuccess (return_title) {String} shipping 未知
@apiSuccess (return_title) {Integer} province 省份id
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {String} area 地区
@apiSuccess (return_title) {String} address 详细地址
@apiSuccess (return_title) {String} postcode 邮编
@apiSuccess (return_title) {String} name 收件人姓名
@apiSuccess (return_title) {String} phone 手机
@apiSuccess (return_title) {String} content 订单内容
@apiSuccess (return_title) {String} status 0：未付款订单，1：已付款订单，2：已发货订单，3：已收货订单，4：已评价订单，5：已申请退款，6：已同意退款 , 7：拒绝退款，8：退款已发货，9：已退款收货，10：申请仲裁，11：已同意换货
@apiSuccess (return_title) {String} add_time 下单时间
@apiSuccess (return_title) {String} group_num 未知
@apiSuccess (return_title) {String} send_time 发送时间
@apiSuccess (return_title) {String} pay_time 支付时间
@apiSuccess (return_title) {String} pay_time 未知
@apiSuccess (return_title) {String} bid_id 协议id
@apiSuccess (return_title) {String} demand_id 需求id

@apiError (error_title) 3016 订单类型不存在
###

###
@api {get} /order/:id 获取指定id的订单详情
@apiName order_id_get
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} id 指定订单id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
    {
      "id": "22",
      "from_member_id": "24398",
      "to_member_id": "1167",
      "order_number": "34898275",
      "total": "1.00",
      "shipping": "0.00",
      "province": "1",
      "city": "2",
      "area": "3",
      "address": "测试地址",
      "postcode": "111111",
      "name": "杨帆",
      "phone": "11111111111",
      "content": "",
      "status": "3",
      "add_time": "2014-10-09 09:42:06",
      "group_num": null,
      "send_time": null,
      "pay_time": null,
      "shipping_template_id": "0",
      "bid_id": "0",
      "demand_id": "0",
      "history": [
        {
          "id": "12",
          "order_id": "22",
          "status": "0",
          "content": "yangfan->下达定单，订单号为34898275",
          "add_time": "2014-10-09 09:42:06",
          "bid_status": "0"
        },
        ......
      ],
      "comments": [
        {
          "id": "1",
          "pid": "0",
          "member_id": "1073",
          "order_id": "22",
          "content": "abc对xzb老师的评价，在学习管理阶段，选择不继续合作时",
          "status": "-1",
          "rating": "3",
          "type": "2",
          "book_id": "8",
          "add_time": "2014-09-26 17:04:14",
          "is_read": "0",
          "to_member_id": "0",
          "role": "1",
          "nickname": "nickname"
        },
        ......
      ],
      "products": [
        {
          "id": "2",
          "order_id": "22",
          "table_name": "bid",
          "table_id": "12",
          "title": "xzb服务925-d-2",
          "price": "5.00",
          "quantity": "1",
          "shipping": null,
          "status": "1",
          "add_time": "2014-09-25 18:12:37",
          "type": "0",
          "product_type": "bid",
          "nickname": "nickname"
        },
        ......
      ]
    },
    ......
  ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 订单id
@apiSuccess (return_title) {Integer} from_member_id 订单发起人id
@apiSuccess (return_title) {Integer} from_member_id 订单接收人id
@apiSuccess (return_title) {Integer} order_number 订单号
@apiSuccess (return_title) {Float} total 订单金额
@apiSuccess (return_title) {String} shipping 未知
@apiSuccess (return_title) {Integer} province 省份id
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {String} area 地区
@apiSuccess (return_title) {String} address 详细地址
@apiSuccess (return_title) {String} postcode 邮编
@apiSuccess (return_title) {String} name 收件人姓名
@apiSuccess (return_title) {String} phone 手机
@apiSuccess (return_title) {String} content 订单内容
@apiSuccess (return_title) {String} status 0：未付款订单，1：已付款订单，2：已发货订单，3：已收货订单，4：已评价订单，5：已申请退款，6：已同意退款 , 7：拒绝退款，8：退款已发货，9：已退款收货，10：申请仲裁，11：已同意换货
@apiSuccess (return_title) {String} add_time 下单时间
@apiSuccess (return_title) {String} group_num 未知
@apiSuccess (return_title) {String} send_time 发送时间
@apiSuccess (return_title) {String} pay_time 支付时间
@apiSuccess (return_title) {String} pay_time 未知
@apiSuccess (return_title) {String} bid_id 协议id
@apiSuccess (return_title) {String} demand_id 需求id
@apiSuccess (return_title) {String} history 订单历史
@apiSuccess (return_title) {String} comments 订单评论
@apiSuccess (return_title) {String} nickname 评论人昵称
@apiSuccess (return_title) {String} products 未知
@apiSuccess (return_title) {String} demand_member_id 发起需求的用户id
@apiSuccess (return_title) {String} service_member_id 提供服务的用户id
@apiSuccess (return_title) {Float} price 商品价格
@apiSuccess (return_title) {String} qq qq
@apiSuccess (return_title) {String} phone phone
@apiSuccess (return_title) {String} content 产品内容
@apiSuccess (return_title) {String} detail.type 如果table_name = 'bid' 1、单次答疑 2、单期答疑 3、多期答疑
@apiSuccess (return_title) {String} product_type 产品类型, bid: 协议, demand: 需求, book: 书, learning_period: 课程
@apiSuccess (return_title) {String} siging_remark 签约具体说明
@apiSuccess (return_title) {String} evalu_status 如果table_name = 'bid' 0未评价 1已评价
@apiSuccess (return_title) {String} status 如果table_name = 'bid' 0 未审核 1 已审核 2 发起签约 3老师同意拟定合同 4 学生同意合同（未支付） 5 学生提出修改 6 老师同意修改  7 学生已支付 8 交易完成
@apiSuccess (return_title) {String} add_time  创建时间
@apiSuccess (return_title) {String} buy_remark  未知

@apiError (error_title) 3017 该订单不存在
###

###
@api {get} /orders/expire/:n:unit 获取指定时间段的订单列表
@apiName orders_expire_get
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} n 数量 
@apiParam (request) {String} unit 单位，d: 天, w: 星期, m: 月, y: 年, c: 世纪
@apiParamExample 获取1天:
/orders/expire/1d
@apiParamExample 获取1周:
/orders/expire/1w
@apiParamExample 获取1月:
/orders/expire/1m
@apiParamExample 获取1年:
/orders/expire/1y
@apiParamExample 获取1世纪:
/orders/expire/1c

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
    {
      "id": "22",
      "from_member_id": "24398",
      "to_member_id": "1167",
      "order_number": "34898275",
      "total": "1.00",
      "shipping": "0.00",
      "province": "1",
      "city": "2",
      "area": "3",
      "address": "测试地址",
      "postcode": "111111",
      "name": "杨帆",
      "phone": "11111111111",
      "content": "",
      "status": "3",
      "add_time": "2014-10-09 09:42:06",
      "group_num": null,
      "send_time": null,
      "pay_time": null,
      "shipping_template_id": "0",
      "bid_id": "0",
      "demand_id": "0",
    },
    ......
  ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 订单id
@apiSuccess (return_title) {Integer} from_member_id 订单发起人id
@apiSuccess (return_title) {Integer} from_member_id 订单接收人id
@apiSuccess (return_title) {Integer} order_number 订单号
@apiSuccess (return_title) {Float} total 订单金额
@apiSuccess (return_title) {String} shipping 未知
@apiSuccess (return_title) {Integer} province 省份id
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {String} area 地区
@apiSuccess (return_title) {String} address 详细地址
@apiSuccess (return_title) {String} postcode 邮编
@apiSuccess (return_title) {String} name 收件人姓名
@apiSuccess (return_title) {String} phone 手机
@apiSuccess (return_title) {String} content 订单内容
@apiSuccess (return_title) {String} status 0：未付款订单，1：已付款订单，2：已发货订单，3：已收货订单，4：已评价订单，5：已申请退款，6：已同意退款 , 7：拒绝退款，8：退款已发货，9：已退款收货，10：申请仲裁，11：已同意换货
@apiSuccess (return_title) {String} add_time 下单时间
@apiSuccess (return_title) {String} group_num 未知
@apiSuccess (return_title) {String} send_time 发送时间
@apiSuccess (return_title) {String} pay_time 支付时间
@apiSuccess (return_title) {String} pay_time 未知
@apiSuccess (return_title) {String} bid_id 协议id
@apiSuccess (return_title) {String} demand_id 需求id

@apiError (error_title) 3016 订单类型不存在
###

###
@api {get} /product/:product_type/:product_id 获取指定类型和id的产品详情
@apiName product_detail_get
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} product_type 产品类型, bid: 协议, learning_periods: 课程, demand: 需求, book: 书 
@apiParam (request) {String} product_id 产品id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "id": "5",
    "demand_member_id": "12679",
    "service_member_id": "24398",
    "demand_id": "48",
    "service_demand_id": "29",
    "price": "56456.00",
    "qq": "1753453663",
    "phone": "15808862576",
    "content": "协议one<span style=\"color:#666666;font-family:'Microsoft YaHei'",
    "type": "2",
    "siging_remark": "双方约定期限，如一个月，并确定该期限内答疑/授课的次数。\n",
    "evalu_status": "0",
    "status": "-1",
    "add_time": "2014-09-27 17:51:15",
    "buy_remark": ""
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiError (error_title) 3021 商品类型错误
@apiError (error_title) 3022 该商品不存在
###

###
@api {get} /account/available_bankcards 获取当前用户可用银行卡
@apiName available_bankcards_get
@apiGroup Account
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
    {
      "id": "1",
      "member_id": "24398",
      "card_type": "1",
      "card_num": "xxxxxxxxxxxxxxxxxxxx",
      "card_name": "张xx",
      "add_time": "2014-09-01 12:03:56",
      "status": "2",
      "remark": "",
      "is_use": "0"
    },
    ...
  ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 银行卡的id
@apiSuccess (return_title) {String} member_id 银行卡所属用户
@apiSuccess (return_title) {String} card_num 银行卡的卡号
@apiSuccess (return_title) {String} card_type 银行卡的类型
@apiSuccess (return_title) {String} add_time 银行卡添加时间
@apiSuccess (return_title) {String} status 银行卡的状态， 0=未通过 1=审核中 2=通过 3=禁用
@apiSuccess (return_title) {String} remark 未知
@apiSuccess (return_title) {String} is_use 未知
###