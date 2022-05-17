//
//  ErrorHandleTool.swift
//  quality_manage
//
//  Created by danny on 2020/11/14.
//

import UIKit

class ErrorHandleTool: NSObject {

    // 单例
    static let shareInstance = ErrorHandleTool()
    
    /// MARK: - 处理网络错误
    func handleCustomNetWorkError(err:Error)  {
        if let mError = err as?  CustomNetworkError{
            switch mError {
            case .jsonParse(description: CustomErrrorMessage.JsonParseError.rawValue):
                ToastUtil.showMessage(message: CustomErrrorMessage.JsonParseError.rawValue)
            case .network(description: CustomErrrorMessage.NetWorkError.rawValue):
                ToastUtil.showMessage(message: CustomErrrorMessage.NetWorkError.rawValue)
            case .noDataError(description: CustomErrrorMessage.NoDataError.rawValue):
                ToastUtil.showMessage(message: CustomErrrorMessage.NoDataError.rawValue)
            case .unknownError(description: CustomErrrorMessage.UnknownError.rawValue):
                ToastUtil.showMessage(message: CustomErrrorMessage.NoDataError.rawValue)
            case .otherError(description: CustomErrrorMessage.OtherError.rawValue):
                ToastUtil.showMessage(message: CustomErrrorMessage.OtherError.rawValue)
            case .codeNotZeroError(description: CustomErrrorMessage.codeNotZeroError.rawValue):
                HGLog("上层已处理弹窗提示")
                //amapSearchApiError
            case .amapSearchApiError(description: CustomErrrorMessage.amapSearchApiError.rawValue):
                ToastUtil.showMessage(message: CustomErrrorMessage.amapSearchApiError.rawValue)
            default:
                ToastUtil.showMessage(message: err.localizedDescription)
            }
        }else{
            ToastUtil.showMessage(message: err.localizedDescription)
        }
    }
    
}
