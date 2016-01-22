###
@api {get} /logout 注销登录
@apiName logout
@apiGroup Auth
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}
###
###
@api {post} /first_third_login 第三方第一次登录（自动创建账号）
@apiName first_third_login
@apiGroup Auth
@apiVersion 1.0.0

@apiParam {String} type 第三方登录类型（限定字符串：Weibo、Qq、weixin，大小写必须一致）
@apiParam {String} key_id 第三方授权唯一标识
@apiParam {String} open_info 第三方授权信息数据（json字符串）

@apiParamExample {json} body示例：
{
  "type": "weixin",
  "key_id": "Wx1231231343433",
  "open_info": "{...}"
}

@apiSuccess (return_title) {JsonObject} token token数据，参考《Auth - 获取用户token》

@apiError (error_title) 1014 此授权已绑定账号 
@apiUse error_1001
###

###
@api {get} /logout 注销登录
@apiName logout
@apiGroup Auth
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}
###

###
@api {post} /user_binding 第三方第一次登录（绑定已有账号）
@apiName user_binding
@apiGroup Auth
@apiVersion 1.0.0

@apiParam {String} type 第三方登录类型（限定字符串：Weibo、Qq、weixin，大小写必须一致）
@apiParam {String} key_id 第三方授权唯一标识
@apiParam {String} open_info 第三方授权信息数据（json字符串）
@apiParam {String} username 登录名（昵称、邮箱、手机号）
@apiParam {String} password 登录密码

@apiParamExample {json} body示例：
{
 "bindingCredentials":{
     "type":"Qq",
     "key_id":"xxxxxxxxxxxxxxxxxxxx",
     "open_info":"{...}",
     "username":"username",
     "password":"password"
   }
}


@apiSuccess (return_title) {JsonObject} token token数据，参考《Auth - 获取用户token》

@apiUse error_1001
@apiError (error_title) 1002 账号不存在
@apiError (error_title) 1003 密码不正确
@apiError (error_title) 1004 账号已被禁用
@apiError (error_title) 1015 此账号已被绑定
###

###
@api {post} /release 发布服务、需求
@apiName demand_release
@apiGroup Demand
@apiVersion 1.0.0

@apiParam {String} role_type 发布类型（1：需求、2：服务）
@apiParam {String} demand_type 服务类型【服务：1.资料、2.答疑、3.授课、4.直播课】，【需求：1.资料、2.答疑、3.授课】
@apiParam {String} require_identity 身份要求，0表示不限【服务：1.在线学生】，【需求：2.老师、3.机构、4.学长】
@apiParam {String} require_authenticate 实名认证要求（1.要求实名认证、0.不限）
@apiParam {String} require_security 信誉要求（1.信誉保障、0.不限）
@apiParam {String} profes_type 专业类型（1.非统考、2.统考、3.公开课）
@apiParam {Object} profes_data 专业信息（具体参数见示例）
@apiParam {String} description 一句话描述
@apiParam {String} content 具体描述（直播课不需要）
@apiParam {String} cost 服务费用、意愿费用
@apiParam {String} content_course 课程主要内容
@apiParam {String} content_reference 参考讲义
@apiParam {String} yy_number YY号
@apiParam {String} set_time 开课时间（时间戳年月日时分）
@apiParam {String} [qq] QQ号（请默认把用户已绑定的QQ号填入文本框）
@apiParam {String} [phone] 手机号（请默认把用户已绑定的手机号填入文本框）
@apiParam {String} [image_sha1] 封面图片（成功上传图片返回的sha1,测试均使用3b8d16aaf3fcf49bf392ae81838db3e3d9effdc0，只有发布服务必须）

