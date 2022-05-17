//
//  TapGestureManager.swift
//  pengxiang_travel
//
//  Created by danny on 2020/10/12.
//  Copyright © 2020 udianbus. All rights reserved.
//

import UIKit

class TapGestureManager: UITapGestureRecognizer,UIGestureRecognizerDelegate {

    //想间隔的时长
    var intervalTime: TimeInterval?
    //用于完成间隔的计时器
    private var eventTimer: Timer?
    
    init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
        delegate = self
    }
    // 是否响应触摸手势的代理方法
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (eventTimer != nil) {// 定时器正在运行 说明还未放开开关
            return false
        }
        
        eventTimer = Timer(timeInterval: intervalTime ?? 0, target: self, selector: #selector(deinitTimer), userInfo: nil, repeats: false)
        RunLoop.current.add(eventTimer!, forMode: .common)
        
        return true
    }
    
    @objc func deinitTimer() {
        eventTimer?.invalidate()
        eventTimer = nil
    }
}
