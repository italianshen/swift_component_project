//
//  SwiftUtil.swift
//  ydbus
//
//  Created by danny on 2020/9/9.
//  Copyright © 2020 SIBAT. All rights reserved.
//

import UIKit

class SwiftUtil: NSObject {

    // 单例
    static let shareInstance = SwiftUtil()
    
    ///   生成错误
    /// - Parameters:
    ///   - domain: 域名
    ///   - errorCode: 错误码
    ///   - errorMsg: 错误信息
    func createError(domain:String,errorCode:Int,errorMsg:String) -> NSError {
        let error = NSError.init(domain: domain, code: errorCode, userInfo: [NSLocalizedDescriptionKey:errorMsg])
        return error
    }
    
    
    /// 创建数据为空的错误
    /// - Parameter domain: 域名
    func createDataIsEmptyError(with domain:String) -> NSError {
        let err = SwiftUtil.shareInstance.createError(domain: domain, errorCode: CustomErrrorCodeType.DataIsEmpty.rawValue, errorMsg: CustomErrrorMessage.NoDataError.rawValue)
        return err;
    }
    
    /// 创建数据类型异常的错误
    /// - Parameter domain: 域名
    func createDataTypeError(with domain:String) -> NSError {
        let err = SwiftUtil.shareInstance.createError(domain: domain, errorCode: CustomErrrorCodeType.DataTypeError.rawValue, errorMsg: CustomErrrorMessage.NoDataError.rawValue)
        return err;
    }
    
    /// 创建请求数据异常的错误
    /// - Parameter domain: 域名
    func createApiRequestUnknownError(with domain:String) -> NSError {
        let err = SwiftUtil.shareInstance.createError(domain: domain, errorCode: CustomErrrorCodeType.UnknownError.rawValue, errorMsg: CustomErrrorMessage.UnknownError.rawValue)
        return err;
    }
    
    
    // MARK:- 获取当前的版本号
    func getCurrentVersion() -> String {
        let infoDictionary = Bundle.main.infoDictionary
        if let infoDictionary = infoDictionary {
            let appVersion = infoDictionary["CFBundleShortVersionString"]
            let appBuild = infoDictionary["CFBundleVersion"]
            HGLog("version\(String(describing: appVersion)),build\(String(describing: appBuild))")
            return appVersion as? String ?? ""
        }
        else{
            return ""
        }
    }
    
    //MARK: - 模拟接口数据
    func getSimulateJsonData(fileName:String) -> [String:Any]? {
        // select_cinema_data
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        // 带throws的方法需要抛异常
            do {
                      /*
                         * try 和 try! 的区别
                         * try 发生异常会跳到catch代码中
                         * try! 发生异常程序会直接crash
                         */
                    let data = try Data(contentsOf: url)
                    let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let jsonDict = jsonData as? [String:Any]{
                    //print("读取本地数据成功\(String(describing: jsonDict))")
                    return jsonDict
                }
            } catch let error as Error? {
                print("读取本地数据出现错误!\(String(describing: error))")
                return nil
            }
        return nil
    }
    
    ///MARK:-  数字转中文
    func numberToChineseDigitalNumber(num: Int) -> String {
        var intNum = num
        let chineseNumberArr = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
        let chinesePositionArr = ["", "十", "百", "千"]
        
        // 输出的小节中文
        var chineseNum = ""
        // 每小节内部只能有一个中文"零"
        var isZero = false
        for index in 0..<4 {
            // 获取末尾值(取出个位)
            let end = intNum % 10
            // 判断该数字是否为0, 若不是0, 就直接拼接权位, 若是0, 则判断是否已经出现过中文"零"
            if end == 0 {
                if !isZero  { // 上一位数不为0, 执行补0
                    isZero = true
                    chineseNum = chineseNumberArr[0] + chineseNum
                }
            }else {
                isZero = false
                chineseNum = chineseNumberArr[end] + chinesePositionArr[index] + chineseNum  // 数字 + 权位
            }
            intNum = intNum / 10; // 去除原来的个位
        }
        
        if chineseNum.contains("零") {
            chineseNum = chineseNum.replacingOccurrences(of: "零", with: "")
        }
        return chineseNum
    }
    
    
    /// 获取当前时间
    func getCurrentDate(withDateFormatter dateFormatter:String) -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = dateFormatter
        let strNowTime = timeFormatter.string(from: date) as String
        return strNowTime
    }
    
    
    /// 创建必填项属性字符串
    func createMustFilledAttributeString(orginalString:String,highlightString:String) -> NSAttributedString{
        let attr = NSMutableAttributedString(string: orginalString)
        let range = (orginalString as NSString).range(of: highlightString)
        attr.addAttribute(NSAttributedString.Key.foregroundColor, value: k334746Color, range: NSRange(location: 0, length: orginalString.count))
        attr.addAttributes([NSAttributedString.Key.font : kPingFangRegular16Font], range: NSRange(location: 0, length: orginalString.count))
        attr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        attr.addAttributes([NSAttributedString.Key.font : kPingFangRegular16Font], range: range)
        return attr
    }
}
