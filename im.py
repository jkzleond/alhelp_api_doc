"""
@api {get} /im/message/rct_contacts/[:p]/[:ps] 获取最近联系人
@apiName contact:R
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 获取最近联系人

@apiUse header_token

@apiParam (request) {Interger} [p] 页码
@apiParam (request) {Interger} [ps] pagesize

@apiSuccessExample {json} 成功示例:
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
    "success": true,
    "data": [
    {
        "contact_id":"490",
        "nickname":"香草淇淋",
        "avatar":"",
        "message_content":"haha",
        "mime_type":"0",
        "goods_id":"321",
        "goods":{
            "id":"321",
            "pid":null,
            "member_id":"5262",
            "member_name":"太原理工大",
            "role_type":"2",
            "demand_type":"1",
            "require_identity":"0",
            "require_authenticate":"0",
            "require_security":"0",
            "description":"819《材料科学基础》考研03--13年真题答案和笔记",
            "content_demand":"...",
            "content_course":null,
            "content_reference":null,
            "remarks":null,
            "yy_number":null,
            "image":"超过上传限制：1",
            "cost_type":"1",
            "cost":"100",
            "platform_cost":"0",
            "profes_type":"1",
            "city":"34570",
            "university":"34931",
            "college":"34940",
            "major_code":null,
            "major":"80500",
            "qq":"229222343",
            "mobile":"229222343",
            "set_time":"0000-00-00 00:00:00",
            "close_remark":null,
            "rating":"0",
            "status":"1",
            "add_time":"2013-11-11 15:06:16",
            "update_time":null,
            "praise_num":"0",
            "review_num":"0",
            "learning_teaching_plan":null,
            "is_message":"0",
            "is_bid":"0",
            "is_contract":"0",
            "is_automatic":"0",
            "attachment":"",
            "set_yy":"",
            "member_nickname":"太原理工大",
            "collect_num":"0",
            "num_view":"81",
            "city_string":null,
            "university_string":null,
            "college_string":null,
            "major_string":null,
            "comments":null,
            "explains":null,
            "avator":"http:\/\/www.alhelp.net\/Ucenter\/images\/noavatar_small.gif"
        }
    },		
    {
        "contact_id":"516",
        "nickname":"鬼灰小钢匙",
        "avatar":"",
        "message_content":"haha",
        "mime_type":"0",
        "goods_id":"0"
    }
]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {String} contact_id 联系人ID
@apiSuccess (return_title) {String} nickname 联系人昵称
@apiSuccess (return_title) {String} avatar 联系人头像
@apiSuccess (return_title) {String} message_content 最近一条消息
@apiSuccess (return_title) {String=0,1,2} mime_type 消息类型 0:文本 1:图片 2:语音
@apiSuccess (return_title) {String} goods_id 消息关联商品ID
@apiSuccess (return_title) {JsonObject} goods 关联商品信息 字段同需求服务列表 

@apiUse error_auth
"""

"""
@api {post} /im/message/:type/:to_id\d$ 发送悄悄话和群聊
@apiName message:C
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 发送悄悄话和群聊
注: mime_type 为 1(图片) 或 2(语音) 时,需要先调用上传文件接口获取上传后资源的url, 此时content为url字符串
@apiUse header_token

@apiParam (request) {String=single, group} type 发送对象类型 single:用户, group:群
@apiParam (request) {Interger} to_id 发送对象ID 用户ID或群ID
@apiParam (request) {String} content 信息内容 
@apiParam (request) {Interger=0,1,2} mime_type 信息类型 0:文本, 1:图片, 2:语音

@apiParamExample {json} Body示例：
{
    "content": 'hello',
    "mime_type": 0
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {josn} 成功示例:
{
    "success": true,
    "data": null
}

@apiUse error_1001
"""

"""
@api {post} im/group$ 创建群
@apiName G_C1
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
创建群 <br>
注: image参数为url 需要先调用上传文件接口获取上传后资源的url

@apiParam (request) {String} name 群名称
@apiParam (request) {String} image logo图片url

@apiParamExample {json} Body示例:
{
    "name": "我的群",
    "image": "http://image.alhelp.net/images/0bbb95f2181d980b8ac13c89b692458567263ef4.jpg"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {String} id 群ID
@apiSUccess (return_title) {String} group_id 群号

@apiSUccessExample {json} 成功示例：
{
    "success": true,
    "data": {
        "id": '16',
        "group_id": '000016'
    }
}

@apiUse error_1001
@apiUse error_auth
@apiError (error_title) 1500 操作失败
"""

"""
@api {DELETE} im/group/:id\d$ 删除群
@apiName G_D1
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
删除群

@apiParam (request) {Interger} id 群名称

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSUccessExample {json} 成功示例：
{
    "success": true,
    "data": null
}

@apiError (error_title) 1500 操作失败
@apiUse error_1001
@apiUse error_auth
"""

"""
@api {PUT} im/group/:id\d$ 更新群
@apiName G_U1
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
更新

@apiParam (request) {Interger} id 群名称
@apiParam (request) {String} name 群名称
@apiParam (request) {String} image logo图片url 需要先调用上传文件接口获取上传后资源的url

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSUccessExample {json} 成功示例：
{
    "success": true,
    "data": null
}

@apiError (error_title) 1500 操作失败
@apiUse error_1001
@apiUse error_auth
"""

"""
@api {GET} im/group/:id\d$ 获取指定ID群信息
@apiName G_R1
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
更新

@apiParam (request) {Interger} id 群名称

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Interger} id 群ID
@apiSuccess (return_title) {String} group_id 群号
@apiSuccess (return_title) {String} name 群名称
@apiSuccess (return_title) {String} image 群logo图片url
@apiSuccess (return_title) {Interger} member_id 群成员数
@apiSuccess (return_title) {String} owner_id 群主ID
@apiSuccess (return_title) {String} owner_nickname 群主昵称
@apiSuccess (return_title) {String} add_time 创建时间


@apiSUccessExample {json} 成功示例：
{
    "success": true,
    "data": {
        "id": 16,
        "group_id": "000016"
        "name": "我们的群",
        "image": "http://image.alhelp.net/images/0bbb95f2181d980b8ac13c89b692458567263ef4.jpg",
        "member_num": 2,
        "owner_id": "12769",
        "owner_nickname": "某某"
        "add_time": "2016-01-01 00:00:00"
    }
}

@apiError (error_title) 1500 操作失败
@apiUse error_1001
@apiUse error_auth
"""