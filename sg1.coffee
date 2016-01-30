###
@api {get} /demands/:type/role/:role 获取指定类型的需求列表
@apiName demands_get
@apiGroup Demand
@apiVersion 1.0.0

@apiParam (request) {Integer} type 需求类型， 0：同时获取type=1,2,3的数据 1：资料 2：答疑 3：授课 4：直播课
@apiParam (request) {Integer} role 角色类型， 0：全部 1：学生 2：教师

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
  	"list": [
  		{
  			"id": "323",
  			"member_id": "5304",
  			"member_name": "科大科院考研网",
  			"role_type": "2",
  			"demand_type": "1",
  			"description": "2014年中科大 619生物化学与分子生物学 生化与分子 考研真题资料",
  			"content_demand": "此资料适用于报考中科大生科院 《生物......",
  			"image": "upload/Attachment/201311/4018833e-e634-4317-9e9a-5b2171f0e4d2.jpg",
  			"cost_type": "1",
        "cost": "200",
  			"platform_cost": "0",
  			"profes_type": "1",
  			"city": "34570",
  			"university": "51684",
  			"college": "51748",
  			"major_code": null,
  			"major": "",
  			"qq": "985673089",
  			"mobile": "985673089",
  			"set_time": "0000-00-00 00:00:00",
  			"close_remark": null,
  			"rating": "0",
  			"status": "1",
  			"add_time": "2013-11-11 16:20:21",
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
  			"member_nickname": "科大科院考研网",
  			"collect_num": "0",
  			"num_view": "9",
        "memo": "非统考 学校 学院 专业" //备注
  		}
  	],
    "count": 20,
    "next_page": "http://api.alhelp.net/v1/demands/1/role/2/page/2"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
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
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核(下架) 1 已审核(上架) 2 未通过
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
@apiSuccess (return_title) {String} collect_num 未知
@apiSuccess (return_title) {String} num_view 浏览数量
@apiSuccess (return_title) {String} memo 备注


@apiError (error_title) 3012 该需求类型不存在
@apiError (error_title) 3013 角色错误
###

###
@api {get} /demands/self/:type/role/:role 获取自己的需求列表
@apiName demands_self_get
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} type 需求类型， 0：全部 1：资料 2：答疑 3：授课 4：直播课
@apiParam (request) {Integer} role 角色类型， 0：全部 1：学生 2：教师

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
        "id": "323",
        "member_id": "5304",
        "member_name": "科大科院考研网",
        "role_type": "2",
        "demand_type": "1",
        "description": "2014年中科大 619生物化学与分子生物学 生化与分子 考研真题资料",
        "content_demand": "此资料适用于报考中科大生科院 《生物......",
        "image": "upload/Attachment/201311/4018833e-e634-4317-9e9a-5b2171f0e4d2.jpg",
        "cost_type": "1",
        "cost": "200",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "34570",
        "university": "51684",
        "college": "51748",
        "major_code": null,
        "major": "",
        "qq": "985673089",
        "mobile": "985673089",
        "set_time": "0000-00-00 00:00:00",
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2013-11-11 16:20:21",
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
        "member_nickname": "科大科院考研网",
        "collect_num": "0",
        "num_view": "9",
        "memo": "非统考 学校 学院 专业" //备注
      }
    ],
    "count": 20,
    "next_page": "http://api.alhelp.net/v1/demands/1/role/2/page/2"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
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
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核(下架) 1 已审核(上架) 2 未通过
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
@apiSuccess (return_title) {String} collect_num 未知
@apiSuccess (return_title) {String} num_view 浏览数量
@apiSuccess (return_title) {String} memo 备注


@apiError (error_title) 3012 该需求类型不存在
@apiError (error_title) 3013 角色错误
###

###
@api {get} /demands/:uid/:type/:role/:page 获取指定用户ID需求列表
@apiName demands_self_get
@apiGroup Demand
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} uid  用户ID
@apiParam (request) {Integer} type 需求类型， 0：全部 1：资料 2：答疑 3：授课 4：直播课
@apiParam (request) {Integer} role 角色类型， 0：全部 1：学生 2：教师
@apiParam (request) {Integer} page 页码

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
        "id": "323",
        "member_id": "5304",
        "member_name": "科大科院考研网",
        "role_type": "2",
        "demand_type": "1",
        "description": "2014年中科大 619生物化学与分子生物学 生化与分子 考研真题资料",
        "content_demand": "此资料适用于报考中科大生科院 《生物......",
        "image": "upload/Attachment/201311/4018833e-e634-4317-9e9a-5b2171f0e4d2.jpg",
        "cost_type": "1",
        "cost": "200",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "34570",
        "university": "51684",
        "college": "51748",
        "major_code": null,
        "major": "",
        "qq": "985673089",
        "mobile": "985673089",
        "set_time": "0000-00-00 00:00:00",
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2013-11-11 16:20:21",
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
        "member_nickname": "科大科院考研网",
        "collect_num": "0",
        "num_view": "9",
        "memo": "非统考 学校 学院 专业" //备注
      }
    ],
    "count": 20,
    "next_page": "http://api.alhelp.net/v1/demands/1/role/2/page/2"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
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
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核(下架) 1 已审核(上架) 2 未通过
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
@apiSuccess (return_title) {String} collect_num 未知
@apiSuccess (return_title) {String} num_view 浏览数量
@apiSuccess (return_title) {String} memo 备注


@apiError (error_title) 3012 该需求类型不存在
@apiError (error_title) 3013 角色错误
###

###
@api {get} /demand/:id 获取指定id的需求详情
@apiName demand_get
@apiGroup Demand
@apiVersion 1.0.0

@apiParam (request) {Integer} id 需求id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
        "id": "323",
        "member_id": "5304",
        "member_name": "科大科院考研网",
        "role_type": "2",
        "demand_type": "1",
        "description": "2014年中科大 619生物化学与分子生物学 生化与分子 考研真题资料",
        "content_demand": "此资料适用于报考中科大生科院 《生物......",
        "image": "upload/Attachment/201311/4018833e-e634-4317-9e9a-5b2171f0e4d2.jpg",
        "cost_type": "1",
        "cost": "200",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "34570",
        "university": "51684",
        "college": "51748",
        "major_code": null,
        "major": "",
        "qq": "985673089",
        "mobile": "985673089",
        "set_time": "0000-00-00 00:00:00",
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2013-11-11 16:20:21",
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
        "member_nickname": "科大科院考研网",
        "collect_num": "0",
        "num_view": "9",
        "memo": "非统考 学校 学院 专业", //备注
        "comments": [
          {
            "id": "3",
            "pid": "0",
            "demand_id": "17",
            "order_id": null,
            "member_id": "33",
            "content": "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj",
            "rating": "1",
            "status": "1",
            "add_time": "2014-07-14 16:36:17"
          }
        ],
        "explains": [
          {
            "id": "6",
            "member_id": "33",
            "demand_id": "17",
            "content": "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
            "status": "1",
            "add_time": "2014-07-09 18:28:37"
          }
        ]
      }
    ],
    "count": 20,
    "next_page": "http://api.alhelp.net/v1/demands/1/role/2/page/2"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
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
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核(下架) 1 已审核(上架) 2 未通过
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
@apiSuccess (return_title) {String} collect_num 未知
@apiSuccess (return_title) {String} num_view 浏览数量
@apiSuccess (return_title) {String} memo 备注
@apiSuccess (return_title) {JsonArray} comments 该需求的评论
@apiSuccess (return_title) {JsonArray} explains 该需求的解释
###

