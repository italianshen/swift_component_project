//
//  CustomFeeHudView.swift
//  pengxiang_travel
//
//  Created by danny on 2022/4/20.
//  Copyright © 2022 udianbus. All rights reserved.
//

import UIKit
import SnapKit

class FeeListItemModel:NSObject{
    // 左侧标题
    var leftTitle = ""
    // 右侧标题
    var rightContent = ""
    // 构造方法
    init(leftTitle:String,rightContent:String) {
        self.leftTitle = leftTitle
        self.rightContent = rightContent
    }
}


class CustomFeeHudView: UIView {

    // 背景蒙层
    var backgoundBgView = UIView()
    // 容器视图
    var contentView = UIImageView()
    // 列表数据
    lazy var tableView:UITableView = {
        let mTableView = UITableView.init(frame: .zero, style:.plain)
        mTableView.dataSource = self
        // 注册cell
        mTableView.register(UINib.init(nibName: "CustomFeeListItemCell", bundle: nil), forCellReuseIdentifier: "CustomFeeListItemCell")
        mTableView.separatorStyle = .none
        mTableView.backgroundColor = UIColor.white
        mTableView.rowHeight = 45.0
        if #available(iOS 11.0, *) {
            mTableView.estimatedRowHeight = 0
            mTableView.estimatedSectionHeaderHeight = 0
            mTableView.estimatedSectionFooterHeight = 0
        }
        return mTableView
    }()
    
    // 头部
    lazy var headerView:UIView = {
        let view = UIView();
        view.backgroundColor = UIColor.white
        return view
    }()
    
    /// 标题
    var titleLB = UILabel()
    
    /// 取消
    lazy var cancelBtn:UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(cancelBtnDidClick(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var closeImageView:UIImageView = {
        let  imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "close")
        return imageView
    }()
    
    
    typealias CustomFeeHudViewAction = () -> Void
    /// 左侧取消的回调
    var cancelAction: CustomFeeHudViewAction?
    /// 数据源
    var dataSource:[FeeListItemModel] = []
    /// 中间的标题
    var centerTitle = ""
    
    init(dataSource:[FeeListItemModel],centerTitle:String,frame:CGRect) {
       super.init(frame: frame)
       self.dataSource = dataSource
       self.centerTitle = centerTitle
       setupUI()
   }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    func setupUI() {
        backgoundBgView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 8.0 * kScaleRatio
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = true
        
        titleLB.textColor = k3E5466Color
        titleLB.font = kPingFangMedium16Font
        titleLB.textAlignment = .left
        titleLB.sizeToFit()
        titleLB.text = self.centerTitle
        
        addSubview(backgoundBgView)// 背景蒙版
        addSubview(contentView)// 内容视图
        contentView.addSubview(self.headerView)
        contentView.addSubview(self.tableView)
        headerView.addSubview(self.titleLB)// 标题
        headerView.addSubview(self.cancelBtn)// 关闭
        cancelBtn.addSubview(self.closeImageView)
        
        backgoundBgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        headerView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(45.0)
        }
        
        let contentViewWidth = CGFloat(dataSource.count) * 45.0 + 45.0;
        contentView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(kScreenWidth - 24.0)
            make.height.equalTo(contentViewWidth)
        }
        
        titleLB.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(18.0)
        }
        
        cancelBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8.0)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(36.0)
        }
        
        closeImageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(24.0)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(45.0)
            make.left.right.bottom.equalToSuperview()
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
        self.dismiss()
    }
    
    /// 弹窗方法
    /// - Parameter message: 消息内容
    class func showHudView(dataSource:[FeeListItemModel],centerTitle:String) {
        let view = CustomFeeHudView.init(dataSource: dataSource, centerTitle: centerTitle, frame: UIScreen.main.bounds)
        view.show()
    }
}

extension CustomFeeHudView:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFeeListItemCell") as! CustomFeeListItemCell
        let model = dataSource[indexPath.row]
        cell.leftTitleLB.text = model.leftTitle
        cell.rightTitleLB.text = model.rightContent
        cell.selectionStyle = .none
        return cell
    }
}
