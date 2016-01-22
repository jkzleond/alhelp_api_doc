###
@api {put} /switch_role 切换用户身份
@apiName switch_role
@apiGroup User
@apiVersion 1.0.0

@apiParam {String} role 角色（1表示学生，2表示教师）
@apiParamExample {json} Body示例：
{
 "role":"1"
}

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
    "data":null
}

@apiError (error_title) 1012 切换失败
@apiUse error_1001
###

###
@api {get} /post_day 获取今天离考研时间的剩余天数
@apiName post_day
@apiGroup Aritcle
@apiVersion 1.0.0

@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据
@apiSuccess (return_title) {JsonObject} day 剩余天数（负数代表已超过的天数）

@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
{
  "success":true,
    "data":{
    	"day":3
    }
}
###