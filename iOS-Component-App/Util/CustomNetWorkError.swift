//
//  CustomNetWorkError.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/24.
//  Copyright © 2020 udianbus. All rights reserved.
//

import Foundation

enum CustomNetworkError : Error {
    case jsonParse(description: String) // "JSON解析失败"
    case network(description: String) // "网络错误"
    case noDataError(description: String) // "返回数据为空"
    case unknownError(description: String) // "未知错误"
    case otherError(description:String)// 其他错误
    case codeNotZeroError(description:String)// code != 0的错误
    case amapSearchApiError(description:String)// 高德地图搜索接口报错
    case reviewCustomNetworkError(description:String)// 7001错误码 审核专用
    case reviewingLoginAccountNotExistError(description:String)// 998错误码 审核时 其他手机账号登录 报未分配角色
    case uploadError(description:String)// 上传错误
}

enum CustomErrrorMessage:String{
    case JsonParseError              = "数据解析出错"// 返回json解析失败
    case NetWorkError                = "网络异常，请稍候再试"// 返回json解析失败
    case NoDataError                 = "数据异常" // Data字段为空
    case UnknownError                = "未知错误"// 未知错误
    case OtherError                  = "其他异常"// 其他异常
    case codeNotZeroError            = "未知异常"// 未知异常
    case amapSearchApiError          = "网络出错"// 未知异常
    case reviewCustomNetworkError    = "审核账号登录错误码"// 7001错误码 审核专用
    case reviewingLoginAccountNotExistError = "该用户不存在，请联系管理员确认"// 998错误码 审核时 其他手机账号登录 报未分配角色
    case UploadError                 = "上传失败"// 上传失败
}

enum CustomPaymentType:String{
    case Cash                        = "现金"// 现金
    case Transfer                    = "转账"// 转账
    case WeekPay                     = "周结"// 周结
    case MonthPay                    = "月结"// 月结
    case SeasonPay                   = "季结"// 季结
    case YearPay                     = "年结"// 年结
}

enum TollFeeAndParkingFeeType:String{
    case DriverPayAndNotIncludeRentFee                  = "租金不含且司机付"// 租金不含且司机付
    case DriverPayAndIncludeRentFee                     = "租金包含且司机付"// 租金包含且司机付
    case CustomerPay                                    = "客户付"// 客户付
}

enum TollFeeAndParkingFeeTypeValue:Int{
    case DriverPayAndNotIncludeRentFee                  = 1// 租金不含且司机付
    case DriverPayAndIncludeRentFee                     = 2// 租金包含且司机付
    case CustomerPay                                    = 3// 客户付
}


enum CustomPaymentMethodValueType:Int{
    case Cash                        = 1// 现金
    case Transfer                    = 2// 转账
    case WeekPay                     = 3// 周结
    case MonthPay                    = 4// 月结
    case SeasonPay                   = 5// 季结
    case YearPay                     = 6// 年结
}


/// 返回0 代表请求成功
let kHttpSuccessCode = 0

/// 审核的错误码
let kCustomReviewResponseCode = 7001
/// 审核时账号不存在
let kCustomReviewAccountNotExistResponseCode = 998

let kUdianBusHttpSuccessCode = 200

/// MARK: - 初始化页码
let initStartPageNo = 0


