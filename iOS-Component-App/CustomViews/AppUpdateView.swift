//
//  AppUpdateView.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/28.
//  Copyright © 2020 udianbus. All rights reserved.
//

import UIKit
import SnapKit

class AppUpdateView: UIView {
    // 背景蒙层
    var backgoundBgView = UIView()
    // 容器视图
    var contentView = UIImageView()
    
    /// 标题
    var titleLB = UILabel()
    /// 提示
    var messageTextView = UITextView()
    /// 水平分割线
    var hLineView = UIView()
    /// 垂直分割线
    var vLineView = UIView()
    
    /// 取消
    lazy var cancelBtn:UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.backgroundColor = UIColor.white
        btn.setTitle("取消", for: UIControl.State.normal)
        btn.setTitleColor(k999999Color, for: UIControl.State.normal)
        btn.titleLabel?.font = kPingFangMedium14Font
        btn.addTarget(self, action: #selector(cancelBtnDidClick(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    /// 确定
    lazy var okBtn:UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.backgroundColor = UIColor.white
        btn.setTitle("确定", for: UIControl.State.normal)
        btn.setTitleColor(k0DBFA0Color, for: UIControl.State.normal)
        btn.titleLabel?.font = kPingFangMedium14Font
        btn.addTarget(self, action: #selector(okBtnDidClick(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()

    typealias CustomAlertViewAction = () -> Void
    /// 左侧取消的回调
    var cancelAction: CustomAlertViewAction?
    /// 右侧确定的回调
    var confirmAction: CustomAlertViewAction?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        
        backgoundBgView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 8.0 * kScaleRatio
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = true
        
        titleLB.textColor = k333333Color
        titleLB.font = kPingFangMedium16Font
        titleLB.textAlignment = .center
        titleLB.sizeToFit()
        titleLB.text = "发现新版本"
        
        messageTextView.textColor = k666666Color
        messageTextView.font = kPingFangRegular14Font
        messageTextView.textAlignment = .left
    
        
        hLineView.backgroundColor = kD8D8D8Color
        vLineView.backgroundColor = kD8D8D8Color
        
        addSubview(backgoundBgView)
        addSubview(contentView)
        contentView.addSubview(titleLB)
        contentView.addSubview(messageTextView)
        contentView.addSubview(hLineView)
        contentView.addSubview(vLineView)
        contentView.addSubview(cancelBtn)
        contentView.addSubview(okBtn)
        
        backgoundBgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let contentViewWidth = kScreenWidth - 55.0 * kScaleRatio * 2.0
        
        contentView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(contentViewWidth)
        }
        
        titleLB.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(32.0 * kScaleRatio)
            make.centerX.equalToSuperview()
        }
        
        messageTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLB.snp.bottom).offset(18.0 * kScaleRatio)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(24.0 * kScaleRatio)
            make.height.equalTo(90.0 * kScaleRatio)
        }
        
        hLineView.snp.makeConstraints { (make) in
            make.top.equalTo(messageTextView.snp.bottom).offset(24.0 * kScaleRatio)
            make.left.right.equalToSuperview()
            make.height.equalTo(1.0 * kScaleRatio)
        }
        
        vLineView.snp.makeConstraints { (make) in
            make.top.equalTo(hLineView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(1.0 * kScaleRatio)
            make.height.equalTo(45.0 * kScaleRatio)
        }
        
        cancelBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalTo(vLineView.snp.left)
            make.top.equalTo(hLineView.snp.bottom)
            make.height.equalTo(45.0 * kScaleRatio)
        }
        
        okBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalTo(vLineView.snp.right)
            make.top.equalTo(hLineView.snp.bottom)
            make.height.equalTo(45.0 * kScaleRatio)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(okBtn)
        }
    }
    
    
    func show()  {
        // 获取keywindow
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.addSubview(self)
            backgoundBgView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.25) {
                self.contentView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            }
        }
    }
    
    func dismiss()  {
        backgoundBgView.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            self.contentView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.removeFromSuperview()
        }
    }
    
    @objc func cancelBtnDidClick(_ sender:UIButton){
        sender.preventRepeatedPresses()
        if let callBack = self.cancelAction {
            callBack()
        }
    }
    
    @objc func okBtnDidClick(_ sender:UIButton){
        sender.preventRepeatedPresses()
        if let callBack = self.confirmAction {
            callBack()
        }
    }
    
    /// 弹窗方法
    /// - Parameter message: 消息内容
    class func showAlertView(withMessage message:String,leftActionTitle:String = "取消",rightActionTitle:String = "确定",rightTitleColor:UIColor = k0DBFA0Color,messageAlignment:NSTextAlignment = .left) -> AppUpdateView{
        let view = AppUpdateView.init(frame: UIScreen.main.bounds)
        view.messageTextView.text = message
        view.cancelBtn.setTitle(leftActionTitle, for: UIControl.State.normal)
        view.okBtn.setTitle(rightActionTitle, for: UIControl.State.normal)
        view.okBtn.setTitleColor(rightTitleColor, for: UIControl.State.normal)
        view.messageTextView.textAlignment = messageAlignment
        view.show()
        return view
    }

}
