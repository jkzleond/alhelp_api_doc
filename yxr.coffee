###
@api {put} /find_password 密码找回
@apiName find_password
@apiGroup User
@apiVersion 1.0.0


@apiParam (request) {String} phone 手机号码
@apiParam (request) {object} verify 验证数据体
@apiParam (request) {String} password 新密码
@apiParam (request) {String} confirmPassword 确认密码


@apiParam (请求参数：verify) {String} code 短信验证码
@apiParam (请求参数：verify) {String} signKey 短信签名密钥

@apiParamExample {json} Body示例：
{
  "findPassword": {
    "phone": "13708447485",
    "verify": {
      "code":"866010",
      "signKey":"vnsr8co48ja3cfhgj0p835eqk7"
    },
    "password": "123456",
    "confirmPassword": "123456"
  }
}

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 2001 两次输入的密码不一致
@apiError (error_title) 2002 密码格式不正确
@apiError (error_title) 2003 账号信息填写错误（手机号码、密码等）
@apiError (error_title) 2004 新密码和原始密码相同
@apiError (error_title) 9001 系统错误
###



###
@api {put} /set_pwd 密码重置
@apiName set_pwd
@apiGroup User
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} passwordInfo 密码信息

@apiParam (请求参数：passwordInfo) {String} oldPassword 原来的密码
@apiParam (请求参数：passwordInfo) {String} password  新设置的密码
@apiParam (请求参数：passwordInfo) {String} confirmPassword 确认密码

@apiParamExample {json} Body示例：
{
  "passwordInfo":{
    "oldPassword":"meiyoumima",
    "password":"meiyoumima",
    "confirmPassword":"meiyoumima"
  }
}

@apiSuccessExample {json} 成功示例：
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 2001 两次输入的密码不一致
@apiError (error_title) 2002 密码格式不正确
@apiError (error_title) 2003 账号信息填写错误（手机号码、密码等）
@apiError (error_title) 2004 新密码和原始密码相同
@apiError (error_title) 9001 系统错误
###


###
@api {put} /set_user_status 用户状态设置(冻结/启用)
@apiName set_user_status
@apiGroup User
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} member 用户信息

@apiParam (请求参数：member) {String} status 用户状态（true：激活、false：冻结）

@apiParamExample {json} Body示例：
{
  "member":{
    "status":"false"
  }
}

@apiSuccessExample {json} 成功示例：
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
@apiError (error_title) 2005 参数值错误
###


###
@api {post} /create_test_listen 试听申请
@apiName create_test_listen
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} listen 试听申请

@apiParam (请求参数：listen) {String} time 申请试听时间（时间戳、不需要毫秒）
@apiParam (请求参数：listen) {String} content 申请试听内容
@apiParam (请求参数：listen) {object} listen_method 联系方式
@apiParam (请求参数：listen) {object} demand 服务

@apiParam (请求参数：listen：listen_method) {String} type 联系方式类别(1、表示YY  2、表示QQ    3、表示Skype)
@apiParam (请求参数：listen：listen_method) {String} number 联系号码

@apiParam (请求参数：listen：demand) {String} id 服务的ID

@apiParamExample {json} Body示例：
{
  "listen":{
    "time":"1570446764",
    "content":"1testtest",
    "listen_method":{
      "type":"1",
      "number":"2123456"
    },
    "demand":{
      "id":"4577"
    }
  }
}

@apiSuccess (return_data) {String} listen_id 试听申请ID
@apiSuccess (return_data) {String} bid_id 投标ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "listen_id": 434,
    "bid_id": 205
  }
}

@apiUse error_1001
@apiError (error_title) 5001 时间错误 
@apiError (error_title) 5002 试听方式不正确 
@apiError (error_title) 5003 申请试听服务不存在 
@apiError (error_title) 5004 已申请试听  
###


