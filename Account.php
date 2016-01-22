<?php
/**
 * @apiDescription author liuhongdong
 * 
 *
 */
class Account {

	/**
	 * @api {get} /account/available_bankcards 获取当前用户可用银行卡＋
	 * @apiName available_bankcards_get
	 * @apiGroup Account
	 * @apiVersion 1.0.1
	 * @apiDescription v1.0.1版本返回结果加入开户银行名称
	 *
	 * @apiUse header_token
	 *
	 * @apiSuccessExample {json} 成功示例：
	 * HTTP/1.1 200 OK
	 * header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
	 * {
	 * "success": true,
	 * "data": [
	 * {
	 * "id": "1",
	 * "member_id": "24398",
	 * "card_type": "1",
	 * "card_num": "xxxxxxxxxxxxxxxxxxxx",
	 * "card_name": "张xx",
	 * "add_time": "2014-09-01 12:03:56",
	 * "status": "2",
	 * "remark": "",
	 * "is_use": "0",
	 * "card_type_text":"中国银行"}
	 * },
	 * ...
	 * ]
	 * }
	 *
	 * @apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
	 * @apiSuccess (return_title) {JsonObject} data 封装的返回数据
	 * @apiSuccess (return_title) {Integer} id 银行卡的id
	 * @apiSuccess (return_title) {String} member_id 银行卡所属用户
	 * @apiSuccess (return_title) {String} card_num 银行卡的卡号
	 * @apiSuccess (return_title) {String} card_type 银行卡的类型
	 * @apiSuccess (return_title) {String} add_time 银行卡添加时间
	 * @apiSuccess (return_title) {String} status 银行卡的状态， 0=未通过 1=审核中 2=通过 3=禁用
	 * @apiSuccess (return_title) {String} remark 未知
	 * @apiSuccess (return_title) {String} is_use 未知
	 * @apiSuccess (return_title) {String} card_type_text 开户银行名称
	 */
	function available_bankcards_get($param) {
		;
	}

	/**
	 * @api {get} /account/cash_recording/:status/:n:unit/:page 获取指定时间段的提现记录＋
	 * *@apiName cash_recording_get
	 * *@apiGroup Account
	 * *@apiVersion 1.0.1
	 *
	 * @apiUse header_token
	 *
	 * @apiParam (request) {Integer=0,1,2,3} status=0
	 * 状态：0－全部，1－待审核,2－审核通过，3－审核不通过
	 * @apiParam (request) {Integer} n=1 数量
	 * @apiParam (request) {String=d,w,m,y} unit=w 单位，d: 天, w: 星期, m: 月, y: 年
	 * @apiParam (request) {Integer} page=1 当前页码
	 * @apiParamExample 获取1天:
	 * /account/cash_recording/0/1d/1
	 * @apiParamExample 获取1周:
	 * /account/cash_recording/0/1w/1
	 * @apiParamExample 获取1月:
	 * /account/cash_recording/0/1m/1
	 * @apiParamExample 获取1年:
	 * /account/cash_recording/0/1y/1
	 *
	 * @apiSuccessExample {json} 成功示例：
	 * HTTP/1.1 200 OK
	 * header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
	 * {
	 * "success": true,
	 * "data": {
	 * "list": [
	 * {
	 * "id": "2",
	 * "serial_number": "201511241704561073",
	 * "member_id": "1073",
	 * "card_id": "15",
	 * "balance": "5",
	 * "address": "测试",
	 * "type": "1",
	 * "add_time": "2015-11-24 17:04:56",
	 * "status": "1",
	 * "remark": null,
	 * "is_verify": "0",
	 * "balance_now": "3.50",
	 * "balance_frozen": "0.00",
	 * "card_name": "张馨月",
	 * "card_num": "622848****167",
	 * "card_type": "3",
	 * "nickname": "abc",
	 * "total": "3.50",
	 * "card_type_text": "中国农业银行",
	 * "status_text": "待审核"
	 * }
	 * ],
	 * "count": "2",
	 * "next_page": "http://api.alhelp.net/v1/account/cash_recording/0/1m/2"
	 * }
	 * }
	 *
	 * @apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
	 * @apiSuccess (return_title) {JsonObject} data 封装的返回数据
	 * @apiSuccess (return_title) {Integer} count 记录总数
	 * @apiSuccess (return_title) {String} next_page 下一页url
	 * @apiSuccess (return_title) {JsonObject} list 数据集合
	 *
	 * @apiSuccess (return_title) {Integer} id 记录id
	 * @apiSuccess (return_title) {String} nickname 用户名
	 * @apiSuccess (return_title) {String} card_num 卡号
	 * @apiSuccess (return_title) {String} card_type_text 开户银行名称
	 * @apiSuccess (return_title) {String} card_name 开户姓名
	 * @apiSuccess (return_title) {String} address 开户行地址
	 * @apiSuccess (return_title) {Float} balance 提现金额
	 * @apiSuccess (return_title) {DateTime} add_time 提现日期
	 * @apiSuccess (return_title) {Float} balance_now 账号余额
	 * @apiSuccess (return_title) {Float} balance_frozen (冻结金额)
	 * @apiSuccess (return_title) {String} status_text 状态
	 * @apiSuccess (return_title) {String} remark
	 * 备注：您的提现申请已经通过审核，您的新助邦收入将以支付宝的方式转入您的账户，请确认查收！
	 *
	 * @apiError (error_title) 3018 日期格式错误
	 * @apiError (error_title) 2005 参数值错误
	 */
	function cash_recording_get() {
		;
	}

