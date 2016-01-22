###
@api {post} /tokens 获取用户token(授权/登陆)
@apiName tokens
@apiGroup Auth
@apiVersion 1.0.0
@apiDescription
<p>目前仅支持passwordCredentials密码凭据登录方式（第三方登录方式待双方探讨结果后开发）</p>
<p>获取token后，之后的大部分api请求需在header中传入token（如：X-Auth-Token: xxxxxxxxxxxxxxxxxxxx）</p>
<p>此API认证成功后，除了返回token，同时返回当前用户所有数据行(用户数据待分析所有结构再做说明)</p>

@apiParam (请求参数：passwordCredentials(密码凭据)) {String} username 登录名（昵称、邮箱、手机号）
@apiParam (请求参数：passwordCredentials(密码凭据)) {String} password 登录密码

@apiParamExample {json} Body示例：
{
 "passwordCredentials":{
     "username":"username",
     "password":"password"
   }
}

@apiSuccess (return_title) {String} X-Subject-Token 认证(登录)成功返回的token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
    "data":{
      "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx",
      "member":{
        ......
      }
    }
}

@apiUse error_1001
@apiError (error_title) 1002 账号不存在密码不正确
@apiError (error_title) 1003 密码不正确
@apiError (error_title) 1004 账号不存在
###

###
@api {post} /tokens 获取用户token(授权/登陆)
@apiName tokens
@apiGroup Auth
@apiVersion 1.0.1
@apiDescription
<p>目前仅支持passwordCredentials密码凭据登录方式（第三方登录方式待双方探讨结果后开发）</p>
<p>获取token后，之后的大部分api请求需在header中传入token（如：X-Auth-Token: xxxxxxxxxxxxxxxxxxxx）</p>
<p>此API认证成功后，除了返回token，同时返回当前用户所有数据行(用户数据待分析所有结构再做说明)</p>

@apiParam {String} username 登录名（昵称、邮箱、手机号）
@apiParam {String} password 登录密码
@apiParam {String} type 第三方登录类型（限定字符串：Weibo、Qq、weixin，大小写必须一致）
@apiParam {String} key_id 第三方授权唯一标识
@apiParam {String} open_info 第三方授权信息数据（json字符串）

@apiParamExample {json} 账号密码登录示例：
{
 "passwordCredentials":{
     "username":"username",
     "password":"password"
   }
}
@apiParamExample {json} 第三方登录示例：
{
  //qqCredentials、weiboCredentials、weixinCredentials
 "weiboCredentials":{
     "key_id":"xxxxxxxxxxxxx"
   }
}

@apiSuccess (return_title) {String} X-Subject-Token 认证(登录)成功返回的token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
    "data":{
      "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx",
      "member":{
        ......
      }
    }
}

@apiUse error_1001
@apiError (error_title) 1002 账号不存在
@apiError (error_title) 1003 密码不正确
@apiError (error_title) 1004 账号已被禁用
@apiError (error_title) 1013 未绑定账号
###

###
@api {post} /security/verify/sms 获取短信验证码
@apiName verify_sms
@apiGroup Security
@apiVersion 1.0.1
@apiDescription
<p>已实现实现短信发送(正式版本)</p>

@apiParam (request) {String} type 短信类型（reg：注册、ser：发布服务、unlock：激活账号）
@apiParam (request) {String} phone 手机号

@apiParamExample {json} Body示例：
{
  "type":"reg",
  "phone": "phone"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} signKey 签名密钥(用于提供验证码)
@apiSuccess (return_data) {Int} create_time 验证码的创建时间
@apiSuccess (return_data) {Int} expires_at 验证码的有效期(目前为20分钟)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "signKey": "v5ojtj80a9m2ck8u21l1tdeol5",
    "create_time": 1443010620,
    "expires_at": 1443082620
  }
}

@apiUse error_1001
###

###
@api {post} /They/index 获取他人信息
@apiName get_they_info
@apiGroup They
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type="theyInfo" 操作类型
@apiParam (request) {String} identity 用户身份(0表示教师、1表示学生)
@apiParam (request) {String} nickname 用户昵称

@apiParamExample {json} Body示例：
{
  "type": "theyInfo",
  "identity":"1",
  "nickname":"nickname"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} schoolPlace 城市名
@apiSuccess (return_data) {String} collegeName 学院名
@apiSuccess (return_data) {String} schoolName 学校名
@apiSuccess (return_data) {String} followNum 关注数
@apiSuccess (return_data) {String} fansNum 粉丝数


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
  "data":{
    "schoolPlace":"schoolPlace",
    "collegeName":"collegeName",
    "schoolName":"schoolPlace",
    "followNum":"6",
    "fansNum":"5"
  }
}