###
@api {get} /demands/listen/lists 申请试听列表
@apiName /demands/listen/lists
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "prevPage": null,
    "nextPage": "http://api.alhelp.net/v1/demands/listen/lists?p=2",
    "list": [
      {
        "id": "404",
        "member_id": "14257",
        "demand_member_id": "1167",
        "demand_id": "2358",
        "bid_id": "172",
        "time": "2015-01-28 01:00:00",
        "content": "预约试听测试，接收方能否收到消息",
        "listen_type": "2",
        "listen_number": "1111",
        "listen_class": "0",
        "status": "1",
        "add_time": "2015-01-12 00:11:36"
      }
    ]
  }
}

@apiUse error_1001  
###



###
@api {get} /demands/signType 获取签约类型
@apiName demands/signType
@apiGroup Demand
@apiVersion 1.0.0

@apiSuccessExample {json} 成功示例：
{
  "success": true,
  "data": [
    {
      "id": 1,
      "title": "单次答疑",
      "content": [
        "如复试的答疑/授课，可以选择单次答疑/授课。",
        "签订合同后，学生一次性支付款项。",
        "答疑/授课结束后，除非特殊情况，款项会立即支付给老师。"
      ]
    },
    {
      "id": 2,
      "title": "单期答疑",
      "content": [
        "双方约定期限，如一个月，并确定该期限内答疑/授课的次数。",
        "签订合同后，学生一次性付款。 在该期限内没有用完答疑/授课次数的，可以申请延期最多一个期限，但不能申请退款。（如果在该期限结束后的2个工作内没有申请的，系统会自动付款给老师）",
        "在该期限内提前用完答疑/授课次数的，还需要答疑/授课的，需要签订新的协议，支付款项后才能进行答疑/授课。",
        "延期期限结束后，无论是否用完答疑/授课次数，系统都会自动付款给老师。"
      ]
    },
    {
      "id": 3,
      "title": "多期答疑",
      "content": [
        "双方约定需要答疑/授课的阶段，以及每个阶段需要答疑/授课的次数和费用等。",
        "签订合同后，学生一次性付款到新助邦托管，由新助邦分阶段支付给老师。",
        "在每个阶段结束后，由老师提交答疑/授课记录，申请释放本阶段款项。",
        "如果学生对老师的答疑/授课不满意，可以在老师申请释放本阶段款项后的2天内提出终止协议。本阶段的费用会支付给老师，但余下阶段的款项会退回给学生。",
        "在老师提出申请后的2天内，学生没有答复的，视为满意。本阶段的费用会自动支付给老师，同时进入到下一阶段。",
        "一旦进入到下一阶段，双方都不能中途终止协议，否则视为违约。",
        "如果是老师违约，老师将拿不到该阶段的费用，无论答疑/授课过多少次。",
        "如果是学生违约，学生本阶段的费用都会全部支付给老师，无论答疑/授课过多少次。",
        "在每个阶段如有延期申请，最多只能延期一个周期。"
      ]
    }
  ]
}

@apiUse error_1001
###


###
@api {post} /create_sign 申请签约   （做了调整，请求角色学生）
@apiName create_sign
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} sign 签约申请

@apiParam (请求参数：sign) {String} demand_id 服务ID
@apiParam (请求参数：sign) {String} sign_type 签约类型
@apiParam (请求参数：sign) {String} describe 签约描述 

@apiParamExample {json} Body示例：
{
  "sign":{
      "demand_id":"208",
      "sign_type":"2",
      "describe":"fefewfew"
  }
}

@apiSuccessExample {json} 成功示例：
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 5981 用户省份必须是学生 
@apiError (error_title) 5980 你已经对此服务签约,此服务还没有结束 
###



###
@api {post} /create_contract 拟定合同
@apiName create_contract
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} contract 合同

@apiParam (请求参数：sign) {String} bid_id 投标ID
@apiParam (请求参数：sign) {String} title 合同标题
@apiParam (请求参数：sign) {String} content 合同内容

@apiParamExample {json} Body示例：
{
  "contract":{
      "bid_id":"208",
      "title":"2",
      "content":"fefewfew"
  }
}

@apiSuccess (return_data) {String} contract_id 合同ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "contract_id": 434
  }
}

@apiUse error_1001
@apiError (error_title) 5006 投标数据不存在 
@apiError (error_title) 5007 合同创建失败 
###



###
@api {put} /edit_contract 修改合同
@apiName edit_contract
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} contract 合同