###
@api {get} /articles/index 获取文章首页
@apiName article_index_get
@apiGroup Aritcle
@apiVersion 1.0.0
@apiDescription
<p>资讯，公告，直播课各3篇</p>

@apiParam (request) {Integer} id 需求id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "information": [
    {
      "school_id": "0",
      "member_id": "24398",
      "member_nickname": "",
      "id": "248",
      "cid": "213",
      "path": "0-213",
      "title": "云南省2013年全国硕士研究生招生网报公告",
      "content": "<p style=\"text-indent:2em;\">\r\n\t<span style=\"font-size:16px;color:#000000;font-family:FangSong_GB2312;line-height:2;\">云南省2013年全国硕士研究生招生网报公告         现将2013年全国硕士研究生招生考试云南省网上报名工作有关情况公告如下：        一、2013年云南省硕士研究生招生单位    11所普通高校：云南大学、昆明理工大学、昆明医科大学、云南农业大学、云南师范大学、云南民族大学、云南财经大学、西南林业大学、云南中医学院、云南艺术学院、大理学院。    6个科研机构：中国科学院昆明动物研究所、中国科学院昆明植物研究所、中国科学院西双版纳植物园、中国科学院云南天文台、昆明贵金属研究所、昆明物理研究所。        二、报名时间    （一）网上报名阶段    1、预报名时间：2012年9月26日至9月29日（每天9:00—22:00）。应届本科毕业生登录“中国研究生招生信息网”（公网网址：http：//yz.chsi.com.cn ，教育网址：http://yz.chsi.cn，以下简称“研招网”） 按网站的提示和有关要求如实、认真填写本人报名信息。凡不按要求报名、网报信息误填、错填或填报虚假信息而造成不能考试或录取的，后果由考生本人承担。在报名期间，考生可自行修改网报信息。    2、网上报名时间：2012年10月10日—31日（每天9:00—22:00）。考生登录研招网，按网站的提示和有关要求如实、认真填写本人报名信息, 报名期间考生可修改本人信息。应届本科毕业生预报名信息有效，无需重复报名。逾期不再补报，也不得再修改报名信息。    三、报考点现场确认    （一）现场确认时间：2012年11月10日至11月14日。逾期不再补报。    （二）现场确认程序    1、所有考生(含推免生)均须到云南省招生考试院指定的报考点进行现场确认。应届本科毕业生原则上应选择就读学校所在州（市、区）的报考点办理报名和确认手续；单独考试、推荐免试入学及报考工商管理、公共管理、旅游管理和工程管理等专业学位的考生应选择在报考的院校办理办理报名和确认手续；其他考生应选择工作或户口所在地州（市、区）的报考点办理报名和确认手续。在报名过程中，如遇特殊情况无法在规定报考点报考的考生，可根据实际情况就近报考，各报考点接受报考考生范围及考试类别安排如下：             报考点名称     报考点地址及联系电话     接受报考考生范围     接受考试类别         五华区招办     昆明市东风西路26号0871-5153792，5157355     昆明理工大学、云南师范大学、云南民族大学、云南警官学院等院校应届本科毕业生及社会考生。     统考    联考       盘龙区招办     昆明市护国路67号盘龙区教师进修学校0871-3166558，3177912     云南农业大学、云南财经大学、云南中医学院、西南林业大学、昆明学院、云南师范大学文理学院等院校应届本科毕业生及社会考生。     统考    联考       西山区招办     昆明市西山区兴苑路西山区人民法院斜对面（北京师范大学昆明附属中学）    0871-8233646     昆明医科大学、云南艺术学院、云南师范大学商学院、昆明医学院海源学院、云南艺术学院文华学院、云南大学滇池学院、昆明理工大学津桥学院等院校应届本科毕业生及社会考生。     统考    联考       呈贡区招办     呈贡区龙城路77号（原城内小学）    0871-7478261     昆明理工大学、昆明医科大学、云南中医学院、云南师范大学、云南艺术学院、云南民族大学、玉溪师范学院等院校应届本科毕业生及社会考生。     统考    联考       曲靖市招办     曲靖市政务中心二楼0874-3212306     曲靖师范学院或不限。     统考    联考       大理州招生考试院     大理市下关镇州级龙山行政办公区大理州教育局    0872-2319381, 2319382,2319383     大理学院、云南大学旅游文化学院、楚雄师范学院或不限。     统考    联考       红河州招办     红河州蒙自市州政府办公大楼C区531，532房0873-3732960,3732959     红河学院或不限。     统考    联考       云南大学     昆明市翠湖北路2号0871-5033837     云南大学应届本科毕业生、云南大学推荐免试生、报考云南大学农村教育硕士、工商管理、公共管理、旅游管理、工程管理硕士、云南大学单独考试的考生。     统考，联考，单独考试       昆明理工大学     昆明市一二一大街文昌路68号    0871-5112931     昆明理工大学推荐免试生、报考昆明理工大学工商管理、工程管理考生、昆明理工大学单独考试的考生。     不组织考试       云南师范大学     昆明市一二一大街298号  0871-5516027       云南师范大学、云南农业大学、昆明医科大学、云南民族大学推荐免试生，报考云南师范大学农村教育硕士，工商管理、旅游管理考生，报考云南民族大学工商管理、公共管理的考生。     不组织考试       云南财经大学     昆明市龙泉路237号思远楼405室    0871-5128174     报考云南财经大学工商管理、公共管理的考生。     不组织考试            2、考生提交本人第二代居民身份证、学历证书（普通高校、成人高校、普通高校举办的成人高校学历教育应届本科毕业生持学生证）和网上报名编号，由报考点工作人员进行核对。    自考本科生和网络教育本科生须凭已经取得的国家承认的大学本科毕业证书方可办理网上报名现场确认手续。    所有考生均要对本人网上报名信息进行认真核对并确认。经考生确认的报名信息在考试、复试及录取阶段一律不作修改，因考生填写错误引起的一切后果由其自行承担。    3、考生按规定缴纳报考费（考生办理报考手续缴纳报考费后，不再退还）。根据云南省物价局、云南省财政厅联发《云南省物价局 云南省财政厅关于调整研究生招生考试费收费标准的复函》（云价收费函〔2012〕40号）确定的收费标准，研究生招生考试费收费标准为每人每科45元。    4、考生按报考点规定配合采集本人图像等相关电子信息。    四、网上报名填写报考信息时注意事项：    1、考生只填报一个招生单位的一个专业。待考试结束，教育部公布考生进入复试基本分数要求后，考生可通过研招网调剂服务系统了解招生单位的生源缺额信息并根据自己的成绩再填报调剂志愿。    2、以同等学力身份报考的人员，应按招生单位要求如实填写学习情况和提供真实材料。    3、考生（含推免生）要准确填写个人信息，对本人所受奖惩情况，特别是要如实填写在参加普通和成人高等学校招生考试、全国硕士研究生招生考试、高等教育自学考试等国家教育考试过程中因违规、作弊所受处罚情况。对弄虚作假者，招生单位将按照《国家教育考试违规处理办法》（中华人民共和国教育部第33号令）和《全国硕士学位研究生招生工作管理规定（暂行）》进行处理。    4、推荐免试生须在10月31日前凭推荐学校发放的校验码在研招网上填写报名信息并进行现场确认。    5、“少数民族高层次骨干人才培养计划”报名资格确认时间为10月10日-31日，考生到云南省教育厅民族教育处进行资格确认并领取校验码，凭校验码在研招网上填写报名信息并进行现场确认。    6、已被招生单位接收的推免生，不得再报名参加全国硕士研究生招生考试。否则，将取消推免生资格，列为统考生。     五、资格审查    报考点只对考生有效身份证件、非应届本科毕业生的学历证书及应届本科毕业生和成人应届本科毕业生的学生证进行核对，考生报考资格的全面审查由招生单位在复试时进行。    特此通知。                                                                                                                                                                                                                    云南省招生考试院                                                                         二〇一二年九月二十一日</span>\r\n</p>",
      "type": "information",
      "url": "",
      "praise_num": null,
      "download_num": null,
      "trample_num": "0",
      "views": "103",
      "score": "0",
      "sort": "5",
      "status": "-1",
      "add_time": "2013-03-20 13:15:03",
      "update_time": "0000-00-00 00:00:00",
      "isscore": "1",
      "cover": "",
      "remark": "",
      "profes_type": "0",
      "city": null,
      "university": null,
      "college": null,
      "major": null,
      "major_code": null,
      "collect_num": "0"
    },
    ......
    ],
    "notice": [{}, ...],
    "yylive": [{}, ...]
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {String} information 资讯
@apiSuccess (return_title) {String} notice 公告
@apiSuccess (return_title) {String} yylive 直播课
@apiSuccess (return_title) {Integer} school_id 学校id
@apiSuccess (return_title) {Integer} member_id 用户id
@apiSuccess (return_title) {String} member_nickname 用户昵称
@apiSuccess (return_title) {Integer} id 文章id
@apiSuccess (return_title) {Integer} cid 未知
@apiSuccess (return_title) {String} path 未知
@apiSuccess (return_title) {String} title 文章标题
@apiSuccess (return_title) {String} content 文章内容
@apiSuccess (return_title) {String} type 类型，information：资讯，notice：公告，yylive：直播课
@apiSuccess (return_title) {String} url 链接
@apiSuccess (return_title) {Integer} praise_num 被赞数量
@apiSuccess (return_title) {Integer} download_num 被下载次数
@apiSuccess (return_title) {Integer} trample_num 被踩的数量
@apiSuccess (return_title) {Integer} views 浏览量
@apiSuccess (return_title) {Integer} score 下载所需要的积分
@apiSuccess (return_title) {Integer} sort 未知
@apiSuccess (return_title) {Integer} status 未知
@apiSuccess (return_title) {String} add_time 创建时间
@apiSuccess (return_title) {String} update_time 更新时间
@apiSuccess (return_title) {Integer} isscore 未知
@apiSuccess (return_title) {String} cover 图片
@apiSuccess (return_title) {String} remark 未知
@apiSuccess (return_title) {Integer} profes_type 专业类型， 1：非统考 2：统考 3：公共课
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {Integer} university 大学id
@apiSuccess (return_title) {Integer} college 学院id
@apiSuccess (return_title) {Integer} major 专业id
@apiSuccess (return_title) {Integer} major_code 专业代码
@apiSuccess (return_title) {Integer} collect_num 未知
###

