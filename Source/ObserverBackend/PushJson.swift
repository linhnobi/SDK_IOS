//
//  PushJson.swift
//  MobioSDKSwift
//
//  Created by Sun on 11/01/2022.
//

import Foundation

let pushJson =
    """
{
  "pushes":
    [{
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307201,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD0",
      "node_name": "CTKM Thanh Toán Điện Thoại Viettel",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "Recharge",
        "title": "Thanh toán điện thoại - Home 1",
        "content": "CTKM Thanh toán điện thoại Viettel được tặng 10% chỉ có tại Mobio Bank trong hôm nay!",
        "data": "Hello home"
      }
    },
    {
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307204,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD4",
      "node_name": "CTKM Gửi tiết kiệm",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "RechargeConfirm",
        "title": "Thanh toán điện thoại",
        "content": "Bạn vui lòng điền số di động và số tiền nạp và ấn Xác nhận thanh toán nhé!",
        "data": "Hello home"
      }
    },
    {
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307205,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD3",
      "node_name": "CTKM Gửi tiết kiệm",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "RechargeSuccess",
        "title": "Thanh toán điện thoại",
        "content": "Bạn vui lòng ấn nút Xác nhận để thực hiện Thanh toán nhé!",
        "data": "Hello home"
      }
    },
    {
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307202,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD1",
      "node_name": "CTKM Gửi tiết kiệm",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "SaveMoney",
        "title": "Gửi tiết kiệm - Home 2",
        "content": "CTKM Mở tài khoản tiết kiệm online +0.3% lãi suất",
        "data": "Hello home"
      }
    },
    {
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307203,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD2",
      "node_name": "CTKM Gửi tiết kiệm",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "SaveMoney",
        "title": "Gửi tiết kiệm - Home 3",
        "content": "CTKM Mở tài khoản tiết kiệm online +0.3% lãi suất",
        "data": "Hello home"
      }
    },
    {
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307205,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD5",
      "node_name": "CTKM Gửi tiết kiệm",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "SaveMoneyConfirm",
        "title": "Gửi tiết kiệm",
        "content": "Bạn vui lòng điền đủ thông tin để hưởng ưu đãi +0.3% khi mở tiết kiệm Online nhé!",
        "data": "Hello home"
      }
    },
    {
      "prepareShow": false,
      "showed": false,
      "type":"daily",
      "time":"8h",
      "jb_id":"abc",
      "expire": 978307206,
      "node_code": "PUSH_IN_APP",
      "node_id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD6",
      "node_name": "CTKM Gửi tiết kiệm",
      "noti_response": {
        "type": 0,
        "source_screen": "Home",
        "des_screen": "SaveMoneySuccess",
        "title": "Gửi tiết kiệm",
        "content": "Bạn vui lòng ấn nút Xác nhận để Gửi tiết kiệm Online hưởng ưu đãi thêm 0.3% lãi suất cho tất cả các kỳ hạn nhé!",
        "data": "Hello home"
      }
    }
  ]
}
"""
