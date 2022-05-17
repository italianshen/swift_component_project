//
//  CustomDatePicker.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/17.
//  Copyright © 2020 udianbus. All rights reserved.
//  dataPicker整体高度 216 + 44.0  = 260的高度

import UIKit

let kToolBarHeight:CGFloat = 42.0 * kScaleRatio
let kDatePickerH:CGFloat = 216.0 * kScaleRatio
let kBottomMarginH:CGFloat = (kScreenHeight >= 812.0 ? 34.0 : 0.0)
let kNaviH:CGFloat = UIApplication.shared.statusBarFrame.size.height + 44.0
class CustomDatePicker: UIView {

    typealias CustomDatePickerAction = (String) -> Void
    /// 完成的回调
    var doneAction: CustomDatePickerAction?
    /// 取消的回调
    var cancelAction: CustomDatePickerAction?
    
    lazy var bgView:UIView = {
       let bgView = UIView()
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
       return bgView
    }()
    
    lazy var contentView:UIView = {
        let bgView = UIView()
         bgView.backgroundColor = UIColor.white
        return bgView
    }()
    

    lazy var toolBar:UIView = {
       let toolBarView = UIView()
       toolBarView.backgroundColor = UIColor.white
       return toolBarView
    }()
    
    lazy var lineView:UIView = {
       let view = UIView()
       view.backgroundColor = kD8D8D8Color
       return view
    }()
    
    lazy var cancelBtn:UIButton = {
       let cancelBtn = UIButton()
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(k999999Color, for: UIControl.State.normal)
        cancelBtn.titleLabel?.font = kPingFangRegular17Font
        cancelBtn.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
       return cancelBtn
    }()
    
    /// 标题
    lazy var titleLB:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = kPingFangRegular17Font
        label.textAlignment = .center
        label.sizeToFit()
        label.text = self.centerTitle
        return label
    }()
    
    lazy var doneBtn:UIButton = {
       let doneBtn = UIButton()
       doneBtn.setTitle("确定", for: .normal)
       doneBtn.setTitleColor(k0DBFA0Color, for: UIControl.State.normal)
       doneBtn.titleLabel?.font = kPingFangRegular17Font
        doneBtn.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
       return doneBtn
    }()
    
    // 日期选择器
    lazy var datePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        //将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = Locale(identifier: "zh_GB")
        //注意：action里面的方法名后面需要加个冒号“：”
        datePicker.addTarget(self, action: #selector(dateDidChangeAction(_:)),
                             for: .valueChanged)
        // 从2020开始选择 01:01 00:00:00开始选择
        datePicker.minimumDate = Date(timeIntervalSince1970: 1577808000)
        datePicker.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return datePicker
    }()
    
    /// 时间格式
    var dateFormate = ""
    
    /// 中间的标题
    var centerTitle = ""
    
    /// 用户选择的时间
    var selectTime = ""
    
    
    init(dateFormate:String,centerTitle:String,datePickerMode:UIDatePicker.Mode,frame:CGRect) {
       super.init(frame: frame)
       self.dateFormate = dateFormate
       self.centerTitle = centerTitle
       self.datePicker.datePickerMode = datePickerMode
       setupUI()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   /// 初始化UI
    func setupUI() {
        addSubview(bgView)
        addSubview(contentView)
        self.contentView.addSubview(self.toolBar)
        self.toolBar.addSubview(cancelBtn)
        self.toolBar.addSubview(self.doneBtn)
        self.toolBar.addSubview(self.titleLB)
        self.toolBar.addSubview(self.lineView)
        self.contentView.addSubview(self.datePicker)
        
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let contentViewH = kToolBarHeight + kDatePickerH + kBottomMarginH
        
        contentView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(contentViewH)
            make.bottom.equalToSuperview().offset(0)
        }
        
        toolBar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(kToolBarHeight)
        }
        
        datePicker.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(toolBar.snp.bottom)
            make.height.equalTo(kDatePickerH)
        }
        
        cancelBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.0 * kScaleRatio)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(60.0 * kScaleRatio)
        }
        
        doneBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15.0 * kScaleRatio)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(60.0 * kScaleRatio)
        }
        
        titleLB.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1.0 * kScaleRatio)
        }
    }
    
    // 显示
    func show()  {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            appDelegate.window?.addSubview(self)
        }
    }
    
    func dismiss()  {
        UIView.animate(withDuration: 0.25, animations: {
            let contentViewH = kToolBarHeight + kDatePickerH + kBottomMarginH
            self.contentView.snp.updateConstraints { (make) in
                make.bottom.equalToSuperview().offset(contentViewH)
            }
        }) { (didFinish) in
            self.removeFromSuperview()
        }
    }
    
    
    /// 日期改变的回调
    /// - Parameter datePicker: 日期选择器
    @objc func dateDidChangeAction(_ datePicker:UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        var mDateFormate = self.dateFormate
        if mDateFormate.count == 0 {
            mDateFormate = "yyyy年MM月dd日 HH:mm"
        }
        formatter.dateFormat = mDateFormate
        print(formatter.string(from: datePicker.date))
        self.selectTime = formatter.string(from: datePicker.date)
    }
    

    /// 按钮点击回调
    /// - Parameter sender: 按钮
    @objc func buttonDidClick(_ sender:UIButton){
        sender.preventRepeatedPresses(inNext: 0.3)
        if sender == self.cancelBtn {
            if let callBack = self.cancelAction {
                callBack("")
            }
        }else{
            if let callBack = self.doneAction {
                HGLog("self.selectTime \(self.selectTime.count)");
                if self.selectTime.count == 0 {
                    setDefaultTime()
                }
                callBack(self.selectTime)
            }
        }
        self.dismiss()
    }
    
    /// 设置默认时间
    func setDefaultTime() {
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        var mDateFormate = self.dateFormate
        if mDateFormate.count == 0 {
            mDateFormate = "yyyy年MM月dd日 HH:mm:ss"
        }
        formatter.dateFormat = mDateFormate
        print(formatter.string(from: Date()))
        self.selectTime = formatter.string(from: datePicker.date)
    }
    
    /// 更新最小时间
    func updateMinumDateForDatePicker(startDate:Date) {
        self.datePicker.minimumDate = startDate
    }
    
    /// 显示窗口
    class func showDatePicker(withDateFormatter dateFormatter:String,centerTitle:String,datePickerMode:UIDatePicker.Mode) -> CustomDatePicker{
        let datePicker = CustomDatePicker.init(dateFormate: dateFormatter, centerTitle: centerTitle, datePickerMode: datePickerMode, frame: UIScreen.main.bounds)
        datePicker.show()
        return datePicker
    }

}