###
@api {get} /article/:id 获取指定id的文章
@apiName article_get
@apiGroup Aritcle
@apiVersion 1.0.0

@apiParam (request) {Integer} id 需求id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "school_id": "0",
    "member_id": "24398",
    "member_nickname": "",
    "id": "248",
    "cid": "213",
    "path": "0-213",
    "title": "云南省2013年全国硕士研究生招生网报公告",
    "content": "<p style=\"text-indent:2em;\">\r\n\t<span style=\"font-size:16px;color:#000000;font-family:FangSong_GB2312;line-height:2;\">云南省2013年全国硕士研究生招生网报公告         现将2013年全国硕士研究生招生考试云南省网上报名工作有关情况公告如下：        一、2013年云南省硕士研究生招生单位    11所普通高校：云南大学、昆明理工大学、昆明医科大学、云南农业大学、云南师范大学、云南民族大学、云南财经大学、西南林业大学、云南中医学院、云南艺术学院、大理学院。    6个科研机构：中国科学院昆明动物研究所、中国科学院昆明植物研究所、中国科学院西双版纳植物园、中国科学院云南天文台、昆明贵金属研究所、昆明物理研究所。        二、报名时间    （一）网上报名阶段    1、预报名时间：2012年9月26日至9月29日（每天9:00—22:00）。应届本科毕业生登录“中国研究生招生信息网”（公网网址：http：//yz.chsi.com.cn ，教育网址：http://yz.chsi.cn，以下简称“研招网”） 按网站的提示和有关要求如实、认真填写本人报名信息。凡不按要求报名、网报信息误填、错填或填报虚假信息而造成不能考试或录取的，后果由考生本人承担。在报名期间，考生可自行修改网报信息。    2、网上报名时间：2012年10月10日—31日（每天9:00—22:00）。考生登录研招网，按网站的提示和有关要求如实、认真填写本人报名信息, 报名期间考生可修改本人信息。应届本科毕业生预报名信息有效，无需重复报名。逾期不再补报，也不得再修改报名信息。    三、报考点现场确认    （一）现场确认时间：2012年11月10日至11月14日。逾期不再补报。    （二）现场确认程序    1、所有考生(含推免生)均须到云南省招生考试院指定的报考点进行现场确认。应届本科毕业生原则上应选择就读学校所在州（市、区）的报考点办理报名和确认手续；单独考试、推荐免试入学及报考工商管理、公共管理、旅游管理和工程管理等专业学位的考生应选择在报考的院校办理办理报名和确认手续；其他考生应选择工作或户口所在地州（市、区）的报考点办理报名和确认手续。在报名过程中，如遇特殊情况无法在规定报考点报考的考生，可根据实际情况就近报考，各报考点接受报考考生范围及考试类别安排如下：             报考点名称     报考点地址及联系电话     接受报考考生范围     接受考试类别         五华区招办     昆明市东风西路26号0871-5153792，5157355     昆明理工大学、云南师范大学、云南民族大学、云南警官学院等院校应届本科毕业生及社会考生。     统考    联考       盘龙区招办     昆明市护国路67号盘龙区教师进修学校0871-3166558，3177912     云南农业大学、云南财经大学、云南中医学院、西南林业大学、昆明学院、云南师范大学文理学院等院校应届本科毕业生及社会考生。     统考    联考       西山区招办     昆明市西山区兴苑路西山区人民法院斜对面（北京师范大学昆明附属中学）    0871-8233646     昆明医科大学、云南艺术学院、云南师范大学商学院、昆明医学院海源学院、云南艺术学院文华学院、云南大学滇池学院、昆明理工大学津桥学院等院校应届本科毕业生及社会考生。     统考    联考       呈贡区招办     呈贡区龙城路77号（原城内小学）    0871-7478261     昆明理工大学、昆明医科大学、云南中医学院、云南师范大学、云南艺术学院、云南民族大学、玉溪师范学院等院校应届本科毕业生及社会考生。     统考    联考       曲靖市招办     曲靖市政务中心二楼0874-3212306     曲靖师范学院或不限。     统考    联考       大理州招生考试院     大理市下关镇州级龙山行政办公区大理州教育局    0872-2319381, 2319382,2319383     大理学院、云南大学旅游文化学院、楚雄师范学院或不限。     统考    联考       红河州招办     红河州蒙自市州政府办公大楼C区531，532房0873-3732960,3732959     红河学院或不限。     统考    联考       云南大学     昆明市翠湖北路2号0871-5033837     云南大学应届本科毕业生、云南大学推荐免试生、报考云南大学农村教育硕士、工商管理、公共管理、旅游管理、工程管理硕士、云南大学单独考试的考生。     统考，联考，单独考试       昆明理工大学     昆明市一二一大街文昌路68号    0871-5112931     昆明理工大学推荐免试生、报考昆明理工大学工商管理、工程管理考生、昆明理工大学单独考试的考生。     不组织考试       云南师范大学     昆明市一二一大街298号  0871-5516027       云南师范大学、云南农业大学、昆明医科大学、云南民族大学推荐免试生，报考云南师范大学农村教育硕士，工商管理、旅游管理考生，报考云南民族大学工商管理、公共管理的考生。     不组织考试       云南财经大学     昆明市龙泉路237号思远楼405室    0871-5128174     报考云南财经大学工商管理、公共管理的考生。     不组织考试            2、考生提交本人第二代居民身份证、学历证书（普通高校、成人高校、普通高校举办的成人高校学历教育应届本科毕业生持学生证）和网上报名编号，由报考点工作人员进行核对。    自考本科生和网络教育本科生须凭已经取得的国家承认的大学本科毕业证书方可办理网上报名现场确认手续。    所有考生均要对本人网上报名信息进行认真核对并确认。经考生确认的报名信息在考试、复试及录取阶段一律不作修改，因考生填写错误引起的一切后果由其自行承担。    3、考生按规定缴纳报考费（考生办理报考手续缴纳报考费后，不再退还）。根据云南省物价局、云南省财政厅联发《云南省物价局 云南省财政厅关于调整研究生招生考试费收费标准的复函》（云价收费函〔2012〕40号）确定的收费标准，研究生招生考试费收费标准为每人每科45元。    4、考生按报考点规定配合采集本人图像等相关电子信息。    四、网上报名填写报考信息时注意事项：    1、考生只填报一个招生单位的一个专业。待考试结束，教育部公布考生进入复试基本分数要求后，考生可通过研招网调剂服务系统了解招生单位的生源缺额信息并根据自己的成绩再填报调剂志愿。    2、以同等学力身份报考的人员，应按招生单位要求如实填写学习情况和提供真实材料。    3、考生（含推免生）要准确填写个人信息，对本人所受奖惩情况，特别是要如实填写在参加普通和成人高等学校招生考试、全国硕士研究生招生考试、高等教育自学考试等国家教育考试过程中因违规、作弊所受处罚情况。对弄虚作假者，招生单位将按照《国家教育考试违规处理办法》（中华人民共和国教育部第33号令）和《全国硕士学位研究生招生工作管理规定（暂行）》进行处理。    4、推荐免试生须在10月31日前凭推荐学校发放的校验码在研招网上填写报名信息并进行现场确认。    5、“少数民族高层次骨干人才培养计划”报名资格确认时间为10月10日-31日，考生到云南省教育厅民族教育处进行资格确认并领取校验码，凭校验码在研招网上填写报名信息并进行现场确认。    6、已被招生单位接收的推免生，不得再报名参加全国硕士研究生招生考试。否则，将取消推免生资格，列为统考生。     五、资格审查    报考点只对考生有效身份证件、非应届本科毕业生的学历证书及应届本科毕业生和成人应届本科毕业生的学生证进行核对，考生报考资格的全面审查由招生单位在复试时进行。    特此通知。                                                                                                                                                                                                                    云南省招生考试院                                                                         二〇一二年九月二十一日</span>\r\n</p>",
    "type": "information",
    "url": "",
    "praise_num": null,
    "download_num": null,
    "trample_num": "0",
    "views": "103",
    "score": "0",
    "sort": "5",
    "status": "-1",
    "add_time": "2013-03-20 13:15:03",
    "update_time": "0000-00-00 00:00:00",
    "isscore": "1",
    "cover": "",
    "remark": "",
    "profes_type": "0",
    "city": null,
    "university": null,
    "college": null,
    "major": null,
    "major_code": null,
    "collect_num": "0"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} school_id 学校id