@apiParam (请求参数：sign) {String} id 合同ID
@apiParam (请求参数：sign) {String} remark 修改的内容

@apiParamExample {json} Body示例：
{
  "contract":{
      "id":"208",
      "remark":"2"
  }
}

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 5008 合同修改失败 
@apiError (error_title) 5009 标不存在 
###




###
@api {put} /yes_contract 同意合同
@apiName yes_contract
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} contract 合同

@apiParam (请求参数：sign) {String} id 合同ID

@apiParamExample {json} Body示例：
{
  "contract":{
      "id":"208",
  }
}

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001
@apiError (error_title) 5010 修改数据失败 
@apiError (error_title) 5009 标不存在 
###




###
@api {get} /demands/info/4579 答疑详情
@apiName /demands/info/4579
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 答疑ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "id": "4596",
    "pid": null,
    "member_id": "21390",
    "member_name": "221390",
    "role_type": "2",
    "demand_type": "2",
    "require_identity": "0",
    "require_authenticate": "0",
    "require_security": "0",
    "description": "细致的考研辅导",
    "content_demand": "电磁场相关复习，短时间大突破",
    "content_course": null,
    "content_reference": null,
    "remarks": null,
    "yy_number": null,
    "image": null,
    "cost_type": "1",
    "cost": "99",
    "platform_cost": "0",
    "profes_type": "1",
    "city": "700000",
    "university": "704000",
    "college": "704008",
    "major_code": "080904",
    "major": "704010",
    "qq": "274362408",
    "mobile": null,
    "set_time": null,
    "close_remark": null,
    "rating": "0",
    "status": "1",
    "add_time": "2015-08-09 01:34:22",
    "update_time": null,
    "praise_num": "0",
    "review_num": "0",
    "learning_teaching_plan": null,
    "is_message": "0",
    "is_bid": "0",
    "is_contract": "0",
    "is_automatic": "0",
    "attachment": "",
    "set_yy": "",
    "member_nickname": "221390",
    "collect_num": "0",
    "num_view": "36",
    "isAudition": 1,
    "isSign": 0
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 需求id
@apiSuccess (return_title) {Integer} member_id 发布用户的id
@apiSuccess (return_title) {String} member_name 发布用户的名称
@apiSuccess (return_title) {Integer} role_type 角色类型，1：学生 2：教师
@apiSuccess (return_title) {Integer} demand_type 需求类型， 1：资料 2：答疑 3：授课 4：直播课
@apiSuccess (return_title) {String} description 需求描述
@apiSuccess (return_title) {String} content_demand 需求详情
@apiSuccess (return_title) {String} image 图片
@apiSuccess (return_title) {Integer} cost_type 收费类型，1：免费 2：收费
@apiSuccess (return_title) {Integer} platform_cost 平台管理费
@apiSuccess (return_title) {Integer} cost 费用
@apiSuccess (return_title) {Integer} profes_type 专业类型， 1：非统考 2：统考 3：公共课
@apiSuccess (return_title) {Integer} city 城市代码
@apiSuccess (return_title) {Integer} university 大学代码
@apiSuccess (return_title) {Integer} college 学院代码
@apiSuccess (return_title) {Integer} major 专业代码
@apiSuccess (return_title) {String} qq qq号码
@apiSuccess (return_title) {String} mobile 手机号码
@apiSuccess (return_title) {String} set_time 有效期
@apiSuccess (return_title) {String} add_time 需求创建时间
@apiSuccess (return_title) {String} update_time 需求更新时间
@apiSuccess (return_title) {String} close_remark 关闭原因
@apiSuccess (return_title) {Integer} rating 未知
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核 1 已审核 2 未通过
@apiSuccess (return_title) {Integer} praise_num 被赞数量
@apiSuccess (return_title) {Integer} review_num 被评论数量
@apiSuccess (return_title) {Integer} learning_teaching_plan 授课计划的id
@apiSuccess (return_title) {Integer} is_message 是否有悄悄话（0：没有悄悄话，1：有新悄悄话）
@apiSuccess (return_title) {Integer} is_bid 是否有投标（0：没有投标，1：有新投标）
@apiSuccess (return_title) {Integer} is_contract 是否有协议（0：没有协议，1：有新协议）
@apiSuccess (return_title) {Integer} is_automatic 1:自动产生
@apiSuccess (return_title) {Integer} attachment 附件（填写百度网盘地址）
@apiSuccess (return_title) {String} set_yy 未知
@apiSuccess (return_title) {String} member_nickname 发布用户的昵称
@apiSuccess (return_title) {String} isAudition 1表示可以试听 0表示不可以试听
@apiSuccess (return_title) {String} isSign 1表示可以签约 0表示不可以签约