@apiUse error_1001
###

###
@api {post} /They/index 获取他人关注状态
@apiName get_they_follow_status
@apiGroup They
@apiVersion 1.0.0

@apiUse header_token

@apiParam {String} type="getFollowStatus" 操作类型
@apiParam {String} nickname 用户昵称

@apiParamExample {json} Body示例：
{
  "type": "getFollowStatus",
  "nickname":"nickname"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} follow 关注状态(true表示已关注，false表示没有关注)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
  "data":{
    "follow":true,
  }
}


@apiUse error_1001
###

###
@api {post} /They/index 设置他人关注状态
@apiName set_they_follow_status
@apiGroup They
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type="setFollowStatus" 操作类型
@apiParam (request) {Boolean} status 要设置的关注状态(true表示关注，false表示取消关注)
@apiParam (request) {String} nickname 用户昵称

@apiParamExample {json} Body示例：
{
  "type": "getFollowStatus",
  "status":true,
  "nickname":"nickname"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} result 操作结果(true表示成功，false表示失败，失败情况一般为重复操作导致)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
  "data":{
    "result":true,
  }
}


@apiError (error_title) 1011 已关注此人 
@apiError (error_title) 1404 找不到此人 
@apiUse error_1001
###

###
@api {post} /They/index 获取他人关注状态
@apiName get_they_follow_status
@apiGroup They
@apiVersion 1.0.0

@apiUse header_token

@apiParam {String} type="getFollowStatus" 操作类型
@apiParam {String} nickname 用户昵称

@apiParamExample {json} Body示例：
{
  "type": "getFollowStatus",
  "nickname":"nickname"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} follow 关注状态(true表示已关注，false表示没有关注)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
  "data":{
    "follow":true,
  }
}


@apiUse error_1001
###

###
@api {post} /They/index 设置他人关注状态
@apiName set_they_follow_status
@apiGroup They
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type="setFollowStatus" 操作类型
@apiParam (request) {Boolean} status 要设置的关注状态(true表示关注，false表示取消关注)
@apiParam (request) {String} nickname 用户昵称

@apiParamExample {json} Body示例：
{
  "type": "getFollowStatus",
  "status":true,
  "nickname":"nickname"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} result 操作结果(true表示成功，false表示失败，失败情况一般为重复操作导致)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
  "data":{
    "result":true,
  }
}


@apiError (error_title) 1011 已关注此人 
@apiError (error_title) 1404 找不到此人 
@apiUse error_1001
###

###
@api {post} /They/index 获取他人关注状态
@apiName get_they_follow_status
@apiGroup They
@apiVersion 1.0.0

@apiUse header_token

@apiParam {String} type="getFollowStatus" 操作类型
@apiParam {String} nickname 用户昵称

@apiParamExample {json} Body示例：
{
  "type": "getFollowStatus",
  "nickname":"nickname"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} follow 关注状态(true表示已关注，false表示没有关注)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
  "data":{
    "follow":true,
  }
}

###

###
@api {get} /talks/:id/comment 评论或回复说说
@apiName get_talks_comment
@apiGroup Talks
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} id 说说ID

@apiParam (Body参数) {String} content 评论内容
@apiParam (Body参数) {String} pillow_talk 是否不可见(0表示对所有人可见，1表示仅个人和被回复人可见)
@apiParam (Body参数) {Array} [images] 图片(数组格式，传入已上传图片的name)

@apiParamExample {json} Body示例：
{
  "content": "content",
  "pillow_talk": "0"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {Int} comment_id 评论成功(新评论的ID)


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "comment_id": 3618
  }
}


@apiError (error_title) 1500 操作失败
@apiError (error_title) 1404 找不到此说说
@apiUse error_1001
###

###
@api {post} /talks 发布说说
@apiName add_talks
@apiGroup Talks
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} content 说说内容
@apiParam (request) {Int} type 说说查看权限类型（1:所有人可见，2:仅自己可见，3:仅粉丝可见，4:仅我关注的人可见）
@apiParam (request) {Int} community_id 圈子ID（从原代码分析来看，VIP可以不指定圈子）
@apiParam (request) {Int} [fid] 要转发的说说ID
@apiParam (request) {Array} [remind] 要提醒谁来看,数组元素是要提醒的用户ID,int型,例如：[56,8789,5455,...]

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} talks_id 新增的说说ID


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "talks_id": 3641
  }
}


