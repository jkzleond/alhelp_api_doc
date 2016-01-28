"""
@api {POST} /order 生成订单
@apiName gen_order
@apiGroup Order
@apiVersion 1.0.0
@apiDescription 生成订单,支持多商家多商品

@apiUse header_token

@apiParam (request) {JsonObject[]} items 清单列表
@apiParam (request) {Interger} address_id 收货人信息ID
@apiParam (参数:items) {Interger} bussiness_id 商户号(卖家的用户ID)
@apiParam (参数:items) {JsonObject[]} products 商品列表
@apiParam (参数:items) {Interger} shipping_template_id 运费模板ID
@apiParam (参数:items) {Number} shipping_price 邮费
@apiParam (参数:items) {String} remark 备注
@apiParam (参数:products) {String} table_name 商品类型(商品关联表名)
@apiParam (参数:products) {Interger} table_id 商品ID
@apiParam (参数:products) {Interger} quantity 商品数量(每个商品)

@apiParamExample {json} Body示例：
{
    'address_id': '13',
    'items': [
        {
            'business_id': '5262',
            'goods': [
                {
                    'type': 'book',
                    'id': '321',
                    'quantity': 10			
                },
                {
                    'type': 'book',
                    'id': '322',
                    'quantity': 5			
                }
            ],
            'shipping_template_id': '0',
            'shipping_price': '0.00',
            'remark': '给卖家的留言'
        },
        {
            'business_id': '5131',
            'goods': [
                {
                    'type': 'book',
                    'id': '151',
                    'quantity': 2			
                }
            ],
            'shipping_template_id': '0',
            'shipping_price': '0.00',
            'remark': '给卖家的留言'
        }
    ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {JsonObject[]} list 订单列表
@apiSuccess (return_data) {JsonObject[]} count 订单条目数
@apiSuccess (返回数据:list) {String} id 订单ID
@apiSuccess (返回数据:list) {String} order_num 订单号
@apiSuccess (返回数据:list) {String} group_num 字订单号
@apiSuccess (返回数据:list) {String} from_member_id 买家ID
@apiSuccess (返回数据:list) {String} to_member_id 卖家ID
@apiSuccess (返回数据:list) {String} total 订单金额
@apiSuccess (返回数据:list) {String} province 省代码
@apiSuccess (返回数据:list) {String} city 市代码
@apiSuccess (返回数据:list) {String} area 区代码
@apiSuccess (返回数据:list) {String} address 收货地址
@apiSuccess (返回数据:list) {String} post_code 邮编
@apiSuccess (返回数据:list) {String} name 收货人姓名 
@apiSuccess (返回数据:list) {String} phone 收货人电话
@apiSuccess (返回数据:list) {String} content 备注
@apiSuccess (返回数据:list) {String} shipping_template_id 邮费模板ID
@apiSuccess (返回数据:list) {String} shipping_price 邮费
@apiSuccess (返回数据:list) {String} add_time 订单生成时间


@apiSuccessExample {json} 成功示例:
{
    "success": true,
    "data": {
        list: [
            {
                "id":801
                "order_number":"23395770",
                "group_num":"14457981",
                "from_member_id":"31527",
                "to_member_id":1167,
                "total":15,
                "province":"1709",
                "city":"1710",
                "area":"1717",
                "address":"武汉大学三环学生公寓",
                "postcode":"434023",
                "name":"杨帆",
                "phone":"15272496375",
                "content":"给卖家的留言",
                "shipping_template_id":"0",
                "shipping":"0.00"
            },
            {
                "id":802
                "order_number":"23395770",
                "group_num":"16438470",
                "from_member_id":"31527",
                "to_member_id":8039,
                "total":2,
                "province":"1709",
                "city":"1710",
                "area":"1717",
                "address":"武汉大学三环学生公寓",
                "postcode":"434023",
                "name":"杨帆",
                "phone":"15272496375",
                "content":"给卖家的留言",
                "shipping_template_id":"0",
                "shipping":"0.00"
            }
        ],
        "count": 2 
    }
}

@apiUse error_1001
@apiUse error_auth
@apiError 1500 操作失败

"""

"""
@api {PUT} /order/pay/[:pay_type] 订单支付
@apiName order_pay
@apiGroup Order
@apiVersion 1.0.0
@apiDescription 订单支付

@apiUse header_token

@apiParam (request) {String='balance','alipay','wxpay'} [pay_type='balance'] 支付方式 blance: 余额支付, alipay: 支付宝,
wxpay:微信
@apiParam (body参数) {Interger[]} order_ids 订单ID列表

@apiParamExample {json} Body示例:
{
    "order_ids": [570, 594]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例:
{
    "success": true,
    "data": null
}
@apiUse error_1001
@apiUse error_auth
@apiError 3020 余额不足(余额支付时)
@apiError 1500 操作失败
"""