//
//  CustomTextViewAlertView.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/26.
//  Copyright © 2020 udianbus. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class CustomTextViewAlertView: UIView {

   // 背景蒙层
    var backgoundBgView = UIView()
    // 容器视图
    var contentView = UIImageView()
    /// 顶部标题栏
    var titleView = UIView()
    /// 标题
    var titleLB = UILabel()
    
    /// 关闭
    lazy var closeBtn:UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "icon_login_cancel"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(cancelBtnDidClick(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    /// 水平分割线
    var hLineView = UIView()
    
    lazy var textView:UITextView = {
       let textV = UITextView()
        textV.font = kPingFangRegular14Font
        textV.textColor = k333333Color
        textV.layer.borderWidth = 1.0 * kScaleRatio
        textV.layer.borderColor = kD3D9DFColor.cgColor
        textV.layer.cornerRadius = 3.0 * kScaleRatio
        textV.layer.masksToBounds = true
        textV.delegate = self
       return textV
    }()

    /// 确定  输入后方可点击
    lazy var submitBtn:UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("提交", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.titleLabel?.font = kPingFangRegular18Font
        let disableImage = UIImage.imageWithColor(color: kBtnDisableColor, size: CGSize.init(width: kScreenWidth - 30.0 * kScaleRatio * 2.0,  height: 40.0 * kScaleRatio), isRoundedCorner: true, radius: 3.0 * kScaleRatio)
        let enableImage = UIImage.imageWithColor(color: kBtnEnableColor, size: CGSize.init(width: kScreenWidth - 30.0 * kScaleRatio * 2.0, height: 40.0 * kScaleRatio), isRoundedCorner: true, radius: 3.0 * kScaleRatio)
        btn.setBackgroundImage(disableImage, for: UIControl.State.disabled)
        btn.setBackgroundImage(enableImage, for: UIControl.State.normal)
        btn.layer.cornerRadius = 3.0 * kScaleRatio
        btn.layer.masksToBounds = true
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(submitBtnDidClick(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()

    typealias CustomAlertViewAction = (String) -> Void
    /// 左侧取消的回调
    var cancelAction: CustomAlertViewAction?
    /// 右侧确定的回调
    var submitAction: CustomAlertViewAction?
    
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
        contentView.layer.cornerRadius = 3.0 * kScaleRatio
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = true
        
        titleView.backgroundColor = UIColor.white
        contentView.addSubview(titleView)
        titleLB.textColor = k333333Color
        titleLB.font = kPingFangMedium16Font
        titleLB.textAlignment = .center
        titleLB.sizeToFit()
        titleLB.text = "取消原因"
        titleView.addSubview(titleLB)
        titleView.addSubview(closeBtn)
        hLineView.backgroundColor = kD8D8D8Color
        
        addSubview(backgoundBgView)
        addSubview(contentView)
        contentView.addSubview(titleView)
        contentView.addSubview(hLineView)
        contentView.addSubview(textView)
        contentView.addSubview(self.submitBtn)
        
        backgoundBgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let contentViewWidth = kScreenWidth - 30.0 * kScaleRatio * 2.0
        let contentViewHeight = contentViewWidth * 270.0/315.0
        
        let centerYoffsetValue = (110.0 - 287.0) * 0.5 * kScaleRatio
        contentView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(centerYoffsetValue)
            make.width.equalTo(contentViewWidth)
            make.height.equalTo(contentViewHeight)
        }
        
        titleView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(42.0 * kScaleRatio)
        }
        
        hLineView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(titleView.snp.bottom)
            make.height.equalTo(1.0 * kScaleRatio)
        }
        
        titleLB.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        closeBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-7.0 * kScaleRatio)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24.0 * kScaleRatio)
        }
        
        let textViewWidth = kScreenWidth - 30.0 * kScaleRatio * 2.0 - 12.0 * 2.0 * kScaleRatio
        let textViewHeight = textViewWidth * 152.0/291.0
        textView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12.0 * kScaleRatio)
            make.top.equalTo(titleView.snp.bottom).offset(12.0 * kScaleRatio)
            make.height.equalTo(textViewHeight)
            make.centerX.equalToSuperview()
        }
        
        submitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(12.0 * kScaleRatio)
            make.left.equalToSuperview().offset(12.0 * kScaleRatio)
            make.centerX.equalToSuperview()
            make.height.equalTo(40.0 * kScaleRatio)
        }
        
        textView.becomeFirstResponder()
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
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
    
    func dismiss()  {
        backgoundBgView.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            self.contentView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.removeFromSuperview()
        }
        
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
    
    @objc func cancelBtnDidClick(_ sender:UIButton){
        sender.preventRepeatedPresses()
        self.dismiss()
    }
    
    @objc func submitBtnDidClick(_ sender:UIButton){
        sender.preventRepeatedPresses()
        endEditing(true)
        if let callBack = self.submitAction {
            callBack(self.textView.text)
        }
        self.dismiss()
    }
    
    /// 弹窗方法
    /// - Parameter placeHolder: 占位符
    class func showAlertView(withPlaceHolder placeHolder:String,title:String = "取消原因") -> CustomTextViewAlertView{
        let view = CustomTextViewAlertView.init(frame: UIScreen.main.bounds)
        view.textView.placeholder = placeHolder
        view.titleLB.text = title
        view.show()
        return view
    }

}

extension CustomTextViewAlertView:UITextViewDelegate{
    //MARK: - TextViewDelegate
     func textViewDidChange(_ textView: UITextView) {

         if textView.text.count > 50 {
            submitBtn.isEnabled = true
             //获得已输出字数与正输入字母数
             let selectRange = textView.markedTextRange
             //获取高亮部分 － 如果有联想词则解包成功
             if let selectRange = selectRange {
                 let position =  textView.position(from: (selectRange.start), offset: 0)
                 if (position != nil) {
                     return
                 }
             }
            
             textView.text = String(textView.text[..<textView.text.index(textView.text.startIndex, offsetBy: 50)]) // 取前11个字符
         }else{
            submitBtn.isEnabled = (textView.text.count > 0)
        }
    }
}
