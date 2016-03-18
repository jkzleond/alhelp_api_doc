"""
@api {get} /im/message/rct_contacts/[:p]/[:ps] 获取最近联系人
@apiName 1
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 获取最近联系人

@apiUse header_token

@apiParam (request) {Integer} [p] 页码
@apiParam (request) {Integer} [ps] pagesize

@apiSuccessExample {json} 成功示例:
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
    "success": true,
    "data": [
    {
        "contact_id":"490",
        "no_read_count": "2",
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
        "no_read_count": "2"
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
@apiSuccess (data数据) {JsonObject[]} list 最近联系人列表
@apiSuccess (list元素数据) {String} contact_id 联系人ID
@apiSuccess (list元素数据) {Integer} no_read_count 未读消息条数
@apiSuccess (list元素数据) {String} nickname 联系人昵称
@apiSuccess (list元素数据) {String} avatar 联系人头像
@apiSuccess (list元素数据) {String} message_content 最近一条消息
@apiSuccess (list元素数据) {String=0,1,2} mime_type 消息类型 0:文本 1:图片 2:语音
@apiSuccess (list元素数据) {String} goods_id 消息关联商品ID
@apiSuccess (list元素数据) {JsonObject} goods 关联商品信息 字段同需求服务列表 

@apiUse error_auth
"""

"""
@api {post} /im/message/:type/:to_id\d$ 发送悄悄话和群聊
@apiName 2
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 发送悄悄话和群聊
注: mime_type 为 1(图片) 或 2(语音) 时,需要先调用上传文件接口获取上传后资源的url, 此时content为url字符串
@apiUse header_token

@apiParam (request) {String=single, group} type 发送对象类型 single:用户, group:群
@apiParam (request) {Integer} to_id 发送对象ID 用户ID或群ID
@apiParam (request) {String} content 信息内容 
@apiParam (request) {Integer=0,1,2} mime_type 信息类型 0:文本, 1:图片, 2:语音, 3:文件

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
    "data": {
        'id': '321'
        'content': 'http://www.alhelp.net/attachment/xxxxx.txt',
        'mime_type': '3',
        'filename': 'xxxxx.txt',
        'type': '1',
        'is_to_group': '1'
        'from_member_id': 32571,
        'to_id': 20352,
        'is_read': 0,
        'add_time': 'xxxx-xx-xx xx:xx:xx'
    }
}

@apiUse error_1001
"""

"""
@api {get} /im/message/history/:type/:to_id/[:p]/[:ps] 获取跟某个用户或群的聊天记录
@apiName get_history
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 获取跟某个用户或群的聊天记录

@apiUse header_token
@apiParam (request) {String="single", "group"} type="single" single:用户, group:群
@apiParam (request) {Integer} to_id 用户ID或群ID
@apiParam (request) {Integer} [p]   页码
@apiParam (request) {Integer} [ps]  每页条目数

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (data数据) {JsonObject[]} list 聊天记录列表
@apiSuccess (data数据) {Integer} count  数据条目数
@apiSuccess (data数据) {Integer} total_rows  数据总数
@apiSuccess (data数据) {Integer} total_pages 总页数
@apiSuccess (list元素数据) {Integer} id 消息ID
@apiSuccess (list元素数据) {String} content 消息内容
@apiSuccess (list元素数据) {Integer} mime_type 消息内容类型 0:文本, 1:图片, 2:语音
@apiSuccess (list元素数据) {Integer} is_read 已读标记
@apiSuccess (list元素数据) {Integer} to_id 发送给的用户ID
@apiSuccess (list元素数据) {Integer} from_member_id 发送者用户ID
@apiSuccess (list元素数据) {Integer} is_to_group 是否是群消息
@apiSuccess (list元素数据) {String}  add_time 发送时间
@apiSuccess (list元素数据) {Integer} type 消息类型 1: IM消息

@apiSuccessExample {json} 成功示例:
{
    "success":true,
    "data":{
        "list":[
            {
                "id":"5",
                "content":"haha",
                "mime_type":"0",
                "is_read":"0",
                "to_id":"31527",
                "from_member_id":"516",
                "goods_id":"0",
                "is_to_group":"0",
                "add_time":"2016-01-29 15:13:57",
                "type":"1" // 1:为IM消息
            }
        ],
        "count":3,
        "total_rows":"3",
        "total_pages":1
    }
}

@apiUse error_1001
@apiUse error_auth
"""

