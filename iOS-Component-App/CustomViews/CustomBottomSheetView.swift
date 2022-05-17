//
//  CustomBottomSheetView.swift
//  pengxiang_travel
//
//  Created by Danny on 2021/1/15.
//  Copyright © 2021 udianbus. All rights reserved.
//

import UIKit

let kBottomSheetContentViewH:CGFloat = 60.0 * kScaleRatio

class CustomBottomSheetView: UIView {

    typealias CustomBottomSheetViewPickerAction = (String) -> Void
    /// 完成的回调
    var doneAction: CustomBottomSheetViewPickerAction?
    /// 取消的回调
    var cancelAction: CustomBottomSheetViewPickerAction?
    
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
    
    
    lazy var minusBtn:UIButton = {
       let doneBtn = UIButton()
        doneBtn.setImage(UIImage(named: "icon_jian_enable"), for: UIControl.State.normal)
        doneBtn.setImage(UIImage(named: "icon_jian_disable"), for: UIControl.State.disabled)
        doneBtn.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
       return doneBtn
    }()
    
    lazy var addBtn:UIButton = {
       let doneBtn = UIButton()
       doneBtn.setImage(UIImage(named: "icon_jia_enable"), for: UIControl.State.normal)
       doneBtn.setImage(UIImage(named: "icon_jia_disable"), for: UIControl.State.disabled)
       doneBtn.setTitleColor(k0DBFA0Color, for: UIControl.State.normal)
       doneBtn.titleLabel?.font = kPingFangRegular17Font
       doneBtn.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
       return doneBtn
    }()
    
    /// bus名称
    lazy var busNameLB:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = kPingFangRegular14Font
        label.textAlignment = .left
        label.sizeToFit()
        label.text = "30座旅游大巴"
        return label
    }()
    

    /// 车的个数
    lazy var busCountLB:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = kPingFangRegular14Font
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()

    // 车的数量
    var busCount = 0
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        addSubview(bgView)
        addSubview(contentView)
        self.contentView.addSubview(self.toolBar)
        self.toolBar.addSubview(cancelBtn)
        self.toolBar.addSubview(self.doneBtn)
        self.toolBar.addSubview(self.titleLB)
        self.toolBar.addSubview(self.lineView)
        contentView.addSubview(self.busNameLB)
        contentView.addSubview(self.addBtn)
        contentView.addSubview(self.busCountLB)
        contentView.addSubview(self.minusBtn)
        
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let contentViewH = kToolBarHeight + kBottomSheetContentViewH + kBottomMarginH
        
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
        
        
        busNameLB.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.0)
            make.top.equalTo(toolBar.snp.bottom).offset(12.0)
        }
        
        addBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15.0)
            make.centerY.equalTo(busNameLB)
            make.width.height.equalTo(30.0)
        }
        
        busCountLB.snp.makeConstraints { (make) in
            make.right.equalTo(addBtn.snp.left).offset(-12.0)
            make.centerY.equalTo(addBtn)
        }
        
        minusBtn.snp.makeConstraints { (make) in
            make.right.equalTo(busCountLB.snp.left).offset(-12.0)
            make.centerY.equalTo(busNameLB)
            make.width.height.equalTo(30.0)
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
        
        self.updateMinusBtnEnabel()
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
        if sender == self.doneBtn {
            if let callBack = self.doneAction {
                if self.busCount > 0 {
                    callBack("30座旅游大巴 " + String(self.busCount) + "辆")
                }else{
                    HGLog("未选择大于0 的车辆 什么也不做")
                }
            }
            self.dismiss()
        }
        
        if sender == self.cancelBtn {
            self.dismiss()
        }
        
        if sender == self.addBtn {
            self.busCount += 1;
            self.updateMinusBtnEnabel()
        }
        
        if sender == self.minusBtn {
            self.busCount -= 1;
            self.updateMinusBtnEnabel()
        }
        
    }
    
    // 更新减号按钮的交互能力
    func updateMinusBtnEnabel()  {
        // 车的数量
        self.busCountLB.text = String(busCount)
        // 大于1才可以减
        self.minusBtn.isEnabled = (self.busCount >= 1)
    }
    
    /// 显示窗口
    class func showPickerView(withCenterTitle centerTitle:String) -> CustomBottomSheetView{
        let datePicker = CustomBottomSheetView.init(frame: UIScreen.main.bounds)
        datePicker.titleLB.text = centerTitle
        datePicker.show()
        return datePicker
    }
}

