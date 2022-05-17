//
//  Marcros.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/14.
//  Copyright © 2020 udianbus. All rights reserved.
//

import Foundation
import UIKit

/// MARK： - 适配缩放参数
let kScaleRatio = UIScreen.main.bounds.size.width/375.0
/// MARK： - 屏幕物理尺寸
let kScreenWidth = UIScreen.main.bounds.size.width
/// MARK： - 屏幕高度
let kScreenHeight = UIScreen.main.bounds.size.height

/// MARK： - 屏幕高度
let kBottomSafeAreaHeight:CGFloat = kScreenHeight >= 812.0 ? 34.0 : 0.0
/// 状态栏高度
let kStatusBarH:CGFloat = UIApplication.shared.statusBarFrame.height
/// 顶部bar的高度
let kNavBarH:CGFloat = kStatusBarH + 44.0;
/// 底部toolBar高度
let kBottomToolBarHeight:CGFloat = kBottomSafeAreaHeight + 49.0

/// MARK： - 是否是iPhoneX
let kIsiPhoneX:Bool = UIApplication.shared.statusBarFrame.size.height > 20.0

/// 是否是苹果x系列
let isIPHONEX = UIApplication.shared.statusBarFrame.size.height > 20.0


/// MARK: - app主色
let kAppMainThemeColor = UIColor(red: 51.0/255.0, green: 145.0/255.0, blue: 232.0/255.0, alpha: 1.0)
/// MARK: -app 主题颜色
let kAppMainTitleColor = UIColor(red: 27.0/255.0, green:27.0/255.0, blue: 27.0/255.0, alpha: 1.0)