@apiError (error_title) 4011 此说说已转发过
@apiError (error_title) 4012 说说内容不能为空
@apiError (error_title) 4013 必须选择圈子
@apiError (error_title) 1404 找不到要转发的说说
@apiError (error_title) 1500 操作失败
@apiUse error_1001
###

###
@api {get} /talks/similarity/:id 获取相似说说
@apiName similarity_talks
@apiGroup Talks
@apiVersion 1.0.0
@apiDescription
4-4-3tiwen，匹配使用分词匹配，词汇数量大于2个的时候可以匹配到数据

@apiUse header_token

@apiParam (request) {String} id 说说ID

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": [
    {
      "id": "3605",
      "member_nickname": "xzb研友邦",
      "content": "大纲都出来了，英语分是不是该提一提了，四小点，看一看：1.关注大纲考察内容 "
    },
    {
      "id": "3543",
      "member_nickname": "yangjinglaoshi",
      "content": "（并坚持了三年，痛并快乐地活着，我会继续坚持下去！共勉！2016考研必胜！"
    },
    {
      "id": "3507",
      "member_nickname": "夏徛荣",
      "content": "面来说）；on good terms; come to terms with （让步）"
    },
  }
}

###

###
@api {get} /talks/:id 获取说说详情
@apiName get_talks_details
@apiGroup Talks
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} id 说说ID

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} details 说说详情
@apiSuccess (return_data) {String} comment 评论列表

@apiSuccess (返回数据:data:details) {String} id 说说ID
@apiSuccess (返回数据:data:details) {String} member_id 用户ID
@apiSuccess (返回数据:data:details) {String} member_nickname 用户昵称 
@apiSuccess (返回数据:data:details) {String} avatar 用户头像
@apiSuccess (返回数据:data:details) {String} schoolPlace 学校城市地区
@apiSuccess (返回数据:data:details) {String} schoolName 大学名
@apiSuccess (返回数据:data:details) {String} collegeName 学院名 
@apiSuccess (返回数据:data:details) {String} subjectName 学科名
@apiSuccess (返回数据:data:details) {String} content 说说内容
@apiSuccess (返回数据:data:details) {String} praise_num 点赞数
@apiSuccess (返回数据:data:details) {Array} attachments 图片附件URL地址列表

@apiSuccess (返回数据:data:comment) {String} id 回复ID
@apiSuccess (返回数据:data:comment) {String} member_id 回复用户ID
@apiSuccess (返回数据:data:comment) {String} member_nickname 回复用户昵称 
@apiSuccess (返回数据:data:comment) {String} avatar 回复用户头像
@apiSuccess (返回数据:data:comment) {String} content 回复内容
@apiSuccess (返回数据:data:comment) {Object} to 回复谁（如果说说发布人回复他人则有），格式：id[被回复用户ID]，nickname[被回复用户昵称]


@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "details": {
      "id": "22",
      "member_id": "14257",
      "member_nickname": "夏徛荣",
      "school_id": "0",
      "content": "【夏老师回答问题专用！】考研路上，我一直都与孩子们同在！多少个不眠之夜和早起晨读的日子，终于等到这一天，还好你没放弃！2015年考研大戏终于落下帷幕，心中的酸甜苦辣一定有很多话想说吧!大家也一定有不少问题想问我。就写在这条说说的下面吧，我会一一回复的。",
      "praise_num": "44",
      "avatar": "http://image.alhelp.net/images/84d4e01ac187a6f5e2a2bc464ff739fa.jpg",
      "attachments": [
        "http://image.alhelp.net/images/c977471fce73a70c330fc6a51cdae0570f4a9870.jpg"
      ]
    },
    "comment": [
      {
        "id": "3595",
        "member_id": "24315",
        "member_nickname": "xzb224315",
        "content": "夏老师您好，我觉得基础词比必考词难背多了，基础词有很多陌生且复杂难记的名词，该怎么背呢？",
        "avatar": "http://wx.qlogo.cn/mmopen/HWVuF8KibrNPxTeZt5lCuM36RlEGHQPczRQgLl8AOhnv6YQQkCBKqLW8yJTXjpEuiblqONDQkUQG5sMCvr0FibveHKLTC5OAtO1/0",
        "to": null
      },
      {
        "id": "3586",
        "member_id": "24389",
        "member_nickname": "wuikeee",
        "content": "夏老师好，下载专区里的每日单词不能下载了，显示文件不存在，可不可以关注一下~~谢谢~~",
        "avatar": "http://www.alhelp.net/ucenter/images/noavatar_small.gif",
        "to": null
      },
      {
        "id": "3556",
        "member_id": "22534",
        "member_nickname": "222534",
        "content": "夏老师，你好，我是不需要考数学的，只需要准备专业课，我想请问一下：接下来我应该如何安排复习时间",
        "avatar": "http://wx.qlogo.cn/mmopen/Q3auHgzwzM6xgu9pxFhQ09NytGG9acqwdqp58Sq2piceX6gianaHu9m07iaPgCxrNmStT4R1gpQsFQ7NytGrgLJ9I4YQFrktibcGiaz1lDzL3baw/0",
        "to": null
      }
    ]
  }
}