	/**
	 * @api {get} /account/coin_recording/:n:unit/:page 获取指定时间段的金币记录＋
	 * *@apiName coin_recording_get
	 * *@apiGroup Account
	 * *@apiVersion 1.0.1
	 *
	 * @apiUse header_token
	 *
	 * @apiParam (request) {Integer} n=1 数量
	 * @apiParam (request) {String=d,w,m,y} unit=w 单位，d: 天, w: 星期, m: 月, y: 年
	 * @apiParam (request) {Integer} page=1 当前页码
	 * @apiParamExample 获取1天:
	 * /account/coin_recording/1d/1
	 * @apiParamExample 获取1周:
	 * /account/coin_recording/1w/1
	 * @apiParamExample 获取1月:
	 * /account/coin_recording/1m/1
	 * @apiParamExample 获取1年:
	 * /account/coin_recording/1y/1
	 *
	 * @apiSuccessExample {json} 成功示例：
	 * HTTP/1.1 200 OK
	 * header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
	 * {
	 * "success": true,
	 * "data": {
	 * "list": [
	 * {
	 * "id": "36520",
	 * "type": "_coin",
	 * "type_text": "消耗金币",
	 * "uid": "22448",
	 * "uname": "222448",
	 * "score": "0",
	 * "table_name": "attachments",
	 * "table_id": "3844",
	 * "action": "Home/Share/fileDown",
	 * "msg": "重复下载资料无需消耗金币",
	 * "create_time": "1437661058",
	 * "status": "1",
	 * "add_time": "2015-07-23 22:17:38"
	 * }
	 * ],
	 * "now_coin":"10",
	 * "count": "2",
	 * "next_page": "http://api.alhelp.net/v1/account/coin_recording/1m/2"
	 * }
	 * }
	 *
	 * @apiSuccess (return_title) {Boolean} success true表示成功，false表示失败
	 * @apiSuccess (return_title) {JsonObject} data 封装的返回数据
	 * @apiSuccess (return_title) {Integer} now_coin 用户当前金币数
	 * @apiSuccess (return_title) {Integer} count 记录总数
	 * @apiSuccess (return_title) {String} next_page 下一页url
	 * @apiSuccess (return_title) {JsonObject} list 数据集合
	 *
	 * @apiSuccess (return_title) {Integer} id 记录id
	 * @apiSuccess (return_title) {String} type 类型：_coin－消耗金币，coin－获得金币
	 * @apiSuccess (return_title) {String} type_text 类型名称 消耗金币
	 * @apiSuccess (return_title) {String} uid 用户id
	 * @apiSuccess (return_title) {String} uname 用户名
	 * @apiSuccess (return_title) {String} msg 使用获得描述
	 * @apiSuccess (return_title) {DateTime} add_time 使用日期
	 * 
	 * @apiError (error_title) 3018 日期格式错误
	 * @apiError (error_title) 2005 参数值错误
	 */
	function coin_recording_get() {
		;
	}
}

?>