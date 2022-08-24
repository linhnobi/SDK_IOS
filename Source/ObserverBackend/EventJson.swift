//
//  EventJson.swift
//  MobioSDKSwift
//
//  Created by Sun on 11/01/2022.
//

import Foundation

let eventJson =
    """
{
  "events": [{
    "children_node": [
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD0",
        "expire": 333,
        "complete": false,
        "type": "action"
      },
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD1",
        "expire": 222,
        "complete": false,
        "type": "action"
      },
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD2",
        "expire": 111,
        "complete": false,
        "type": "action"
      }
    ],
    "node_id": "42319b1e-3b46-4a3b-8081-95e08c24de97",
    "event_key": "sdk_mobile_test_time_visit_app",
    "event_data": {
      "time_visit": 3,
      "screen_name": "Home"
    }
  },
  {
    "children_node": [
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD3",
        "expire": 1642653066000,
        "complete": false,
        "type": "action"
      }
    ],
    "node_id": "42319b1e-3b46-4a3b-8081-95e08c24de98",
    "event_key": "sdk_mobile_test_time_visit_app",
    "event_data": {
      "time_visit": 3,
      "screen_name": "RechargeConfirm"
    }
  },
  {
    "children_node": [
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD4",
        "expire": 1642653066000,
        "complete": false,
        "type": "action"
      }
    ],
    "node_id": "42319b1e-3b46-4a3b-8081-95e08c24de98",
    "event_key": "sdk_mobile_test_time_visit_app",
    "event_data": {
      "time_visit": 3,
      "screen_name": "Recharge"
    }
  },
  {
    "children_node": [
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD5",
        "expire": 1642653066000,
        "complete": false,
        "type": "action"
      }
    ],
    "node_id": "42319b1e-3b46-4a3b-8081-95e08c24de98",
    "event_key": "sdk_mobile_test_time_visit_app",
    "event_data": {
      "time_visit": 3,
      "screen_name": "SaveMoney"
    }
  },
  {
    "children_node": [
      {
        "id": "87EB978A-C3EB-4C45-ABDA-B8292E5BCCD6",
        "expire": 1642653066000,
        "complete": false,
        "type": "action"
      }
    ],
    "node_id": "42319b1e-3b46-4a3b-8081-95e08c24de98",
    "event_key": "sdk_mobile_test_time_visit_app",
    "event_data": {
      "time_visit": 3,
      "screen_name": "SaveMoneyConfirm"
    }
  }
 ]
}
"""
