###
@api {get} /user 获取当前用户信息
@apiName this_user_get
@apiGroup User
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
    "data":{
      "avator": "http://www.alhelp.net/ucenter/images/noavatar_small.gif",
      "phone": "138xxxx9999",
      "qq": "40212123",
      "email": "email@re.com",
      "gender": "1",
      "apps": [
        {
          "keyid": "sfwei2342",
          ...
        },
        ...
      ]
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {String} avator 用户头像
@apiSuccess (return_data) {String} phone 手机号
@apiSuccess (return_data) {String} email 邮箱
@apiSuccess (return_data) {String} gender 性别，1：男；0：女
@apiSuccess (return_data) {JsonArray} apps 第三方绑定应用
###

###
@api {get} /user/:uid 获取指定ID用户信息
@apiName other_user_get
@apiGroup User
@apiVersion 1.0.0

@apiParam (request) {Integer} uid 用户id
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
    "data":{
      "avator": "http://www.alhelp.net/ucenter/images/noavatar_small.gif",
      "phone": "138xxxx9999",
      "qq": "40212123",
      "email": "email@re.com",
      "gender": "1",
      "is_student": "0",
      "is_teacher": "0",
      "follow_num": "0",
      "fans_num": "0",
      "nickname": "ccomzf",
      "apps": [
        {
          "keyid": "sfwei2342",
          ...
        },
        ...
      ]
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {String} avator 用户头像
@apiSuccess (return_data) {String} phone 手机号
@apiSuccess (return_data) {String} email 邮箱
@apiSuccess (return_data) {String} gender 性别，1：男；0：女
@apiSuccess (return_data) {String} is_teacher 1：教师 0：非教师
@apiSuccess (return_data) {String} is_student 1：学生 0：非学生
@apiSuccess (return_data) {String} fans_num 粉丝数
@apiSuccess (return_data) {String} follow_num 关注我的人数
@apiSuccess (return_data) {String} nickname 昵称
@apiSuccess (return_data) {JsonArray} apps 第三方绑定应用
###

###
@api {get} /card 获取当前用户名片
@apiName this_card_get
@apiGroup User
@apiVersion 1.0.0

@apiUse header_token

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "nickname": "xxx",
      "signature": "个性签名",
      "content": "能力介绍"
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {String} nickname 用户昵称
@apiSuccess (return_data) {String} signatrue 个性签名
@apiSuccess (return_data) {String} content 能力介绍
###

###
@api {get} /card/:uid 获取指定用户ID用户名片
@apiName other_card_get
@apiGroup User
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} uid 用户id
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "nickname": "xxx",
      "signature": "个性签名",
      "content": "能力介绍"
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {String} nickname 用户昵称
@apiSuccess (return_data) {String} signatrue 个性签名
@apiSuccess (return_data) {String} content 能力介绍
###

###
@api {put} /user/update 修改用户信息
@apiName user_update
@apiGroup User
@apiVersion 1.0.0

@apiDescription
<p>三个参数不必须传递三个，更新某个数据只需要传递该参数即可</p>
@apiUse header_token

@apiParamExample {json} Body示例：
{
 "userInfo":{
     "phone":"153xxxx3424",
     "qq":"54256234",
     "email":"test@qq.com",
     "gender":1,
   }
}

@apiParam (request) {String} phone 手机号
@apiParam (request) {String} qq QQ号
@apiParam (request) {String} email 邮箱
@apiParam (request) {String} gender 性别，1：男；0：女
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "phone": "138xxxx9003",
      "qq": "42341515",
      "email": "fdsa@test.com"
      "gender": 1
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {String} phone 手机号
@apiSuccess (return_data) {String} qq QQ号
@apiSuccess (return_data) {String} email 邮箱
@apiSuccess (return_data) {String} gender 性别，1：男；0：女

@apiUse error_1001
@apiError (error_title) 1005 参数不正确
@apiError (error_title) 3004 第三方应用信息不可修改
@apiError (error_title) 9001 系统错误
###

###
@api {put} /card/update 修改名片信息
@apiName card_update
@apiGroup User
@apiVersion 1.0.0
@apiDescription
<p>三个参数不必须传递三个，更新某个数据只需要传递该参数即可</p>
@apiUse header_token

@apiParamExample {json} Body示例：
{
 "cardInfo":{
     "nickname":"fasdgd",
     "signatrue":"test",
     "content":"tfgaygww",
   }
}

@apiParam (request) {String} nickname 用户昵称
@apiParam (request) {String} signatrue 个性签名
@apiParam (request) {String} content 能力介绍
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "nickname": "xxx",
      "signature": "个性签名",
      "content": "能力介绍"
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {String} nickname 用户昵称
@apiSuccess (return_title) {String} signatrue 个性签名
@apiSuccess (return_title) {String} content 能力介绍

@apiUse error_1001
@apiError (error_title) 1005 参数不正确
@apiError (error_title) 9001 系统错误
###

###
@api {get} /communities/:uid 获取指定用户加入的圈子列表
@apiName target_user_communities
@apiGroup Community
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} uid 用户id，如果为空，则返回当前用户加入的圈子列表

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data": [
    {
      "id": "xxx",
      "add_time": "2015-09-30 13:01:28",
      "label": {
          "city": "北京",
          "school": "北京大学",
          "is_master": false,
          "college": "(001)数学科学学院",
          "major": "概率论与数理统计",
          "website": "www.xxxx.com",
          "telephone": "010-34225512,45134364",
          "address": "北京市朝阳区平乐园100号"
          "report_radio": 0.5
        }
    },
    ......
  ]
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 圈子id
@apiSuccess (return_data) {Datetime} add_time 添加时间
@apiSuccess (return_data) {JsonArray} label 学校专业信息
@apiSuccess (return_data) {String} city 城市
@apiSuccess (return_data) {String} school 学校
@apiSuccess (return_data) {Boolean} is_master 是否圈主
@apiSuccess (return_data) {String} college 学院
@apiSuccess (return_data) {String} major 专业
@apiSuccess (return_data) {String} website 学校官网
@apiSuccess (return_data) {String} telephone 联系电话
@apiSuccess (return_data) {String} address 地址
@apiSuccess (return_data) {String} report_radio 报录比
###