"""
@api {get} /im/message/no_read/[:type]/[:from_id]/[:p]/[:ps] 获取未读消息
@apiName get_no_read_msg
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 获取未读消息

@apiUse header_token

@apiParam (request) {String="single", "group"} [type] 聊天类型 single:用户, group:群
@apiParam (request) {Integer} [from_id] 联系人ID(用户名ID或群ID)
@apiParam (request) {Integer} [p]   页码
@apiParam (request) {Integer} [ps]  每页条目数
@apiParam (request) {Integer} [_] 起始时间戳(秒)

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (list元素数据) {Integer} id 消息ID
@apiSuccess (list元素数据) {String} content 消息内容
@apiSuccess (list元素数据) {String} src 消息资源的url 当mime_type为 1, 2时
@apiSuccess (list元素数据) {Integer} mime_type 消息内容类型 0:文本, 1:图片, 2:语音
@apiSuccess (list元素数据) {Integer} is_read 已读标记
@apiSuccess (list元素数据) {Integer} to_id 发送给的用户ID
@apiSuccess (list元素数据) {Integer} from_member_id 发送者用户ID
@apiSuccess (list元素数据) {Integer} is_to_group 是否是群消息
@apiSuccess (list元素数据) {String}  add_time 发送时间
@apiSuccess (list元素数据) {Integer} type 消息类型 1: IM消息

@apiSuccessExample {json} 成功示例:
{
    "success":true,
    "data":{
        "list":[
            {
                "id":"9",
                "mime_type": 0, //0: 文本, 1: 图片, 2: 语音
                "is_to_group":"1",
                "is_read":"0",
                "content":"一条大于十个字的消息...",
                "src":null,
                "from_member_id":"29",
                "add_time":"2016-01-29 15:20:27"
            },
            {
                "id":"8",
                "mime_type": 1
                "is_to_group":"1",
                "is_read":"0",
                "content":"[图片]",
                "src": "/Uploads/Picture/demand/5467032ccd08b.jpg",
                "from_member_id":"29",
                "add_time":"2016-01-29 15:19:00"
            }
            ...
        ]
        "count":4,
        "total_rows":"4",
        "total_pages":1,
        "_": 1458289313
    }
}

@apiUse error_auth
"""

"""
@api {get} /im/message/no_read_total 获取未读消息总数
@apiName get_no_read_msg_total
@apiGroup IM
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例:
{
    "success":true,
    "data":{
        "total":"4"
    }
}

@apiUse error_auth
"""

"""
@api {put} v1/im/message/mark_read/:type/:from_id 标记消息为已读
@apiName mark_read
@apiGroup IM

@apiUse header_token

@apiParam (request) {String="single","group"} type="single" 消息发送类型 single:用户, group:群
@apiParam (request) {Integer} from_id 发送者用户ID

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

"""


"""
@api {post} /im/group$ 创建群
@apiName 3
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
创建群 <br>
注: image参数为url 需要先调用上传文件接口获取上传后资源的url

@apiUse header_token

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
@api {DELETE} /im/group/:id\d$ 删除群
@apiName 4
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
删除群

@apiUse header_token

@apiParam (request) {Integer} id 群名称

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
@api {PUT} /im/group/:id\d$ 更新群
@apiName 5
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
更新

@apiUse header_token

@apiParam (request) {Integer} id 群名称
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
@api {GET} /im/group/:id\d$ 获取指定ID群信息
@apiName 6
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
更新

@apiParam (request) {Integer} id 群名称

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} id 群ID
@apiSuccess (return_title) {String} group_id 群号
@apiSuccess (return_title) {String} name 群名称
@apiSuccess (return_title) {String} image 群logo图片url
@apiSuccess (return_title) {Integer} member_num 群成员数
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

"""
@api {GET} /im/groups/[:uid]/[:is_owner] 获取[指定用户ID所在或所有]群列表
@apiName 7
@apiGroup IM
@apiVersion 1.0.0
@apiDescription
获取[指定用户ID所在]群列表