@apiSuccess (return_title) {Integer} member_id 用户id
@apiSuccess (return_title) {String} member_nickname 用户昵称
@apiSuccess (return_title) {Integer} id 文章id
@apiSuccess (return_title) {Integer} cid 未知
@apiSuccess (return_title) {String} path 未知
@apiSuccess (return_title) {String} title 文章标题
@apiSuccess (return_title) {String} content 文章内容
@apiSuccess (return_title) {String} type 类型，information：资讯，notice：公告，yylive：直播课
@apiSuccess (return_title) {String} url 链接
@apiSuccess (return_title) {Integer} praise_num 被赞数量
@apiSuccess (return_title) {Integer} download_num 被下载次数
@apiSuccess (return_title) {Integer} trample_num 被踩的数量
@apiSuccess (return_title) {Integer} views 浏览量
@apiSuccess (return_title) {Integer} score 下载所需要的积分
@apiSuccess (return_title) {Integer} sort 未知
@apiSuccess (return_title) {Integer} status 未知
@apiSuccess (return_title) {String} add_time 创建时间
@apiSuccess (return_title) {String} update_time 更新时间
@apiSuccess (return_title) {Integer} isscore 未知
@apiSuccess (return_title) {String} cover 图片
@apiSuccess (return_title) {String} remark 未知
@apiSuccess (return_title) {Integer} profes_type 专业类型， 1：非统考 2：统考 3：公共课
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {Integer} university 大学id
@apiSuccess (return_title) {Integer} college 学院id
@apiSuccess (return_title) {Integer} major 专业id
@apiSuccess (return_title) {Integer} major_code 专业代码
@apiSuccess (return_title) {Integer} collect_num 未知
###

###
@api {get} /articles/:type 获取指定类型的文章
@apiName articles_get
@apiGroup Aritcle
@apiVersion 1.0.0