@apiUse error_1001
@apiError (error_title) 5011 数据不存在
###



###
@api {get} /demands/bookinfo/4732 资料详情
@apiName /demands/bookinfo/4732
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 资料ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "id": "4732",
    "pid": null,
    "member_id": "24239",
    "member_name": "hxdssacyr",
    "role_type": "2",
    "demand_type": "1",
    "require_identity": "0",
    "require_authenticate": "0",
    "require_security": "0",
    "description": "长期辅导安大商学院考研学子专业课",
    "content_demand": "长期辅导安大商学院考研学子专业课",
    "content_course": null,
    "content_reference": null,
    "remarks": null,
    "yy_number": null,
    "image": null,
    "cost_type": "1",
    "cost": "10",
    "platform_cost": "0",
    "profes_type": "1",
    "city": "1200000",
    "university": "1200001",
    "college": "1200123",
    "major_code": "",
    "major": "0",
    "qq": "1072766122",
    "mobile": "13275865669",
    "set_time": null,
    "close_remark": null,
    "rating": "0",
    "status": "1",
    "add_time": "2015-09-14 17:28:22",
    "update_time": null,
    "praise_num": "0",
    "review_num": "0",
    "learning_teaching_plan": null,
    "is_message": "0",
    "is_bid": "0",
    "is_contract": "0",
    "is_automatic": "0",
    "attachment": "",
    "set_yy": "",
    "member_nickname": "hxdssacyr",
    "collect_num": "0",
    "num_view": "20"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 需求id
@apiSuccess (return_title) {Integer} member_id 发布用户的id
@apiSuccess (return_title) {String} member_name 发布用户的名称
@apiSuccess (return_title) {Integer} role_type 角色类型，1：学生 2：教师
@apiSuccess (return_title) {Integer} demand_type 需求类型， 1：资料 2：答疑 3：授课 4：直播课
@apiSuccess (return_title) {String} description 需求描述
@apiSuccess (return_title) {String} content_demand 需求详情
@apiSuccess (return_title) {String} image 图片
@apiSuccess (return_title) {Integer} cost_type 收费类型，1：免费 2：收费
@apiSuccess (return_title) {Integer} platform_cost 平台管理费
@apiSuccess (return_title) {Integer} cost 费用
@apiSuccess (return_title) {Integer} profes_type 专业类型， 1：非统考 2：统考 3：公共课
@apiSuccess (return_title) {Integer} city 城市代码
@apiSuccess (return_title) {Integer} university 大学代码
@apiSuccess (return_title) {Integer} college 学院代码
@apiSuccess (return_title) {Integer} major 专业代码
@apiSuccess (return_title) {String} qq qq号码
@apiSuccess (return_title) {String} mobile 手机号码
@apiSuccess (return_title) {String} set_time 有效期
@apiSuccess (return_title) {String} add_time 需求创建时间
@apiSuccess (return_title) {String} update_time 需求更新时间
@apiSuccess (return_title) {String} close_remark 关闭原因
@apiSuccess (return_title) {Integer} rating 未知
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核 1 已审核 2 未通过
@apiSuccess (return_title) {Integer} praise_num 被赞数量
@apiSuccess (return_title) {Integer} review_num 被评论数量
@apiSuccess (return_title) {Integer} learning_teaching_plan 授课计划的id
@apiSuccess (return_title) {Integer} is_message 是否有悄悄话（0：没有悄悄话，1：有新悄悄话）
@apiSuccess (return_title) {Integer} is_bid 是否有投标（0：没有投标，1：有新投标）
@apiSuccess (return_title) {Integer} is_contract 是否有协议（0：没有协议，1：有新协议）
@apiSuccess (return_title) {Integer} is_automatic 1:自动产生
@apiSuccess (return_title) {Integer} attachment 附件（填写百度网盘地址）
@apiSuccess (return_title) {String} set_yy 未知
@apiSuccess (return_title) {String} member_nickname 发布用户的昵称