@apiParam {Integer} [uid] 用户ID
@apiParam {Integer} [is_owner] 是否为群主, 也可使用 filters 过滤owner_id字段
@apiParam {JsonObject} [filters] 过滤条件, 可使用id, group_id, name, owner_id 作为过滤条件\n
                                    支持 eq, neq, gt, egt, lt, elt, [not] like, [not] between, [not] in等表达式
@apiParamExample {json} Body示例:
{
    "fitlers": {
        "name": ["like", "%XXX%"],
        "member_num": ["gt", 200]
    }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (data数据) {String} prev_page 上一页url
@apiSuccess (data数据)) {String} next_page 下一页url
@apiSuccess (data数据)) {Integer} total_rows 总条目数
@apiSuccess (data数据)) {Integer} total_pages 总页数
@apiSuccess (data数据)) {JsonObject[]} list 列表数据s
@apiSuccess (list元素数据) {Integer} id 群ID
@apiSuccess (list元素数据) {String} group_id 群号
@apiSuccess (list元素数据) {String} name 群名称
@apiSuccess (list元素数据) {String} image 群logo url
@apiSuccess (list元素数据) {Integer} member_num 群成员数
@apiSuccess (list元素数据) {String} owner_id 群主ID
@apiSuccess (list元素数据) {String} owner_nickname 群主昵称
@apiSuccess (list元素数据) {String} add_time 创建时间  
@apiSuccess (list元素数据) {Integer} no_read_count 未读消息条数  

@apiSuccessExample {json} 成功示例:
{
    "data": {
        "prev_page": null,
        "next_page": "http:\/\/localhost:8850\/v1\/im\/groups?p=2&ps=2",
        "total_rows":"9",
        "total_pages":5,
        "list": [
            {
                "id":"26",
                "group_id":"000026",
                "name":"我们的群",
                "member_num":"0",
                "image":"http:\/\/api.alhelp.net",
                "is_push":"1",
                "add_time":"2016-01-23 00:00:25",
                "owner_id":"31527",
                "owner_nickname":"jkzleond"
                "no_read_count": "0"
            },
            ...
        ]
    }
}
"""

"""
@api {POST} /im/group/:id\d/member 添加群成员
@apiName add_group_mmeber
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 添加群成员

@apiUse header_token

@apiParam {Integer} id 群ID
@apiParam {Integer[]} member_ids 用户ID数组

@apiParamExample {json} Body示例：
{
    "member_ids": [31527, 1257, 7757]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

"""

"""
@api {DELETE} /im/group/:id\d/member 删除群成员
@apiName delete_group_mmeber
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 删除群成员

@apiUse header_token

@apiParam {Integer} id 群ID
@apiParam {Integer[]} member_ids 用户ID数组

@apiParamExample {json} Body示例：
{
    "member_ids": [31527, 1257, 7757]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

"""

"""
@api {GET} /im/group/:id\d/members 获取群成员列表
@apiName get_group_mmeber_list
@apiGroup IM
@apiVersion 1.0.0
@apiDescription 获取群成员列表

@apiUse header_token

@apiParam {Integer} id 群ID

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (data数据) {JsonObject[]} list 成员信息列表
@apiSuccess (list元素数据) {Integer} member_id 成员ID
@apiSuccess (list元素数据) {String} nickname 成员昵称
@apiSuccess (list元素数据) {String} avatar 成员头像

@apiSuccessExample {json} 成功示例:
{
    "success":true,
    "data":{
        "list":[
                {"member_id":"31972","nickname":"jkzleondn","avatar":"http:\/\/www.alhelp.net\/Ucenter\/images\/noavatar_small.gif"},
                {"member_id":"131","nickname":"pink冥王星","avatar":"http:\/\/www.alhelp.net\/Ucenter\/images\/noavatar_small.gif"},
                {"member_id":"130","nickname":"wlq_14","avatar":"http:\/\/www.alhelp.net\/Ucenter\/images\/noavatar_small.gif"}
            ],
        "count":3,
        "total":3,
        "page_total":1
    }
}

"""