@apiParam (request) {String} type 文章类型，information：资讯，notice：公告，yylive：直播课

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
  {
    "school_id": "0",
    "member_id": "24398",
    "member_nickname": "",
    "id": "248",
    "cid": "213",
    "path": "0-213",
    "title": "云南省2013年全国硕士研究生招生网报公告",
    "content": "<p style=\"text-indent:2em;\">\r\n\t<span style=\"font-size:16px;color:#000000;font-family:FangSong_GB2312;line-height:2;\">云南省2013年全国硕士研究生招生网报公告         现将2013年全国硕士研究生招生考试云南省网上报名工作有关情况公告如下：        一、2013年云南省硕士研究生招生单位    11所普通高校：云南大学、昆明理工大学、昆明医科大学、云南农业大学、云南师范大学、云南民族大学、云南财经大学、西南林业大学、云南中医学院、云南艺术学院、大理学院。    6个科研机构：中国科学院昆明动物研究所、中国科学院昆明植物研究所、中国科学院西双版纳植物园、中国科学院云南天文台、昆明贵金属研究所、昆明物理研究所。        二、报名时间    （一）网上报名阶段    1、预报名时间：2012年9月26日至9月29日（每天9:00—22:00）。应届本科毕业生登录“中国研究生招生信息网”（公网网址：http：//yz.chsi.com.cn ，教育网址：http://yz.chsi.cn，以下简称“研招网”） 按网站的提示和有关要求如实、认真填写本人报名信息。凡不按要求报名、网报信息误填、错填或填报虚假信息而造成不能考试或录取的，后果由考生本人承担。在报名期间，考生可自行修改网报信息。    2、网上报名时间：2012年10月10日—31日（每天9:00—22:00）。考生登录研招网，按网站的提示和有关要求如实、认真填写本人报名信息, 报名期间考生可修改本人信息。应届本科毕业生预报名信息有效，无需重复报名。逾期不再补报，也不得再修改报名信息。    三、报考点现场确认    （一）现场确认时间：2012年11月10日至11月14日。逾期不再补报。    （二）现场确认程序    1、所有考生(含推免生)均须到云南省招生考试院指定的报考点进行现场确认。应届本科毕业生原则上应选择就读学校所在州（市、区）的报考点办理报名和确认手续；单独考试、推荐免试入学及报考工商管理、公共管理、旅游管理和工程管理等专业学位的考生应选择在报考的院校办理办理报名和确认手续；其他考生应选择工作或户口所在地州（市、区）的报考点办理报名和确认手续。在报名过程中，如遇特殊情况无法在规定报考点报考的考生，可根据实际情况就近报考，各报考点接受报考考生范围及考试类别安排如下：             报考点名称     报考点地址及联系电话     接受报考考生范围     接受考试类别         五华区招办     昆明市东风西路26号0871-5153792，5157355     昆明理工大学、云南师范大学、云南民族大学、云南警官学院等院校应届本科毕业生及社会考生。     统考    联考       盘龙区招办     昆明市护国路67号盘龙区教师进修学校0871-3166558，3177912     云南农业大学、云南财经大学、云南中医学院、西南林业大学、昆明学院、云南师范大学文理学院等院校应届本科毕业生及社会考生。     统考    联考       西山区招办     昆明市西山区兴苑路西山区人民法院斜对面（北京师范大学昆明附属中学）    0871-8233646     昆明医科大学、云南艺术学院、云南师范大学商学院、昆明医学院海源学院、云南艺术学院文华学院、云南大学滇池学院、昆明理工大学津桥学院等院校应届本科毕业生及社会考生。     统考    联考       呈贡区招办     呈贡区龙城路77号（原城内小学）    0871-7478261     昆明理工大学、昆明医科大学、云南中医学院、云南师范大学、云南艺术学院、云南民族大学、玉溪师范学院等院校应届本科毕业生及社会考生。     统考    联考       曲靖市招办     曲靖市政务中心二楼0874-3212306     曲靖师范学院或不限。     统考    联考       大理州招生考试院     大理市下关镇州级龙山行政办公区大理州教育局    0872-2319381, 2319382,2319383     大理学院、云南大学旅游文化学院、楚雄师范学院或不限。     统考    联考       红河州招办     红河州蒙自市州政府办公大楼C区531，532房0873-3732960,3732959     红河学院或不限。     统考    联考       云南大学     昆明市翠湖北路2号0871-5033837     云南大学应届本科毕业生、云南大学推荐免试生、报考云南大学农村教育硕士、工商管理、公共管理、旅游管理、工程管理硕士、云南大学单独考试的考生。     统考，联考，单独考试       昆明理工大学     昆明市一二一大街文昌路68号    0871-5112931     昆明理工大学推荐免试生、报考昆明理工大学工商管理、工程管理考生、昆明理工大学单独考试的考生。     不组织考试       云南师范大学     昆明市一二一大街298号  0871-5516027       云南师范大学、云南农业大学、昆明医科大学、云南民族大学推荐免试生，报考云南师范大学农村教育硕士，工商管理、旅游管理考生，报考云南民族大学工商管理、公共管理的考生。     不组织考试       云南财经大学     昆明市龙泉路237号思远楼405室    0871-5128174     报考云南财经大学工商管理、公共管理的考生。     不组织考试            2、考生提交本人第二代居民身份证、学历证书（普通高校、成人高校、普通高校举办的成人高校学历教育应届本科毕业生持学生证）和网上报名编号，由报考点工作人员进行核对。    自考本科生和网络教育本科生须凭已经取得的国家承认的大学本科毕业证书方可办理网上报名现场确认手续。    所有考生均要对本人网上报名信息进行认真核对并确认。经考生确认的报名信息在考试、复试及录取阶段一律不作修改，因考生填写错误引起的一切后果由其自行承担。    3、考生按规定缴纳报考费（考生办理报考手续缴纳报考费后，不再退还）。根据云南省物价局、云南省财政厅联发《云南省物价局 云南省财政厅关于调整研究生招生考试费收费标准的复函》（云价收费函〔2012〕40号）确定的收费标准，研究生招生考试费收费标准为每人每科45元。    4、考生按报考点规定配合采集本人图像等相关电子信息。    四、网上报名填写报考信息时注意事项：    1、考生只填报一个招生单位的一个专业。待考试结束，教育部公布考生进入复试基本分数要求后，考生可通过研招网调剂服务系统了解招生单位的生源缺额信息并根据自己的成绩再填报调剂志愿。    2、以同等学力身份报考的人员，应按招生单位要求如实填写学习情况和提供真实材料。    3、考生（含推免生）要准确填写个人信息，对本人所受奖惩情况，特别是要如实填写在参加普通和成人高等学校招生考试、全国硕士研究生招生考试、高等教育自学考试等国家教育考试过程中因违规、作弊所受处罚情况。对弄虚作假者，招生单位将按照《国家教育考试违规处理办法》（中华人民共和国教育部第33号令）和《全国硕士学位研究生招生工作管理规定（暂行）》进行处理。    4、推荐免试生须在10月31日前凭推荐学校发放的校验码在研招网上填写报名信息并进行现场确认。    5、“少数民族高层次骨干人才培养计划”报名资格确认时间为10月10日-31日，考生到云南省教育厅民族教育处进行资格确认并领取校验码，凭校验码在研招网上填写报名信息并进行现场确认。    6、已被招生单位接收的推免生，不得再报名参加全国硕士研究生招生考试。否则，将取消推免生资格，列为统考生。     五、资格审查    报考点只对考生有效身份证件、非应届本科毕业生的学历证书及应届本科毕业生和成人应届本科毕业生的学生证进行核对，考生报考资格的全面审查由招生单位在复试时进行。    特此通知。                                                                                                                                                                                                                    云南省招生考试院                                                                         二〇一二年九月二十一日</span>\r\n</p>",
    "type": "information",
    "url": "",
    "praise_num": null,
    "download_num": null,
    "trample_num": "0",
    "views": "103",
    "score": "0",
    "sort": "5",
    "status": "-1",
    "add_time": "2013-03-20 13:15:03",
    "update_time": "0000-00-00 00:00:00",
    "isscore": "1",
    "cover": "",
    "remark": "",
    "profes_type": "0",
    "city": null,
    "university": null,
    "college": null,
    "major": null,
    "major_code": null,
    "collect_num": "0"
  },
  ......
  ],
  "count": 20,
  "next_page": "http://api.alhelp.net/v1/articles/notice/page/2"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
