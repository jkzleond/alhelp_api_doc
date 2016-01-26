###
@api {get} /demand/listens/:demand_id 获取指定公开课下所有的试听列表
@apiName listen_get_by_demand_id
@apiGroup Demand 
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} demand_id 公开课id
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
        "id": "420",
        "member_id": "22878",
        "demand_member_id": "22784",
        "demand_id": "4371",
        "bid_id": "191",
        "time": "2015-07-18 10:00:00",
        "content": "了解整个会计学硕考试大纲",
        "listen_type": "2",
        "listen_number": "598592759",
        "listen_class": "0",
        "status": "1",
        "add_time": "2015-07-11 11:34:15"
      },
    ......
    ],
    "count": 10,
    "next_page": "http://api.alhelp.net/v1/demand/listens/4371/page/2"
  }
}

@apiError (error_title) 5997 服务或需求不存在
###

###
@api {get} /public/similar/:public_id 获取与指定公开课相似的公开课
@apiName public_similar_get
@apiGroup Demand 
@apiVersion 1.0.0

@apiUse header_token

@apiParam (request) {Integer} public_id 公开课id
@apiSuccessExample {json} 成功示例：
HTTP/1.1 200 OK
header "X-Subject-Token":"xxxxxxxxxxxxxxxxxxxx"
{
  "success": true,
  "data": {
    "list": [
      {
       "id": "4814",
       "pid": null,
       "member_id": "24326",
       "member_name": "高教社培训网络学院",
       "role_type": "1",
       "demand_type": "4",
       "require_identity": "0",
       "require_authenticate": "0",
       "require_security": "0",
       "description": "测试公开课3",
       "content_demand": null,
       "content_course": null,
       "content_reference": null,
       "remarks": null,
       "yy_number": null,
       "image": null,
       "cost_type": "1",
       "cost": null,
       "platform_cost": "0",
       "profes_type": "1",
       "city": "1800000",
       "university": "1802000",
       "college": "1802007",
       "major_code": "100102",
       "major": "1802009",
       "qq": "1753453663",
       "mobile": "15808862575",
       "set_time": null,
       "close_remark": null,
       "rating": "0",
       "status": "1",
       "add_time": "2015-11-21 23:51:11",
       "update_time": null,
       "praise_num": "0",
       "review_num": "0",
       "learning_teaching_plan": null,
       "is_message": "0",
       "is_bid": "0",
       "is_contract": "0",
       "is_automatic": "1",
       "attachment": "",
       "set_yy": "",
       "member_nickname": "高教社培训网络学院",
       "collect_num": "0",
       "num_view": "0",
       "memo": "非统考 学校 学院 专业",
       "city_string": "西藏",
       "university_string": "西藏民族学院",
       "college_string": "医学院",
       "major_string": "免疫学"
     },
    ......
    ],
    "count": 10,
    "next_page": "http://api.alhelp.net/v1/public/similar/4810/page/2"
  }
}

@apiError (error_title) 3023 公开课不存在
###
