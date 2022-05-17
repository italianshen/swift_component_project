//
//  ViewController.swift
//  iOS-Component-App
//
//  Created by danny on 2022/5/17.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    
    lazy var datePickerBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("日期选择器", for: .normal)
        btn.setTitleColor(k039B7BColor, for: UIControl.State.normal)
        btn.titleLabel?.font = kPingFangRegular17Font
        btn.addTarget(self, action: #selector(datePickerBtnDidClick(_:)), for: .touchUpInside)
       return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.datePickerBtn)
        datePickerBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50.0)
            make.width.equalTo(120.0)
            make.height.equalTo(44.0)
        }
    }

    // 日期选择器点击
    @objc func datePickerBtnDidClick(_ sender: UIButton) {
        sender.preventRepeatedPresses()
        let picker = CustomDatePicker.showDatePicker(withDateFormatter: "yyyy-MM-dd HH:mm", centerTitle: "请选择日期", datePickerMode: UIDatePicker.Mode.dateAndTime)
        picker.doneAction = {(date) in
            HGLog("点击完成\(date)")
            ToastUtil.showMessage(message: "你选择的日期是:\(date)")
        }
    }
}