@apiSuccess (return_title) {Integer} school_id 学校id
@apiSuccess (return_title) {Integer} member_id 用户id
@apiSuccess (return_title) {String} member_nickname 用户昵称
@apiSuccess (return_title) {Integer} id 文章id
@apiSuccess (return_title) {Integer} cid 未知
@apiSuccess (return_title) {String} path 未知
@apiSuccess (return_title) {String} title 文章标题
@apiSuccess (return_title) {String} content 文章内容
@apiSuccess (return_title) {String} type 类型，information：资讯，notice：公告，yylive：直播课
@apiSuccess (return_title) {String} url 链接
@apiSuccess (return_title) {Integer} praise_num 被赞数量
@apiSuccess (return_title) {Integer} download_num 被下载次数
@apiSuccess (return_title) {Integer} trample_num 被踩的数量
@apiSuccess (return_title) {Integer} views 浏览量
@apiSuccess (return_title) {Integer} score 下载所需要的积分
@apiSuccess (return_title) {Integer} sort 未知
@apiSuccess (return_title) {Integer} status 未知
@apiSuccess (return_title) {String} add_time 创建时间
@apiSuccess (return_title) {String} update_time 更新时间
@apiSuccess (return_title) {Integer} isscore 未知
@apiSuccess (return_title) {String} cover 图片
@apiSuccess (return_title) {String} remark 未知
@apiSuccess (return_title) {Integer} profes_type 专业类型， 1：非统考 2：统考 3：公共课
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {Integer} university 大学id
@apiSuccess (return_title) {Integer} college 学院id
@apiSuccess (return_title) {Integer} major 专业id
@apiSuccess (return_title) {Integer} major_code 专业代码
@apiSuccess (return_title) {Integer} collect_num 未知

@apiError (error_title) 3014 该文章类型不存在
###

###
@api {get} /articles/self/:type 获取自己指定类型的文章
@apiName articles_self_get
@apiGroup Aritcle
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type 文章类型，information：资讯，notice：公告，yylive：直播课

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
  {
    "school_id": "0",
    "member_id": "24398",
    "member_nickname": "",
    "id": "248",
    "cid": "213",
    "path": "0-213",
    "title": "云南省2013年全国硕士研究生招生网报公告",
    "content": "<p style=\"text-indent:2em;\">\r\n\t<span style=\"font-size:16px;color:#000000;font-family:FangSong_GB2312;line-height:2;\">云南省2013年全国硕士研究生招生网报公告         现将2013年全国硕士研究生招生考试云南省网上报名工作有关情况公告如下：        一、2013年云南省硕士研究生招生单位    11所普通高校：云南大学、昆明理工大学、昆明医科大学、云南农业大学、云南师范大学、云南民族大学、云南财经大学、西南林业大学、云南中医学院、云南艺术学院、大理学院。    6个科研机构：中国科学院昆明动物研究所、中国科学院昆明植物研究所、中国科学院西双版纳植物园、中国科学院云南天文台、昆明贵金属研究所、昆明物理研究所。        二、报名时间    （一）网上报名阶段    1、预报名时间：2012年9月26日至9月29日（每天9:00—22:00）。应届本科毕业生登录“中国研究生招生信息网”（公网网址：http：//yz.chsi.com.cn ，教育网址：http://yz.chsi.cn，以下简称“研招网”） 按网站的提示和有关要求如实、认真填写本人报名信息。凡不按要求报名、网报信息误填、错填或填报虚假信息而造成不能考试或录取的，后果由考生本人承担。在报名期间，考生可自行修改网报信息。    2、网上报名时间：2012年10月10日—31日（每天9:00—22:00）。考生登录研招网，按网站的提示和有关要求如实、认真填写本人报名信息, 报名期间考生可修改本人信息。应届本科毕业生预报名信息有效，无需重复报名。逾期不再补报，也不得再修改报名信息。    三、报考点现场确认    （一）现场确认时间：2012年11月10日至11月14日。逾期不再补报。    （二）现场确认程序    1、所有考生(含推免生)均须到云南省招生考试院指定的报考点进行现场确认。应届本科毕业生原则上应选择就读学校所在州（市、区）的报考点办理报名和确认手续；单独考试、推荐免试入学及报考工商管理、公共管理、旅游管理和工程管理等专业学位的考生应选择在报考的院校办理办理报名和确认手续；其他考生应选择工作或户口所在地州（市、区）的报考点办理报名和确认手续。在报名过程中，如遇特殊情况无法在规定报考点报考的考生，可根据实际情况就近报考，各报考点接受报考考生范围及考试类别安排如下：             报考点名称     报考点地址及联系电话     接受报考考生范围     接受考试类别         五华区招办     昆明市东风西路26号0871-5153792，5157355     昆明理工大学、云南师范大学、云南民族大学、云南警官学院等院校应届本科毕业生及社会考生。     统考    联考       盘龙区招办     昆明市护国路67号盘龙区教师进修学校0871-3166558，3177912     云南农业大学、云南财经大学、云南中医学院、西南林业大学、昆明学院、云南师范大学文理学院等院校应届本科毕业生及社会考生。     统考    联考       西山区招办     昆明市西山区兴苑路西山区人民法院斜对面（北京师范大学昆明附属中学）    0871-8233646     昆明医科大学、云南艺术学院、云南师范大学商学院、昆明医学院海源学院、云南艺术学院文华学院、云南大学滇池学院、昆明理工大学津桥学院等院校应届本科毕业生及社会考生。     统考    联考       呈贡区招办     呈贡区龙城路77号（原城内小学）    0871-7478261     昆明理工大学、昆明医科大学、云南中医学院、云南师范大学、云南艺术学院、云南民族大学、玉溪师范学院等院校应届本科毕业生及社会考生。     统考    联考       曲靖市招办     曲靖市政务中心二楼0874-3212306     曲靖师范学院或不限。     统考    联考       大理州招生考试院     大理市下关镇州级龙山行政办公区大理州教育局    0872-2319381, 2319382,2319383     大理学院、云南大学旅游文化学院、楚雄师范学院或不限。     统考    联考       红河州招办     红河州蒙自市州政府办公大楼C区531，532房0873-3732960,3732959     红河学院或不限。     统考    联考       云南大学     昆明市翠湖北路2号0871-5033837     云南大学应届本科毕业生、云南大学推荐免试生、报考云南大学农村教育硕士、工商管理、公共管理、旅游管理、工程管理硕士、云南大学单独考试的考生。     统考，联考，单独考试       昆明理工大学     昆明市一二一大街文昌路68号    0871-5112931     昆明理工大学推荐免试生、报考昆明理工大学工商管理、工程管理考生、昆明理工大学单独考试的考生。     不组织考试       云南师范大学     昆明市一二一大街298号  0871-5516027       云南师范大学、云南农业大学、昆明医科大学、云南民族大学推荐免试生，报考云南师范大学农村教育硕士，工商管理、旅游管理考生，报考云南民族大学工商管理、公共管理的考生。     不组织考试       云南财经大学     昆明市龙泉路237号思远楼405室    0871-5128174     报考云南财经大学工商管理、公共管理的考生。     不组织考试            2、考生提交本人第二代居民身份证、学历证书（普通高校、成人高校、普通高校举办的成人高校学历教育应届本科毕业生持学生证）和网上报名编号，由报考点工作人员进行核对。    自考本科生和网络教育本科生须凭已经取得的国家承认的大学本科毕业证书方可办理网上报名现场确认手续。    所有考生均要对本人网上报名信息进行认真核对并确认。经考生确认的报名信息在考试、复试及录取阶段一律不作修改，因考生填写错误引起的一切后果由其自行承担。    3、考生按规定缴纳报考费（考生办理报考手续缴纳报考费后，不再退还）。根据云南省物价局、云南省财政厅联发《云南省物价局 云南省财政厅关于调整研究生招生考试费收费标准的复函》（云价收费函〔2012〕40号）确定的收费标准，研究生招生考试费收费标准为每人每科45元。    4、考生按报考点规定配合采集本人图像等相关电子信息。    四、网上报名填写报考信息时注意事项：    1、考生只填报一个招生单位的一个专业。待考试结束，教育部公布考生进入复试基本分数要求后，考生可通过研招网调剂服务系统了解招生单位的生源缺额信息并根据自己的成绩再填报调剂志愿。    2、以同等学力身份报考的人员，应按招生单位要求如实填写学习情况和提供真实材料。    3、考生（含推免生）要准确填写个人信息，对本人所受奖惩情况，特别是要如实填写在参加普通和成人高等学校招生考试、全国硕士研究生招生考试、高等教育自学考试等国家教育考试过程中因违规、作弊所受处罚情况。对弄虚作假者，招生单位将按照《国家教育考试违规处理办法》（中华人民共和国教育部第33号令）和《全国硕士学位研究生招生工作管理规定（暂行）》进行处理。    4、推荐免试生须在10月31日前凭推荐学校发放的校验码在研招网上填写报名信息并进行现场确认。    5、“少数民族高层次骨干人才培养计划”报名资格确认时间为10月10日-31日，考生到云南省教育厅民族教育处进行资格确认并领取校验码，凭校验码在研招网上填写报名信息并进行现场确认。    6、已被招生单位接收的推免生，不得再报名参加全国硕士研究生招生考试。否则，将取消推免生资格，列为统考生。     五、资格审查    报考点只对考生有效身份证件、非应届本科毕业生的学历证书及应届本科毕业生和成人应届本科毕业生的学生证进行核对，考生报考资格的全面审查由招生单位在复试时进行。    特此通知。                                                                                                                                                                                                                    云南省招生考试院                                                                         二〇一二年九月二十一日</span>\r\n</p>",
    "type": "information",
    "url": "",
    "praise_num": null,
    "download_num": null,
    "trample_num": "0",
    "views": "103",
    "score": "0",
    "sort": "5",
    "status": "-1",
    "add_time": "2013-03-20 13:15:03",
    "update_time": "0000-00-00 00:00:00",
    "isscore": "1",
    "cover": "",
    "remark": "",
    "profes_type": "0",
    "city": null,
    "university": null,
    "college": null,
    "major": null,
    "major_code": null,
    "collect_num": "0"
  },
  ......
  ],
  "count": 20,
  "next_page": "http://api.alhelp.net/v1/articles/notice/page/2"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