###
@api {delete} /community/quit 退出当前用户指定圈子
@apiName this_user_community_quit
@apiGroup Community
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 圈子id
@apiParamExample {json} Body示例：
{
 "community":{
     "id": 112,
   }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": null
}
@apiUse error_1001
@apiError (error_title) 3005 该用户没有关注该圈子
@apiError (error_title) 9001 系统错误
###

###
@api {post} /community/join 当前用户加入圈子
@apiName this_user_community_join
@apiGroup Community
@apiVersion 1.0.0

@apiDescription
<p>学校id，学院id，专业id 都可以作为圈子id</p>

@apiUse header_token

@apiParam (request) {Integer} id 圈子id
@apiParamExample {json} Body示例：
{
 "community":{
     "id": 112,
   }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data": ""
    }
}
@apiUse error_1001
@apiError (error_title) 3006 该圈子不存在
@apiError (error_title) 3007 当前用户已经在该圈子中
@apiError (error_title) 9001 系统错误
###

###
@api {post} /community/search 搜索省份,学校,专业及圈子信息
@apiName community_search
@apiGroup Community
@apiVersion 1.0.0
@apiDescription
<p><span style="color: #DC469E">1.</span>当参数 term = "provinces" 时，不需要传递其他参数，此时仅获取全部的省份。</p>
<p><span style="color: #DC469E">2.</span>当参数 term = "schools" 时，此时参数有两个，如果传递 major_id 则获取所有设有该专业的学校，如果传递 province_id 参数，则获取所给省份的学校，如果不传递 province_id 参数，则获取全部学校。</p>
<p><span style="color: #DC469E">3.</span>当参数 term = "colleges" 时，必须传递 school_id 参数，此时获取所给学校的全部学院。</p>
<p><span style="color: #DC469E">4.</span>当参数 term = "majors" 时，必须传递 college_id 参数，此时获取所给学院的全部专业。</p>

@apiParamExample {json} 请求term="provinces"
{
 "community":{
     "term": "provinces"
   }
}

@apiSuccessExample {json} 返回term="provinces"
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
        {
          "id": "1",
          "title": "北京",
          "initials": "B",
          "sort": "99999999"
        },
        ...
      ]
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 省份id
@apiSuccess (return_data) {Datetime} title 省份名称
@apiSuccess (return_data) {JsonArray} initials 省份首字母
@apiSuccess (return_data) {String} sort 排序

@apiParam (request) {Integer} [province_id] 省份id
@apiParam (request) {Integer} [major_id] 专业id
@apiParam (request) {String} [keywords] 需要搜索的学校关键词, 使用此参数，必须要有 province_id 参数,否则报错3008
@apiParamExample {json} 请求term="schools"
{
 "community":{
     "term": "schools",
     "province_id": 122,
     "keywords": "清华"
   }
}
@apiParamExample {json} 请求term="schools"
{
 "community":{
     "term": "schools",
     "province_id": 122,
     "major_id": 3345
   }
}

@apiSuccessExample {json} 返回term="schools"
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "id": "xxx",
      "add_time": "2015-09-30 13:01:28",
      "label": [
        {
          "id": "2",
          "title": "北京大学",
          "initials": "B",
          "address": "北京大学红二楼2102房间",
          "telephone": "010-62751354 62756913",
          "website": "http://grs.pku.edu.cn/zsxx/dtxx/",
          "sort": "99999998",
          "report_radio": "0.5"
        },
        ...
      ]
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 学校id
@apiSuccess (return_data) {Datetime} title 学校名称
@apiSuccess (return_data) {JsonArray} initials 学校首字母
@apiSuccess (return_data) {String} address 学校地址
@apiSuccess (return_data) {String} telephone 学校电话
@apiSuccess (return_data) {String} website 学校网站
@apiSuccess (return_data) {String} sort 排序
@apiSuccess (return_data) {String} report_radio 学校报录比

