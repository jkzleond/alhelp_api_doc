<?php

/**
 * @apiDescription This is the Description.
 * It is multiline capable.
 *
 * Last line of Description.
 * @apiGroup user  用户类接口
 */
class User {
	
	/**
	 * @apiIgnore Not finished Method
	 * @api {get} /register 用户注册
	 * @apiName register
	 * @apiGroup user
	 * @apiVersion 1.0.0
	 *
	 *
	 * @apiHeader {String} access-key Users unique access-key.
	 *
	 *
	 * @apiParam (register(参数)) {String} username 用户名
	 * @apiParam (register(参数)) {String} password 密码
	 * @apiParam (register(参数)) {int} phone 手机号
	 * @apiParam (register(参数)) {JsonObject} verify 验证信息
	 * @apiParam (verify(参数)) {String} code 验证码
	 * @apiParam (verify(参数)) {String=1,2,3,99} signKey=1 验证Key
	 *
	 * @apiParamExample {json} body示例：
	 * {
	 * "register": {
	 * "username": "xxxxxx",
	 * "password": "xxxxx",
	 * "phone": "13800000000",
	 * "verify": {
	 * "code": "xxxx",
	 * "signKey": "signKey"
	 * }
	 * }
	 * }
	 *
	 *
	 * @apiSuccessExample {json} Success-Response:
	 * HTTP/1.1 200 OK
	 * {
	 * "success": true,
	 * "data": {
	 * "id": "24326",
	 * "phone": null,
	 * ......
	 * }
	 * }
	 *
	 * @apiSuccess (返回数据) {Boolean} success True表示成功，False表示失败
	 * @apiSuccess (返回数据) {JsonObject} data 封装返回用户数据，字段详见《数据表与字段注释》
	 *
	 * @apiUse error_1001
	 * @apiError (error_title) 3001 用户名已存在
	 * @apiError (error_title) 3002 手机号已存在
	 * @apiError (error_title) 3003 密码必须是6-30位
	 */
	function register($param) {
	}
	
	/**
	 * @api {post} /tokens 获取用户token(授权/登陆)＋
	 * @apiName tokens
	 * @apiGroup Auth
	 * @apiVersion 1.0.2
	 * @apiDescription
	 * <p>目前仅支持passwordCredentials密码凭据登录方式（第三方登录方式待双方探讨结果后开发）</p>
	 * <p>获取token后，之后的大部分api请求需在header中传入token（如：X-Auth-Token: xxxxxxxxxxxxxxxxxxxx）</p>
	 * <p>此API认证成功后，除了返回token，同时返回当前用户所有数据行(用户数据待分析所有结构再做说明)</p>
	 *
	 * @apiParam {String} username 登录名（昵称、邮箱、手机号）
	 * @apiParam {String} password 登录密码
	 * @apiParam {String} type 第三方登录类型（限定字符串：Weibo、Qq、weixin，大小写必须一致）
	 * @apiParam {String} key_id 第三方授权唯一标识
	 * @apiParam {String} open_info 第三方授权信息数据（json字符串）
	 *
	 * @apiParamExample {json} 账号密码登录示例：
	 * {
	 * "passwordCredentials":{
	 * "username":"username",
	 * "password":"password"
	 * }
	 * }
	 * @apiParamExample {json} 第三方登录示例：
	 * {
	 * //qqCredentials、weiboCredentials、weixinCredentials
	 * "weiboCredentials":{
	 * "key_id":"xxxxxxxxxxxxx"
	 * }
	 * }
	 *
	 * @apiSuccess (return_title) {String} X-Subject-Token 认证(登录)成功返回的token
	 * @apiSuccess (return_title) {Boolean} success true表示成功，false表示失败 
	 * @apiSuccess (return_title) {JsonObject} data 封装的返回数据
	 * @apiSuccess (return_title) {Integer} is_masters 用户字段 1表示是名师，0表示不是名师
	 *
	 * @apiSuccessExample {json} 成功示例：
	 * HTTP/1.1 200 OK
	 * {
	 * "success":true,
	 * "data":{
	 * "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx",
	 * "member":{
	 * ......
	 * }
	 * }
	 * }
	 *
	 * @apiUse error_1001
	 * @apiError (error_title) 1002 账号不存在
	 * @apiError (error_title) 1003 密码不正确
	 * @apiError (error_title) 1004 账号已被禁用
	 * @apiError (error_title) 1013 未绑定账号
	 */
	function login() {
		;
	}
}
?>