@apiUse error_1001
@apiError (error_title) 5011 数据不存在
###





###
@api {get} /address/lists 收货人列表
@apiName address/lists
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "75",
      "member_id": "24476",
      "address": "华人街363号",
      "postcode": "10010",
      "name": "任性",
      "defaultaddress": "0",
      "phone": "110",
      "add_time": "2015-11-03 15:31:42",
      "province": "北京",
      "province_id": "1",
      "city": "北京市",
      "city_id": "2",
      "area": "东城区",
      "area_id": "3"
    },
    {
      "id": "76",
      "member_id": "24476",
      "address": "华人街363号",
      "postcode": "10010",
      "name": "任性",
      "defaultaddress": "0",
      "phone": "110",
      "add_time": "2015-11-03 16:08:35",
      "province": "北京",
      "province_id": "1",
      "city": "北京市",
      "city_id": "2",
      "area": "东城区",
      "area_id": "3"
    }
  ]
}

@apiError (error_title) 9001 系统错误
###



###
@api {get} /address/info/78 收货人详情
@apiName address/info
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 联系人ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "78",
      "member_id": "24476",
      "address": "华人街363号33333",
      "postcode": "10010",
      "name": "任性",
      "defaultaddress": "0",
      "phone": "110",
      "add_time": "2015-11-03 16:39:18",
      "province": [
        {
          "id": "1",
          "title": "北京"
        },
        {
          "id": "21",
          "title": "天津"
        },
        {
          "id": "41",
          "title": "河北"
        }
      ],
      "province_id": "1",
      "city": [
        {
          "id": "2",
          "title": "北京市"
        }
      ],
      "city_id": "2",
      "area": [
        {
          "id": "3",
          "title": "东城区"
        },
        {
          "id": "4",
          "title": "西城区"
        }
      ],
      "area_id": "3"
    }
  ]
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###



###
@api {get} /areas/lists/0 获取省市县
@apiName areas/lists
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 分类父ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "1",
      "title": "北京"
    },
    {
      "id": "1826",
      "title": "湖南"
    },
    {
      "id": "1963",
      "title": "广东"
    }
  ]
}

@apiError (error_title) 9001 系统错误
###



###
@api {post} /address/add 添加收货人
@apiName address/add
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} address 联系人信息

@apiParam (请求参数：address) {String} province_id 省份ID
@apiParam (请求参数：address) {String} city_id 城市ID
@apiParam (请求参数：address) {String} area_id 区域ID
@apiParam (请求参数：address) {String} address 详细地址
@apiParam (请求参数：address) {String} postcode 邮箱 
@apiParam (请求参数：address) {String} name 联系人 
@apiParam (请求参数：address) {String} phone 联系人电话
@apiParam (请求参数：address) {String} defaultaddress 默认收货人  1:是 0:否

@apiParamExample {json} Body示例：
{
    "address":{
        "province_id":1,
        "city_id":3,
        "area_id":5,
        "address":"fewfwe",
        "postcode":"213123",
        "name":"fwefwe",
        "phone":"110",
        "defaultaddress":0
    }
}


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": 79
}

@apiUse error_1001
@apiError (error_title) 9001 系统错误
###




###
@api {delete} /address/delete/76 删除收货人
@apiName address/delete
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiError (error_title) 9001 系统错误
###




###
@api {put} /address/edit 修改收货人
@apiName address/edit
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} address 联系人信息

@apiParam (请求参数：address) {String} id 联系人id
@apiParam (请求参数：address) {String} province_id 省份ID
@apiParam (请求参数：address) {String} city_id 城市ID
@apiParam (请求参数：address) {String} area_id 区域ID
@apiParam (请求参数：address) {String} address 详细地址
@apiParam (请求参数：address) {String} postcode 邮箱 
@apiParam (请求参数：address) {String} name 联系人 
@apiParam (请求参数：address) {String} phone 联系人电话