/// MARK: -666的灰色
let kAppSubTitleColor = UIColor(red: 102.0/255.0, green:102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
/// MARK: -app背景色
let kAppBagroundGrayColor = UIColor(red: 243.0/255.0, green:245.0/255.0, blue: 248.0/255.0, alpha: 1.0)
/// MARK: - 16进制颜色 FCGCFC
let kFCGCFCColor = UIColor(red: 252.0/255.0, green:252.0/255.0, blue: 252.0/255.0, alpha: 1.0)
/// MARK: - 16进制颜色 1B1B1B
let k1B1B1BColor = UIColor(red: 27.0/255.0, green:27.0/255.0, blue: 27.0/255.0, alpha: 1.0)
/// MARK: - 16进制颜色 333333
let k333333Color = UIColor(red: 51.0/255.0, green:51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
/// MARK: - 16进制颜色 D3D9DF
let kD3D9DFColor = UIColor(red: 211.0/255.0, green:217.0/255.0, blue: 223.0/255.0, alpha: 1.0)
/// MARK: - 按钮高亮颜色
let kBtnEnableColor = UIColor(red: 13.0/255.0, green: 191.0/255.0, blue:160.0/255.0, alpha: 1.0)
/// MARK: - 按钮不可点击颜色
let kBtnDisableColor = UIColor(red: 13.0/255.0, green: 191.0/255.0, blue:160.0/255.0, alpha: 1.0).withAlphaComponent(0.4)
/// MARK: - 按钮颜色
let k0DBFA0Color = UIColor(red: 13.0/255.0, green:191.0/255.0, blue: 160.0/255.0, alpha: 1.0)
/// MARK: - 16进制颜色 F3F5F8
let kF3F5F8Color = UIColor(red: 243.0/255.0, green:245.0/255.0, blue: 248.0/255.0, alpha: 1.0)
/// MARK: - 16进制颜色 334746
let k334746Color = UIColor.init(witHex: "#334746")

///MARK: - 16进制颜色 999999
public let k999999Color =  UIColor.init(witHex: "#999999")
///MARK: - 16进制颜色 1B6FFF
public let k1B6FFFColor =  UIColor.init(witHex: "#1B6FFF")
///MARK: - 16进制颜色 555555
public let k555555Color =  UIColor.init(witHex: "#555555")
///MARK: - 16进制颜色 222222
public let k222222Color =  UIColor.init(witHex: "#222222")
///MARK: - 16进制颜色 666666
public let k666666Color =  UIColor.init(witHex: "#666666")
///MARK: - 16进制颜色 FF7C00
public let kFF7C00Color =  UIColor.init(witHex: "#FF7C00")
///MARK: - 16进制颜色 FAFAFA
public let kFAFAFAColor = UIColor.init(witHex: "#FAFAFA")
///MARK: - 16进制颜色 DEDEDE
public let kDEDEDEColor = UIColor.init(witHex: "#DEDEDE")
///MARK: - 16进制颜色 F2F2F2
public let kF2F2F2Color = UIColor.init(witHex: "#F2F2F2")
///MARK: - 16进制颜色 1890FF
public let k1890FFColor = UIColor.init(witHex: "#1890FF")
///MARK: - 16进制颜色 #62778A
public let k62778AColor = UIColor.init(witHex: "#62778A")
///MARK: - 16进制颜色 #E94545
public let kE94545Color = UIColor.init(witHex: "#E94545")
/// MARK: - 16进制颜色  #D0E2EE
public let kD0E2EEColor = UIColor.init(witHex: "#D0E2EE")
///MARK: - 16进制颜色 #FF0000
public let kFF0000Color = UIColor.init(witHex: "#FF0000")
///MARK: - 16进制颜色 039B7B
public let k039B7BColor =  UIColor.init(witHex: "#039B7B")


///MARK: - 分割线色
public let kSeperatorColor = kDEDEDEColor
///MARK: - 16进制颜色 5D7092
public let k5D7092Color = UIColor(red:93.0/255.0, green:112.0/255.0, blue: 146.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色 D8D8D8
public let kD8D8D8Color = UIColor(red:216.0/255.0, green:216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色E4E3E3
public let kE4E3E3Color = UIColor(red:228.0/255.0, green:227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色 182938
public let k182938Color = UIColor(red:24.0/255.0, green:41.0/255.0, blue: 56.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色 555555
public let kFF555555Color = UIColor(red:255.0/255.0, green:85.0/255.0, blue: 85.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色B8BFC4
public let kB8BFC4Color = UIColor(red:184.0/255.0, green:191.0/255.0, blue: 196.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色7F97AC
public let k7F97ACColor = UIColor(red:127.0/255.0, green:151.0/255.0, blue: 172.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色4795FF
public let k4795FFColor = UIColor(red:71.0/255.0, green:149.0/255.0, blue: 255.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色4795FF
public let k4A4B5BColor = UIColor(red:74.0/255.0, green:75.0/255.0, blue: 91.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色3E5466
public let k3E5466Color = UIColor(red:62.0/255.0, green:84.0/255.0, blue: 102.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色FF9D4
public let kFF9D4CColor = UIColor(red:255.0/255.0, green:157.0/255.0, blue: 76.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色 979797
public let k979797Color = UIColor(red:151.0/255.0, green:151.0/255.0, blue: 151.0/255.0, alpha: 1.0)

/// MARK: - 幽灵按钮不可以点击 E1E3E6
public let kE1E3E6Color = UIColor(red:225.0/255.0, green:227.0/255.0, blue: 230.0/255.0, alpha: 1.0)
///MARK: - 16进制颜色C4C4C4
public let kC4C4C4Color = UIColor(red:196.0/255.0, green:196.0/255.0, blue: 196.0/255.0, alpha: 1.0)

/// MARK: - 还未定
public let kMobileHLColor = UIColor.init(witHex: "#027bd6")

//// 默认图  色块 EAEBEC place_holder
//let kPlaceHolder = UIImage(color: UIColor.init(witHex: "#EAEBEC"), size: CGSize.init(width: 800, height: 800))
/// MARK: -18中粗体
let kFont18Bold = UIFont.init(name: "PingFangSC-Medium", size: 18.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 18.0)

/// MARK: -16常规体
let kPingFangRegular16Font = UIFont.init(name: "PingFangSC", size: 16.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 16.0)

/// MARK: -13常规体
let kFont13Normal = UIFont.init(name: "PingFangSC", size: 13.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 13.0)


/// MARK: -10常规体
public let kPingFangRegular10Font = UIFont(name: "PingFangSC-Regular", size: 10.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 10.0 * kScaleRatio)
/// MARK: -11常规体
public let kPingFangRegular11Font = UIFont(name: "PingFangSC-Regular", size: 11.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 11.0 * kScaleRatio)

/// MARK: -12常规体
public let kPingFangRegular12Font = UIFont(name: "PingFangSC-Regular", size: 12.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 12.0 * kScaleRatio)

/// MARK: -13常规体
public let kPingFangRegular13Font = UIFont(name: "PingFangSC-Regular", size: 13.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 13.0 * kScaleRatio)

/// MARK: -17 常规体
public let kPingFangRegular17Font = UIFont(name: "PingFangSC-Regular", size: 17.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 17.0 * kScaleRatio)

/// MARK: -14 常规体
public let kPingFangRegular14Font = UIFont(name: "PingFangSC-Regular", size: 14.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 14.0 * kScaleRatio)

/// MARK: -15 常规体
public let kPingFangRegular15Font = UIFont(name: "PingFangSC-Regular", size: 15.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 15.0 * kScaleRatio)
/// MARK: - 18 常规体
public let kPingFangRegular18Font = UIFont(name: "PingFangSC-Regular", size: 18.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 18.0 * kScaleRatio)
/// MARK: - 24 常规体
public let kPingFangRegular24Font = UIFont(name: "PingFangSC-Regular", size: 24.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 24.0 * kScaleRatio)
// MARK: - 12 中黑体
public let kPingFangMedium12Font = UIFont(name: "PingFangSC-Medium", size: 12.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 12.0 * kScaleRatio)
// MARK: - 13 中黑体
public let kPingFangMedium13Font = UIFont(name: "PingFangSC-Medium", size: 13.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 13.0 * kScaleRatio)

// MARK: - 10 中黑体
public let kPingFangMedium10Font = UIFont(name: "PingFangSC-Medium", size: 10.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 10.0 * kScaleRatio)
// MARK: - 14 中黑体
public let kPingFangMedium14Font = UIFont(name: "PingFangSC-Medium", size: 14.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 14.0 * kScaleRatio)
// MARK: - 16 中黑体
public let kPingFangMedium16Font = UIFont(name: "PingFangSC-Medium", size: 16.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 16.0 * kScaleRatio)
/// MARK: - 17  中黑体
public let kPingFangMedium17Font = UIFont(name: "PingFangSC-Medium", size: 17.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 17.0 * kScaleRatio)
/// MARK: - 18  中黑体
public let kPingFangMedium18Font = UIFont(name: "PingFangSC-Medium", size: 18.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 18.0 * kScaleRatio)

/// MARK: - 24 中黑体
public let kPingFangMedium24Font = UIFont(name: "PingFangSC-Medium", size: 24.0 * kScaleRatio) ?? UIFont.systemFont(ofSize: 24.0 * kScaleRatio)
/// MARK: - 极光APPKEY
public let kJIGUANGAPPKEY = "0c661f4e4c60651858abf3bf"
/// MARK: - 高德地图的app key
public let kGAODEMAPAPPKEY = "da340fb2e062a4bbd2aa5bafd9bf5349"

/// 中文逗号
public let kChineseComma = "，"
public let kLeftstartStr = "* "
