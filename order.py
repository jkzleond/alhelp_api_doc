"""
@api {POST} v1/order 生成订单
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

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {JsonObject[]} list 订单列表
@apiSuccess (return_data) {JsonObject[]} count 订单条目数
@apiSuccess (返回数据list) {String} id 订单ID
@apiSuccess (返回数据list) {String} order_num 订单号
@apiSuccess (返回数据list) {String} group_num 字订单号
@apiSuccess (返回数据list) {String} from_member_id 买家ID
@apiSuccess (返回数据list) {String} to_member_id 卖家ID
@apiSuccess (返回数据list) {String} total 订单金额
@apiSuccess (返回数据list) {String} province 省代码
@apiSuccess (返回数据list) {String} city 市代码
@apiSuccess (返回数据list) {String} area 区代码
@apiSuccess (返回数据list) {String} address 收货地址
@apiSuccess (返回数据list) {String} post_code 邮编
@apiSuccess (返回数据list) {String} name 收货人姓名 
@apiSuccess (返回数据list) {String} phone 收货人电话
@apiSuccess (返回数据list) {String} content 备注
@apiSuccess (返回数据list) {String} shipping_template_id 邮费模板ID
@apiSuccess (返回数据list) {String} shipping_price 邮费
@apiSuccess (返回数据list) {String} add_time 订单生成时间


@apiSuccessExample {json} 成功示例:
{
    "success": true,
    "data": {
        list: [
            {
                "id": "793",
                "order_num" => "60947062",
                "group_num" => "74361729",
                "from_member_id" => "24398",
                "to_member_id" => "22784",
                "total" => "200.00",
                "province" => "2600",
                "city" => "2601",
                "area" => "2605",
                "address" => "云纺国际商厦a座",
                "postcode" => "655400",
                "name"=> "xx",
                "phone" => "137xxxxxxxx",
                "content" => "",
                "shipping_template_id" => "0",
                "shipping" => "0.00",
                "add_time" => "2015-11-03 21:38:55"
            }
        ],
        count: 1 
    }
}

"""