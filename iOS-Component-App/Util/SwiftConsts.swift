//
//  SwiftConsts.swift
//  ydbus
//
//  Created by danny on 2020/9/9.
//  Copyright © 2020 SIBAT. All rights reserved.
//

import Foundation

// 自定义的错误码
enum CustomErrrorCodeType:Int{
    case ResponseEmpty                     = 1000 // 返回数据为空
    case JsonParseError                    = 1001// 返回json解析失败
    case DataIsEmpty                       = 1002 // Data字段为空
    case DataTypeError                     = 1003 // data类型错误
    case UnknownError                      = 2000 // 未知错误
}


/// 操作订单的标题
enum OrderOperationTitleType:String{
    case CancelOrder                 = "取消订单" // 取消订单
    case ModifyInfo                  = "修改订单"// 修改订单
    case CopyOrderInfo               = "复制订单"// 复制订单
    case CarPosition                 = "车辆定位" // 车辆定位
    case OrderCompleted              = "行程完成" // 行程完成
    case ReadyToLeave                = "准备出发"// 准备出发
    case Accept                      = "接受"// 接受
    case TurnDown                    = "拒绝"// 拒绝
    case Reminder                    = "催派单"// 催派单
    case Comment                     = "评价"// 评价
    case mapLocation                 = "地图定位"// 地图定位
    case Reimbursement               = "行程费用" // 报销费用
    case ModifyReimbursement         = "修改费用" // 修改费用
    case Complain                    = "投诉"    // 投诉
    case ComplainFeedBack            = "投诉反馈" // 投诉反馈
}


/// 车辆信息视图的类型
enum OrderCarInfoTitleType:String{
    case CarNo                       = "车辆" // 车辆
    case UnitPrice                   = "租金" // 租金
    case WaterPirce                  = "水费"// 水费
    case HotelPrice                  = "住宿费"// 住宿费
    case MealPrice                   = "餐费" // 餐费
    case OverTimePrice               = "加班费" // 加班费
    case OtherPrice                  = "其他费用"// 其他费用
    case RoadPrice                   = "路桥费"// 路桥费
    case ParkingPrice                = "停车费"// 停车费
}


/// 附加信息
enum OrderInfoAttachTitleType:String{
    case TotalPrice                  = "总营收"
    case Paytype                     = "付款方式"
    case RoadAndParking              = "路桥费、停车费"
    case PassengerCount              = "乘车人数"
    case Priority                    = "优先级"
    case Remark                      = "备注"
    case DriverRemark                = "备注 (司机) "
}