@apiSuccess (return_title) {Integer} school_id 学校id
@apiSuccess (return_title) {Integer} member_id 用户id
@apiSuccess (return_title) {String} member_nickname 用户昵称
@apiSuccess (return_title) {Integer} id 文章id
@apiSuccess (return_title) {Integer} cid 未知
@apiSuccess (return_title) {String} path 未知
@apiSuccess (return_title) {String} title 文章标题
@apiSuccess (return_title) {String} content 文章内容
@apiSuccess (return_title) {String} type 类型，information：资讯，notice：公告，yylive：直播课
@apiSuccess (return_title) {String} url 链接
@apiSuccess (return_title) {Integer} praise_num 被赞数量
@apiSuccess (return_title) {Integer} download_num 被下载次数
@apiSuccess (return_title) {Integer} trample_num 被踩的数量
@apiSuccess (return_title) {Integer} views 浏览量
@apiSuccess (return_title) {Integer} score 下载所需要的积分
@apiSuccess (return_title) {Integer} sort 未知
@apiSuccess (return_title) {Integer} status 未知
@apiSuccess (return_title) {String} add_time 创建时间
@apiSuccess (return_title) {String} update_time 更新时间
@apiSuccess (return_title) {Integer} isscore 未知
@apiSuccess (return_title) {String} cover 图片
@apiSuccess (return_title) {String} remark 未知
@apiSuccess (return_title) {Integer} profes_type 专业类型， 1：非统考 2：统考 3：公共课
@apiSuccess (return_title) {Integer} city 城市id
@apiSuccess (return_title) {Integer} university 大学id
@apiSuccess (return_title) {Integer} college 学院id
@apiSuccess (return_title) {Integer} major 专业id
@apiSuccess (return_title) {Integer} major_code 专业代码
@apiSuccess (return_title) {Integer} collect_num 未知

@apiError (error_title) 3014 该文章类型不存在
###


###
@api {get} /demands/by/classify/role/:role/type/:type/classify/:classify_id/unified/:unified_id 获取指定类型的统考需求服务列表
@apiName demands_by_classify_get
@apiGroup Demand
@apiVersion 1.0.0

@apiParam (request) {Integer} type 需求类型 0：全部 1：资料 2：答疑 3：授课 4：直播课
@apiParam (request) {Integer} role 角色类型 0：全部 1：学生 2：教师
@apiParam (request) {Integer} classify 统考学科分类id
@apiParam (request) {Integer} unified 统考学科id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
        "id": "4808",
        "pid": null,
        "member_id": "21174",
        "member_name": "221174",
        "role_type": "1",
        "demand_type": "1",
        "require_identity": "0",
        "require_authenticate": "0",
        "require_security": "0",
        "description": "找学姐",
        "content_demand": "  找一个学姐，  想问问具体学校情况，",
        "content_course": null,
        "content_reference": null,
        "remarks": null,
        "yy_number": null,
        "image": null,
        "cost_type": "1",
        "cost": "100",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "1400000",
        "university": "1400001",
        "college": "1400025",
        "major_code": "087100",
        "major": "1400029",
        "qq": "1258928382",
        "mobile": null,
        "set_time": null,
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2015-11-14 23:12:42",
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
        "member_nickname": "221174",
        "collect_num": "0",
        "num_view": "95",
        "memo": "非统考 学校 学院 专业", //备注
        "member": {
          "id": "21174",
          "last_serve_time": "1447513963",
          "last_comment_time": "0",
          "pid": "0",
          "member_group_id": "1",
          "avatar": null,
          "email": null,
          "nickname": "221174",
          "account": null,
          "balance": "0.00",
          "balance_frozen": "0.00",
          "bond": "0.00",
          "coin": "0",
          "score": "104",
          "email_verify_code": null,
          "email_verified": "0",
          "phone": "15731322338",
          "phone_verify_code": null,
          "phone_verified": "0",
          "password": "b841494d25107b572b79b825cc233da3",
          "paypassword": null,
          "reg_ip": null,
          "reg_time": "2015-05-11 17:48:59",
          "last_login_ip": "123.151.64.142",
          "last_login_time": "2015-11-19 16:04:04",
          "status": "1",
          "gender": "1",
          "qq": "1258928382",
          "level": "1",
          "province": null,
          "city": null,
          "area": null,
          "address": null,
          "nicheng": null,
          "yy": null,
          "is_student": "0",
          "is_teacher": "0",
          "is_realname": "0",
          "recommend_as_student": "0",
          "recommend_as_teacher": "0",
          "community_id": "9199",
          "school_id": "1400025",
          "area_id": "-1",
          "university_id": "-1",
          "college_id": "-1",
          "major_id": "-1",
          "follow_num": "2",
          "question_num": "0",
          "fans_num": "1",
          "demand_num": "5",
          "serve_num": "0",
          "news_num": "0",
          "praise_num": "0",
          "forget_code": "",
          "business": "0",
          "frozen_money": "0",
          "is_recharge": "0",
          "wap_role": "2",
          "system_message": "0",
          "is_vip": "0",
          "is_vip_order": "0",
          "hot": "0",
          "last_post_time": "1447602153",
          "last_server_school": "0",
          "last_server_school_id": "0",
          "avatar1": null,
          "avatar2": null,
          "avatar3": null,
          "display_weixin_nickname": "1",
          "baidu_channelId": "",
          "change_nickname": "0",
          "avator": "http://www.alhelp.net/ucenter/images/noavatar_small.gif"
        }
      },
      .......
    ],
    "count": 10,
    "next_page": "http://api.alhelp.net/v1/demands/by/classify/role/1/type/1/classify/0/unified/21/page/2"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
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
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核(下架) 1 已审核(上架) 2 未通过
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
@apiSuccess (return_title) {String} collect_num 未知
@apiSuccess (return_title) {String} num_view 浏览数量
@apiSuccess (return_title) {String} memo 备注


