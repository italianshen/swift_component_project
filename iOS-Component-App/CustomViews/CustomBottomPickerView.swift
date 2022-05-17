//
//  CustomBottomPickerView.swift
//  pengxiang_travel
//
//  Created by danny on 2020/12/9.
//  Copyright © 2020 udianbus. All rights reserved.
//

import UIKit

class CustomBottomPickerView: UIView {

    typealias CustomSheetPickerAction = (Int) -> Void
    /// 完成的回调
    var doneAction: CustomSheetPickerAction?
    /// 取消的回调
    var cancelAction: CustomSheetPickerAction?
    
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
    
    /// UIPickerView
    lazy var pickerView:UIPickerView = {
        let pikerView = UIPickerView()
        pikerView.delegate = self
        pikerView.dataSource = self
        return pikerView
    }()
    
    /// 数据项
    var options:[String] = []
    /// 选中的选项
    var selectOption = ""
    /// 中间的标题
    var centerTitle = ""
    
    // 选中的索引
    var selectedIndex = 0
    
    init(options:[String],centerTitle:String,frame:CGRect) {
       super.init(frame: frame)
       self.options = options
       self.centerTitle = centerTitle
       self.selectOption = options.first ?? ""
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
        self.contentView.addSubview(self.pickerView)
        
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
        
        pickerView.snp.makeConstraints { (make) in
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
    
    

    /// 按钮点击回调
    /// - Parameter sender: 按钮
    @objc func buttonDidClick(_ sender:UIButton){
        sender.preventRepeatedPresses(inNext: 0.3)
        if sender == self.cancelBtn {
            if let callBack = self.cancelAction {
                callBack(self.selectedIndex)
            }
        }else{
            if let callBack = self.doneAction {
                callBack(self.selectedIndex)
            }
        }
        self.dismiss()
    }
    
    
    /// 显示窗口
    class func showPickerView(with options:[String],centerTitle:String) -> CustomBottomPickerView{
        let datePicker = CustomBottomPickerView.init(options: options, centerTitle: centerTitle, frame: UIScreen.main.bounds)
        datePicker.show()
        return datePicker
    }
}

extension CustomBottomPickerView:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45.0 * kScaleRatio
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLB:UILabel? = nil
        if let mPickerLB = view, mPickerLB is UILabel {
            pickerLB = mPickerLB as? UILabel
        }else{
            pickerLB = UILabel()
            pickerLB?.font = kPingFangMedium16Font
            pickerLB?.textColor = k0DBFA0Color
            pickerLB?.textAlignment = .center
        }
        
        let option = self.options[row]
        pickerLB?.text = option
        return pickerLB ?? UILabel()
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("选择了 row:\(row)")
        let option = self.options[row]
        self.selectOption = option
        self.selectedIndex = row
    }
    
}