@apiParamExample {json} 【发布服务、需求(资料、答疑、授课)】示例：
{
  "role_type": "2",
  "demand_type": 1,
  "require_identity": "0",
  "require_authenticate": "0",
  "require_security": "0",
  "profes_type": "1",
  "profes_data": {
    ...
  },
  "description": "12345678901234567890",
  "content": "具体描述",
  "cost": "100",
  "qq": "1051389457",
  "phone": "18787111442",
  "image_sha1": "3b8d16aaf3fcf49bf392ae81838db3e3d9effdc0"//仅发布服务需要
}
@apiParamExample {json} 【发布服务(直播间)】示例：
{
  "role_type": "2",
  "demand_type": 4,
  "require_identity": "0",
  "require_authenticate": "0",
  "require_security": "0",
  "profes_type": "1",
  "profes_data": {
    ...
  },
  "description": "12345678901234567890",
  "content": "具体描述",
  "cost": "100",
  "qq": "1051389457",
  "phone": "18787111442",
  "image_sha1": "3b8d16aaf3fcf49bf392ae81838db3e3d9effdc0",
  "content_course": "aaa",
  "content_reference": "bbb",
  "yy_number": "1123456",
  "set_time": "1443545656"
}

@apiParamExample {json} 【profes_data专业信息】示例：
//非统考
"profes_data": {
  "city": "1",//区域
  "university": "2",//学校
  "college": "3",//学院
  "major": "4"//专业
}
//统考
"profes_data": {
  "major_classify": "4",//专业分类
  "major_subject": "1"//专业
}
//公共课（什么都没有）
"profes_data": {
}

@apiSuccess (return_title) {String} id 当前发布的ID

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "id": 4831
  }
}

@apiError (error_title) 6002 价格格式有误
@apiError (error_title) 6004 一句话不能为空
@apiError (error_title) 6005 标题字符长度必须在20字符内
@apiError (error_title) 6006 必须提供专业信息
@apiError (error_title) 6007 请选择一个区域
@apiError (error_title) 6008 请选择区域所在的学校
@apiError (error_title) 6009 请选择专业类型
@apiError (error_title) 6010 请选择专业分类
@apiError (error_title) 6011 具体描述不能为空
@apiError (error_title) 6012 主要课程内容不能为空
@apiError (error_title) 6013 参考讲义不能为空
@apiError (error_title) 6014 请填写一个YY号码
@apiError (error_title) 6015 请上传主题图片
@apiUse error_1001
###

###
@api {post} /unlock 用户解锁
@apiName unlock
@apiGroup User
@apiVersion 1.0.0

@apiParam {String} phone 手机号
@apiParam {String} signKey 短信验证Key
@apiParam {String} code 短信验证码

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": null
}

@apiError (error_title) 1030 验证码无效
###

###
@api {get} /talks/list 获取我的说说
@apiName talks_self_list
@apiGroup Talks
@apiVersion 1.0.0

@apiUse header_token


@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} list 说说列表
@apiSuccess (return_data) {String} count 当前数据在总数
@apiSuccess (return_data) {String} next_page 下一页地址

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "list": {...},
    "count": 0,
    "next_page": null
  }
}
###

###
@api {get} /talks/list/all 获取所有人的说说
@apiName talks_all_list
@apiGroup Talks
@apiVersion 1.0.0

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} list 说说列表
@apiSuccess (return_data) {String} count 当前数据在总数
@apiSuccess (return_data) {String} next_page 下一页地址

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "list": {...},
    "count": 0,
    "next_page": null
  }
}
###

###
@api {get} /talks/list/:uid 获取某人的说说
@apiName talks_someone_list
@apiGroup Talks
@apiVersion 1.0.0

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} list 说说列表
@apiSuccess (return_data) {String} count 当前数据在总数
@apiSuccess (return_data) {String} next_page 下一页地址

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "list": {...},
    "count": 0,
    "next_page": null
  }
}
###

###
@api {get} /talks/list/fans 获取我的粉丝的说说
@apiName talks_fans_list
@apiGroup Talks
@apiVersion 1.0.0

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} list 说说列表
@apiSuccess (return_data) {String} count 当前数据在总数
@apiSuccess (return_data) {String} next_page 下一页地址

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "list": {...},
    "count": 0,
    "next_page": null
  }
}
###

###
@api {get} /talks/list/follow 获取我关注的人的说说
@apiName talks_follow_list
@apiGroup Talks
@apiVersion 1.0.0

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} list 说说列表
@apiSuccess (return_data) {String} count 当前数据在总数
@apiSuccess (return_data) {String} next_page 下一页地址

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "list": {...},
    "count": 0,
    "next_page": null
  }
}
###