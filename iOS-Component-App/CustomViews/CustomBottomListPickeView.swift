//
//  CustomBottomListPickeView.swift
//  pengxiang_travel
//
//  Created by danny on 2021/5/8.
//  Copyright © 2021 udianbus. All rights reserved.
//

import UIKit

class ListOptionItem: NSObject {
    // 选项名称
    var optionName = ""
    // 是否选中
    var isSelected = false
    // id
    var id = ""
    
    // MARK: -遍历构造器
    convenience init(optionName: String) {
        self.init()
        self.optionName = optionName
    }
}

class CustomBottomListPickeView: UIView {

    typealias CustomSheetPickerAction = ([ListOptionItem]) -> Void
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
        bgView.backgroundColor = kF3F5F8Color
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
        cancelBtn.titleLabel?.font = kPingFangRegular14Font
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
       doneBtn.titleLabel?.font = kPingFangRegular14Font
        doneBtn.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
       return doneBtn
    }()
    
    lazy var selectAlldoneBtn:UIButton = {
       let doneBtn = UIButton()
       doneBtn.setTitle("全选", for: .normal)
       doneBtn.setTitleColor(k0DBFA0Color, for: UIControl.State.normal)
       doneBtn.titleLabel?.font = kPingFangRegular14Font
        doneBtn.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
       return doneBtn
    }()
    
    /// UIPickerView
    lazy var tableView:UITableView = {
        let mTableView = UITableView.init(frame: .zero, style:.plain)
        mTableView.register(UINib(nibName: "OptionItemListCell", bundle: nil), forCellReuseIdentifier: "OptionItemListCell")
        mTableView.separatorStyle = .none
        mTableView.backgroundColor = kF3F5F8Color
        mTableView.dataSource = self
        mTableView.delegate = self
        if #available(iOS 11.0, *) {
            mTableView.estimatedRowHeight = 0
            mTableView.estimatedSectionHeaderHeight = 0
            mTableView.estimatedSectionFooterHeight = 0
        }
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 12.0))
        headerView.backgroundColor = UIColor.white
        mTableView.tableHeaderView = headerView
        mTableView.rowHeight = 45.0 * kScaleRatio
        return mTableView
    }()
    
    /// 数据源
    var optionDataSource:[ListOptionItem] = []
    /// 中间的标题
    var centerTitle = ""
    // 选中的索引
    var selectedIndex = 0
    
    init(options:[ListOptionItem],centerTitle:String,frame:CGRect) {
       super.init(frame: frame)
       self.optionDataSource = options
       self.centerTitle = centerTitle
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
        self.toolBar.addSubview(self.selectAlldoneBtn)
        self.toolBar.addSubview(self.titleLB)
        self.toolBar.addSubview(self.lineView)
        self.contentView.addSubview(self.tableView)
        
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
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(toolBar.snp.bottom)
            make.height.equalTo(kDatePickerH)
        }
        
        cancelBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.0 * kScaleRatio)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(36.0 * kScaleRatio)
        }
        
        doneBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15.0 * kScaleRatio)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(36.0 * kScaleRatio)
        }
        
        selectAlldoneBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.doneBtn.snp_left).offset(-6.0 * kScaleRatio)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(36.0 * kScaleRatio)
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
                callBack([ListOptionItem]())
            }
            self.dismiss()
        }else{

            if sender == self.doneBtn {
                if let callBack = self.doneAction {
                    let selectedOptionsArr = self.optionDataSource.filter { (model) -> Bool in
                        return model.isSelected
                    }
                    callBack(selectedOptionsArr)
                }
                self.dismiss()
            }
            
            if sender == self.selectAlldoneBtn {
                /// 全选
                for item in self.optionDataSource {
                    item.isSelected = true
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    /// 显示窗口
    class func showPickerView(with options:[ListOptionItem],centerTitle:String) -> CustomBottomListPickeView{
        let pickerView = CustomBottomListPickeView.init(options: options, centerTitle: centerTitle, frame: UIScreen.main.bounds)
        pickerView.show()
        return pickerView
    }

}

extension CustomBottomListPickeView:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.optionDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionItemListCell") as! OptionItemListCell
        let item = self.optionDataSource[indexPath.row];
        cell.optionNameLB.text = item.optionName
        cell.iconView.image = item.isSelected ? UIImage(named: "checkbox-selected_normal") : UIImage(named: "checkbox-unselected_normal_1")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.optionDataSource[indexPath.row];
        // 当前选中的效果取反
        item.isSelected = !item.isSelected
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