@apiError (error_title) 4410 当前说说已被删除
@apiError (error_title) 4411 当前说说不可见
@apiError (error_title) 1404 找不到此说说
@apiUse error_1001
###



###
@api {get} /upload/image 上传图片
@apiName upload_image
@apiGroup Upload Download
@apiVersion 1.0.0
@apiDescription 需要模拟form上传（一次只能上传一个文件），目前图片上传路径使用的是测试网站路径，测试情况下http://image.alhelp.net/images/......不能显示

@apiUse header_token


@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccess (return_data) {String} name 附件名(用于提供需要给需要附件的资源)
@apiSuccess (return_data) {String} path 附件URL地址

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success": true,
  "data": {
    "name": "0bbb95f2181d980http://youtube.com/b8ac13c89b692458567263ef4",
    "path": "http://image.alhelp.net/images/0bbb95f2181d980b8ac13c89b692458567263ef4.jpg",
  }
}


@apiError (error_title) 1417 上传失败
###

###
@api {get} /fans 获取我的粉丝（v1/fans/page/1分页）
@apiName fans
@apiGroup Fans
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "fans":{
    "list":[
      {
        " add_time":"2332112",
        " from_member_id":"1323",
        " from_member_nickname":"name",
        " last_pillow_talk_time":"123213234"
      },
    ……
    ],
    " count":20,
    " next_page":null
  }
}
###

###
@api {get} /fans/:uid 获取某人的粉丝（v1/fans/:uid/page/1分页）
@apiName fans_u
@apiGroup Fans
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "fans":{
    "list":[
      {
        " add_time":"2332112",
        " from_member_id":"1323",
        " from_member_nickname":"name",
        " last_pillow_talk_time":"123213234"
      },
    ……
    ],
    " count":20,
    " next_page":null
  }
}

###

###
@api {get} /follow 获取我关注的人（v1/follow/page/1分页）
@apiName follow
@apiGroup Fans
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "fans":{
    "list":[
      {
        " add_time":"2332112",
        " from_member_id":"1323",
        " from_member_nickname":"name",
        " last_pillow_talk_time":"123213234"
      },
    ……
    ],
    " count":20,
    " next_page":null
  }
}
###

###
@api {get} /follow/:uid 获取某人关注的人（v1/follow/:uid/page/1分页）
@apiName follow_u
@apiGroup Fans
@apiVersion 1.0.0

@apiUse header_token

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "fans":{
    "list":[
      {
        " add_time":"2332112",
        " from_member_id":"1323",
        " from_member_nickname":"name",
        " last_pillow_talk_time":"123213234"
      },
    ……
    ],
    " count":20,
    " next_page":null
  }
}
###

###
@api {get} /talks/listby/:type/:type_id 获取说说列表（通过大学、学院或专业ID）
@apiName listby
@apiGroup Talks
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type 筛选类型，university（大学）、school（学院）、major（专业）
@apiParam (request) {String} type_id 筛选类型对于数据的ID（大学ID、学院ID、专业ID）

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

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
@apiUse error_1001
###

###
@api {get} /talks/listby/:type/:type_id 获取说说列表（通过大学、学院或专业ID）
@apiName listby
@apiGroup Talks
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {String} type 筛选类型，university（大学）、school（学院）、major（专业）
@apiParam (request) {String} type_id 筛选类型对于数据的ID（大学ID、学院ID、专业ID）

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

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
@api {post} /zoom_image 缩放图片
@apiName zoom_image
@apiGroup Upload Download
@apiVersion 1.0.0
@apiDescription
默认按原比例缩放（最大高宽为128px），如果高宽比差异不大则按照128x128缩放

@apiUse header_token

@apiParam (request) url 图片url地址

@apiParamExample {json} Body示例：
{
  "url": "http://v1.alhelp.net/Public/Home_default/images/lesson/recomandpic.jpg"
}

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
Content-type: image/jpeg
--图片二进制数据--

@apiError (error_title) 1418 无效的图片地址或连接超时(包含错误的文件格式)
###