@apiParamExample {json} Body示例：
{
    "address":{
        "id":78,
        "province_id":1,
        "city_id":3,
        "area_id":5,
        "address":"fewfwe",
        "postcode":"213123",
        "name":"fwefwe",
        "phone":"110"
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
###



###
@api {get} /address/default/76 设置默认收货人
@apiName address/default
@apiGroup Address
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 收货人ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiError (error_title) 9001 系统错误
###


###
@api {get} /demands/recommend/:type/:id 推荐列表
@apiName /demands/recommend
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {string} type demand_type:需求类型,demand_id:者需求ID
@apiParam (request) {int} id  demand_type值 1、2、3、4    

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "prevPage": null,
    "nextPage": "http://api.alhelp.net/v1/demands/recommend/demand_id/2134?p=2",
    "list": [
      {
        "id": "4766",
        "pid": null,
        "member_id": "24682",
        "member_name": "xzb224682",
        "role_type": "1",
        "demand_type": "3",
        "require_identity": "0",
        "require_authenticate": "0",
        "require_security": "0",
        "description": "求微观经济学视频课",
        "content_demand": "<p style=\"text-indent:2em;\">\r\n\t<span style=\"font-family:SimSun;font-size:16px;\">求微观经济学视频课</span>\r\n</p>",
        "content_course": null,
        "content_reference": null,
        "remarks": null,
        "yy_number": null,
        "image": "",
        "cost_type": "1",
        "cost": "20",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "1200000",
        "university": "1200001",
        "college": "1200009",
        "major_code": "020205",
        "major": "1200019",
        "qq": "874545609",
        "mobile": "",
        "set_time": null,
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2015-09-29 23:55:18",
        "update_time": "2015-10-17 12:02:17",
        "praise_num": "0",
        "review_num": "0",
        "learning_teaching_plan": null,
        "is_message": "0",
        "is_bid": "0",
        "is_contract": "0",
        "is_automatic": "0",
        "attachment": "",
        "set_yy": "",
        "member_nickname": "xzb224682",
        "collect_num": "0",
        "num_view": "65"
      }
    ]
  }
}

@apiUse error_1001 
###

###
@api {get} /demands/collaborates 合作列表
@apiName demands/collaborates
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "prevPage": null,
    "nextPage": "http://api.alhelp.net/demand/collaborates?p=2",
    "list": [
      {
        "id": "75",
        "pid": null,
        "member_id": "5095",
        "member_name": "yjhkzy",
        "role_type": "1",
        "demand_type": "1",
        "require_identity": "1",
        "require_authenticate": "1",
        "require_security": "1",
        "description": "求云南师范大学英语学科教育专业课复习资料",
        "content_demand": "我是自考本科毕业，现在边上班边考研，十月底才开始准备，急需云南师范大学专业课复习资料[高级英语和333教育综合},肯请各位学长或老师帮帮忙，此事如有进展请速至电于我，谢谢!",
        "content_course": null,
        "content_reference": null,
        "remarks": null,
        "yy_number": null,
        "image": "",
        "cost_type": "1",
        "cost": "200",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "47206",
        "university": "48125",
        "college": "48191",
        "major_code": null,
        "major": "45108",
        "qq": "604820087",
        "mobile": "604820087",
        "set_time": "0000-00-00 00:00:00",
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2013-10-25 22:17:50",
        "update_time": null,
        "praise_num": "0",
        "review_num": "0",
        "learning_teaching_plan": null,
        "is_message": "0",
        "is_bid": "0",
        "is_contract": "0",
        "is_automatic": "0",
        "attachment": "",
        "set_yy": "",
        "member_nickname": "yjhkzy",
        "collect_num": "0",
        "num_view": "52"
      }
    ]
  }
}

@apiUse error_1001 
###

###
@api {get} /demands/collaborates/:demand_id$ 合作列表
@apiName demands/collaborates
@apiGroup Demand
@apiVersion 1.0.1

@apiDescription 获取指定ID需求的合作列表

@apiUse header_token