@apiParam (request) {Integer} school_id 学校id
@apiParam (request) {Integer} [keywords] 需要搜索的学院关键词
@apiParamExample {json} 请求term="colleges"
{
 "community":{
     "term": "colleges",
     "school_id": 2,
     "keywords": "历史"
   }
}

@apiSuccessExample {json} 返回term="colleges"
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "id": "xxx",
      "add_time": "2015-09-30 13:01:28",
      "label": [
        {
          "id": "22",
          "title": "(011)生命科学学院",
          "initials": "~",
          "sort": "99999971",
          "report_radio": "0.5"
        },
        ...
      ]
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 学院id
@apiSuccess (return_data) {Datetime} title 学院名称
@apiSuccess (return_data) {JsonArray} initials 学院首字母
@apiSuccess (return_data) {String} sort 排序
@apiSuccess (return_data) {String} report_radio 报录比

@apiParam (request) {Integer} college_id 学院id
@apiParam (request) {Integer} [keywords] 需要搜索的专业关键词
@apiParamExample {json} 请求term="majors"
{
 "community":{
     "term": "majors",
     "college_id": 529,
     "keywords": "计算机"
   }
}

@apiSuccessExample {json} 返回term="majors"
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success":true,
    "data":{
      "id": "xxx",
      "add_time": "2015-09-30 13:01:28",
      "label": [
        {
          "id": "5",
          "title": "基础数学",
          "initials": "Z",
          "sort": "99999995",
          "report_radio": "0.5"
        },
        ...
      ]
    }
}
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 专业id
@apiSuccess (return_data) {Datetime} title 专业名称
@apiSuccess (return_data) {JsonArray} initials 专业首字母
@apiSuccess (return_data) {String} sort 排序
@apiSuccess (return_data) {String} report_radio 报录比

@apiUse error_1001
@apiError (error_title) 3008 该省份不存在
@apiError (error_title) 3009 该学校不存在
@apiError (error_title) 3010 该学院不存在
@apiError (error_title) 3011 该专业不存在
@apiError (error_title) 9001 系统错误
###

###
@api {get} /community/school/:id 获取指定学校ID的学校信息
@apiName school_detail_get
@apiGroup Community
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 学校id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "id": "2",
    "title": "北京大学",
    "initials": "B",
    "address": "北京大学红二楼2102房间",
    "telephone": "010-62751354 62756913",
    "website": "http://grs.pku.edu.cn/zsxx/dtxx/",
    "sort": "99999998",
    "report_radio": "0.5"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 学校id
@apiSuccess (return_data) {Datetime} title 学校名称
@apiSuccess (return_data) {JsonArray} initials 学校首字母
@apiSuccess (return_data) {String} address 学校地址
@apiSuccess (return_data) {String} telephone 学校电话
@apiSuccess (return_data) {String} website 学校网站
@apiSuccess (return_data) {String} sort 排序
@apiSuccess (return_data) {String} report_radio 学校报录比

@apiUse error_1001
@apiError (error_title) 3009 该学校不存在
@apiError (error_title) 9001 系统错误
###

###
@api {get} /community/college/:id 获取指定学院ID的学院信息
@apiName college_detail_get
@apiGroup Community
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 学院id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "id": "3",
    "title": "(001)数学科学学院",
    "initials": "~",
    "sort": "99999997",
    "report_radio": "0.5"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 学院id
@apiSuccess (return_data) {Datetime} title 学院名称
@apiSuccess (return_data) {JsonArray} initials 学院首字母
@apiSuccess (return_data) {String} sort 排序
@apiSuccess (return_data) {String} report_radio 报录比

@apiUse error_1001
@apiError (error_title) 3010 该学院不存在
@apiError (error_title) 9001 系统错误
###

###
@api {get} /community/major/:id 获取指定专业ID的专业信息
@apiName major_detail_get
@apiGroup Community
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} id 专业id

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "id": "3",
    "title": "(001)数学科学学院",
    "initials": "~",
    "sort": "99999997",
    "report_radio": "0.5"
  }
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_data) {Integer} id 学院id
@apiSuccess (return_data) {Datetime} title 学院名称
@apiSuccess (return_data) {JsonArray} initials 学院首字母
@apiSuccess (return_data) {String} sort 排序
@apiSuccess (return_data) {String} report_radio 报录比

@apiUse error_1001
@apiError (error_title) 3011 该专业不存在
@apiError (error_title) 9001 系统错误
###
