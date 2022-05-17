//
//  String+Extension.swift
//
//
//  Created by Danny on 2019/11/28.
//  Copyright © 2019 Danny. All rights reserved.
//

import UIKit
import CommonCrypto

extension String { // 计算宽高的分类
    
    func ga_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
         let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
         return ceil(rect.width)
     }
     
    
    /// 获取高度 适合xib布局的视图
    /// - Parameters:
    ///   - fontSize: 字体
    ///   - width: 宽度
     func ga_heightForComment(fontSize: CGFloat, width: CGFloat) -> CGFloat {
         let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
         return ceil(rect.height)
     }
     
     func ga_heightForComment(fontSize: CGFloat, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
         let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
         return ceil(rect.height)>maxHeight ? maxHeight : ceil(rect.height)
    }
    
    /// 适合代码布局的
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    public func width(withConstrainedHeight height: CGFloat, font: UIFont, minimumTextWrapWidth:CGFloat) -> CGFloat {
        
        var textWidth:CGFloat = minimumTextWrapWidth
        let incrementWidth:CGFloat = minimumTextWrapWidth * 0.1
        var textHeight:CGFloat = self.height(withConstrainedWidth: textWidth, font: font)
        
        //Increase width by 10% of minimumTextWrapWidth until minimum width found that makes the text fit within the specified height
        while textHeight > height {
            textWidth += incrementWidth
            textHeight = self.height(withConstrainedWidth: textWidth, font: font)
        }
        return ceil(textWidth)
    }
    
    
    /// md5的加密
    var md5: String
    {
        let str = self.cString(using: String.Encoding.utf8)
           let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
           let digestLen = Int(CC_MD5_DIGEST_LENGTH)
           let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
           CC_MD5(str!, strLen, result)
           let hash = NSMutableString()
           for i in 0 ..< digestLen {
               hash.appendFormat("%02x", result[i])
           }
           free(result)
           return String(format: hash as String)
     }
    
    /// 截取到任意位置
    func subString(to: Int) -> String {
        let index: String.Index = self.index(startIndex, offsetBy: to)
        return String(self[..<index])
    }
    
    //日期 -> 字符串
    func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date
    }
    
    //字符串 -> 日期  因为后台给的格式是 yyyy-MM-dd 和yyyy-MM-dd HH:mm 直接yyyy-MM-dd HH:mm:ss用这种格式会转换失败 只能取yyyy-MM-dd这个格式加以转换
    func string2Date(_ string:String, dateFormat:String = "yyyy-MM-dd HH:mm") -> Date {
//        if let mDate = NSDate(fromStringYY_MM_DD: string){
//            return mDate as Date
//        }else{
//            let formatter = DateFormatter()
//            formatter.locale = Locale.init(identifier: "zh_CN")
//            formatter.dateFormat = dateFormat
//            var date = formatter.date(from: string)
//            if date == nil {
//                HGLog("🐬字符串转换时间失败了")
//                date = Date()
//            }
//            return date!
//        }
        return toDate(withFormat: dateFormat)
    }
    
    //转换字符串成date
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = format
      guard let date = dateFormatter.date(from: self) else {
        preconditionFailure("Take a look to your format")
      }
      return date
    }
    
    //字符串 -> 日期  因为后台给的格式是 yyyy-MM-dd 和yyyy-MM-dd HH:mm 直接yyyy-MM-dd HH:mm:ss用这种格式会转换失败 只能取yyyy-MM-dd这个格式加以转换
    func string2DateWithCustomFormmate(_ string:String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date {
        if let mDate = NSDate(fromStringYY_MM_DD: string, andDateFormate: dateFormat){
            return mDate as Date
        }else{
            let formatter = DateFormatter()
            formatter.locale = Locale.init(identifier: "zh_CN")
            formatter.dateFormat = dateFormat
            var date = formatter.date(from: string)
            if date == nil {
                HGLog("🐬字符串转换时间失败了")
                date = Date()
            }
            return date!
        }
    }
    
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
     
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}