@apiParam {Interger} demand_id 需求ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "prevPage": null,
    "nextPage": "http://api.alhelp.net/demand/collaborates?p=2",
    "list": [
      {
        "id": "75",
        "pid": null,
        "member_id": "5095",
        "member_name": "yjhkzy",
        "role_type": "1",
        "demand_type": "1",
        "require_identity": "1",
        "require_authenticate": "1",
        "require_security": "1",
        "description": "求云南师范大学英语学科教育专业课复习资料",
        "content_demand": "我是自考本科毕业，现在边上班边考研，十月底才开始准备，急需云南师范大学专业课复习资料[高级英语和333教育综合},肯请各位学长或老师帮帮忙，此事如有进展请速至电于我，谢谢!",
        "content_course": null,
        "content_reference": null,
        "remarks": null,
        "yy_number": null,
        "image": "",
        "cost_type": "1",
        "cost": "200",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "47206",
        "university": "48125",
        "college": "48191",
        "major_code": null,
        "major": "45108",
        "qq": "604820087",
        "mobile": "604820087",
        "set_time": "0000-00-00 00:00:00",
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2013-10-25 22:17:50",
        "update_time": null,
        "praise_num": "0",
        "review_num": "0",
        "learning_teaching_plan": null,
        "is_message": "0",
        "is_bid": "0",
        "is_contract": "0",
        "is_automatic": "0",
        "attachment": "",
        "set_yy": "",
        "member_nickname": "yjhkzy",
        "collect_num": "0",
        "num_view": "52"
      }
    ]
  }
}

@apiUse error_1001 
###


###
@api {delete} /demands/delete/:id 删除需求/服务
@apiName /demands/delete
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 服务/需求 ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001 
@apiError (error_title) 5011 数据不存在
@apiError (error_title) 9001 系统错误
###


###
@api {post} /demands/explain 补充说明
@apiName /demands/explain
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} explain 试听申请

@apiParam (请求参数：explain) {String} demand_id 需求/服务ID
@apiParam (请求参数：explain) {String} content 内容


@apiParamExample {json} Body示例：
{
 "explain":{
     "demand_id":1234,
     "content":"meiyoumima"
   }
}



@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": 333  //记录ID
}

@apiUse error_1001
@apiError (error_title) 5997 服务/需求不存在
@apiError (error_title) 5995 补充说明录入失败
###


###
@api {post} /demands/demandExplainLists/:id 补充说明列表
@apiName /demands/demandExplainLists
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {int} id 服务/需求 ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "288",
      "member_id": "24484",
      "demand_id": "1234",
      "content": "meiyoumima",
      "status": "1",
      "add_time": "2015-11-21 11:43:02"
    }
  ]
}

@apiUse error_1001
###


###
@api {get} /demands/down/:id 上架
@apiName /demands/down
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 服务/需求 ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001 
@apiError (error_title) 5011 数据不存在
@apiError (error_title) 9001 系统错误
###

###
@api {get} /demands/up/:id 下架
@apiName /demands/up
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 服务/需求 ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiUse error_1001 
@apiError (error_title) 5011 数据不存在
@apiError (error_title) 9001 系统错误
###



###
@api {post} /demands/bid 协议详情
@apiName demands/bid
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {object} bid 协议 

@apiParam (请求参数：bid) {String} type  值为 bid  demand
@apiParam (请求参数：bid) {int} id   bid协议表ID    demand服务/需求ID

@apiParamExample {json} Body示例：
{
    "bid":{
        "type":"demand",
        "id":"4508"
    }
}

@apiSuccessExample {json} 成功示例：
{
  "success": true,
  "data": {
    "id": "197",
    "demand_member_id": "1167",
    "service_member_id": "15892",
    "demand_id": "4509",
    "service_demand_id": "4508",
    "price": "0.00",
    "qq": null,
    "phone": "15808862575",
    "content": null,
    "type": "0",
    "siging_remark": null,
    "evalu_status": "0",
    "status": "0",
    "add_time": "2015-07-23 19:54:03",
    "buy_remark": ""
  }
}

@apiUse error_1001
@apiError (error_title) 5990 type 值只能为bid或者demand
###










