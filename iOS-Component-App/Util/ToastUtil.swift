//
//  ToastUtil.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/19.
//  Copyright © 2020 udianbus. All rights reserved.
//

import UIKit
import Toast_Swift

class ToastUtil: NSObject {

    /// 弹出toast提示
    /// - Parameter message: 消息
    class func showMessage(message:String,position: ToastPosition = ToastPosition.bottom) {
        DispatchQueue.main.async {
            // create a new style
            var style = ToastStyle()
            style.messageColor = .white
            style.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            style.cornerRadius = 3.0 * kScaleRatio
            style.messageFont = kPingFangRegular14Font
            style.messageAlignment = .center
            style.verticalPadding = 8.0 * kScaleRatio
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                appDelegate.window?.hideToast()// 避免多个弹窗叠在一起
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                  appDelegate.window?.makeToast(message, duration: 1.5, position: position, style: style)
                }
            }
        }
    }

}
