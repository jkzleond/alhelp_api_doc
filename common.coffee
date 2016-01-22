###
@apiDefine error_title 错误码
###

###
@apiDefine return_title 返回数据
###

###
@apiDefine return_data 返回数据:data
###

###
@apiDefine req_header 请求Header
###

###
@apiDefine header_token
@apiHeader (req_header) {String} X-Auth-Token 授权token
###

###
@apiDefine request 请求参数
###

###
@apiDefine response
@apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
@apiSuccess (return_title) {JsonObject} data 封装的返回数据 
###

###
@apiDefine error_1001
@apiError (error_title) 1001 无效参数或参数结构不完整
###

###
@apiDefine error_auth
@apiError (error_title) 1401 授权失败,无效token
###