@apiError (error_title) 3012 该需求类型不存在
@apiError (error_title) 3025 该学科分类不存在
@apiError (error_title) 3026 该学科不存在
@apiError (error_title) 3027 角色不正确
###

###
@api {get} /demand/search/classifies 获取全部统考分类列表
@apiName classifies_get
@apiGroup Demand
@apiVersion 1.0.0

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
    {
      "id": "4",
      "pid": "0",
      "code": "408",
      "title": "计算机综合(Computer)",
      "sort": "1",
      "status": "1"
    },
    ......
  ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} code 学科分类代码
@apiSuccess (return_title) {Integer} id 学科分类id
@apiSuccess (return_title) {String} title 学科分类名称
###

###
@api {get} /demand/search/classifies/:classify_id 获取指定统考科目分类的统考科目列表
@apiName unifies_get
@apiGroup Demand
@apiVersion 1.0.0

@apiParam (request) {Integer} classify_id 统考学科分类id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": [
    {
      "id": "1",
      "cid": "4",
      "cname": "计算机操作系统",
      "ename": "Computer",
      "status": "1",
      "sort": "3"
    },
    ......
  ]
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} code 学科分类代码
@apiSuccess (return_title) {Integer} id 学科分类id
@apiSuccess (return_title) {String} title 学科分类名称
###

###
@api {get} /demand/search/unified/:unified_id 获取指定统考科目详情
@apiName unified_get
@apiGroup Demand
@apiVersion 1.0.0

@apiParam (request) {Integer} unified_id 统考学科id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "id": "4",
    "cid": "1",
    "cname": "教育学",
    "ename": "Education",
    "status": "-1",
    "sort": "0"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} cid 学科分类id
@apiSuccess (return_title) {Integer} id 学科id
@apiSuccess (return_title) {String} cname 学科中文名称
@apiSuccess (return_title) {String} ename 学科英文名称
###


###
@api {get} /demands/by/school/role/:role/type/:type/province/:province_id/university/:university_id/college/:college_id 获取指定类型的省份学校需求服务列表
@apiName demands_by_school_get
@apiGroup Demand
@apiVersion 1.0.0

@apiParam (request) {Integer} type 需求类型 0：全部 1：资料 2：答疑 3：授课 4：直播课
@apiParam (request) {Integer} role 角色类型 0：全部 1：学生 2：教师
@apiParam (request) {Integer} province_id 省份id，0：获取全部
@apiParam (request) {Integer} university_id 学校id，0：获取全部
@apiParam (request) {Integer} college_id 学院id，0：获取全部

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
        "id": "4808",
        "pid": null,
        "member_id": "21174",
        "member_name": "221174",
        "role_type": "1",
        "demand_type": "1",
        "require_identity": "0",
        "require_authenticate": "0",
        "require_security": "0",
        "description": "找学姐",
        "content_demand": "  找一个学姐，  想问问具体学校情况，",
        "content_course": null,
        "content_reference": null,
        "remarks": null,
        "yy_number": null,
        "image": null,
        "cost_type": "1",
        "cost": "100",
        "platform_cost": "0",
        "profes_type": "1",
        "city": "1400000",
        "university": "1400001",
        "college": "1400025",
        "major_code": "087100",
        "major": "1400029",
        "qq": "1258928382",
        "mobile": null,
        "set_time": null,
        "close_remark": null,
        "rating": "0",
        "status": "1",
        "add_time": "2015-11-14 23:12:42",
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
        "member_nickname": "221174",
        "collect_num": "0",
        "num_view": "95",
        "memo": "非统考 学校 学院 专业", //备注
        "member": {
          "id": "21174",
          "last_serve_time": "1447513963",
          "last_comment_time": "0",
          "pid": "0",
          "member_group_id": "1",
          "avatar": null,
          "email": null,
          "nickname": "221174",
          "account": null,
          "balance": "0.00",
          "balance_frozen": "0.00",
          "bond": "0.00",
          "coin": "0",
          "score": "104",
          "email_verify_code": null,
          "email_verified": "0",
          "phone": "15731322338",
          "phone_verify_code": null,
          "phone_verified": "0",
          "password": "b841494d25107b572b79b825cc233da3",
          "paypassword": null,
          "reg_ip": null,
          "reg_time": "2015-05-11 17:48:59",
          "last_login_ip": "123.151.64.142",
          "last_login_time": "2015-11-19 16:04:04",
          "status": "1",
          "gender": "1",
          "qq": "1258928382",
          "level": "1",
          "province": null,
          "city": null,
          "area": null,
          "address": null,
          "nicheng": null,
          "yy": null,
          "is_student": "0",
          "is_teacher": "0",
          "is_realname": "0",
          "recommend_as_student": "0",
          "recommend_as_teacher": "0",
          "community_id": "9199",
          "school_id": "1400025",
          "area_id": "-1",
          "university_id": "-1",
          "college_id": "-1",
          "major_id": "-1",
          "follow_num": "2",
          "question_num": "0",
          "fans_num": "1",
          "demand_num": "5",
          "serve_num": "0",
          "news_num": "0",
          "praise_num": "0",
          "forget_code": "",
          "business": "0",
          "frozen_money": "0",
          "is_recharge": "0",
          "wap_role": "2",
          "system_message": "0",
          "is_vip": "0",
          "is_vip_order": "0",
          "hot": "0",
          "last_post_time": "1447602153",
          "last_server_school": "0",
          "last_server_school_id": "0",
          "avatar1": null,
          "avatar2": null,
          "avatar3": null,
          "display_weixin_nickname": "1",
          "baidu_channelId": "",
          "change_nickname": "0",
          "avator": "http://www.alhelp.net/ucenter/images/noavatar_small.gif"
        }
      },
      .......
    ],
    "count": 10,
    "next_page": "http://api.alhelp.net/v1/demands/by/school/role/1/type/1/province/1/university/2/college/3/page/2"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {Integer} count 本页总数量
@apiSuccess (return_title) {String} next_page 下一页uri
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
@apiSuccess (return_title) {Integer} status -1 删除 0 未审核(下架) 1 已审核(上架) 2 未通过
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
@apiSuccess (return_title) {String} collect_num 未知
@apiSuccess (return_title) {String} num_view 浏览数量
@apiSuccess (return_title) {String} memo 备注


@apiError (error_title) 3012 该需求类型不存在
@apiError (error_title) 3025 该学科分类不存在
@apiError (error_title) 3026 该学科不存在
@apiError (error_title) 3027 角色不正确
###