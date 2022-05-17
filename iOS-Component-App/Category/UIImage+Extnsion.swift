//
//  UIImage+Extnsion.swift
//  pengxiang_travel
//
//  Created by danny on 2020/9/14.
//  Copyright © 2020 udianbus. All rights reserved.
//

import UIKit

extension UIImage {
    
    // MARK: - 根据颜色生成图片
    class func imageWithColor(color:UIColor,size:CGSize,isRoundedCorner:Bool,radius:CGFloat,rectCorner:UIRectCorner =  UIRectCorner.allCorners) -> UIImage?{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext(){
            context.setFillColor(color.cgColor)
            context.fill(rect)
            
            var image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            if isRoundedCorner {
                let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
                if let mContext = UIGraphicsGetCurrentContext(){
                    let path = UIBezierPath(roundedRect: newRect, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
                    mContext.addPath(path.cgPath)
                    mContext.clip()
                    image?.draw(in: newRect)
                    mContext.drawPath(using: CGPathDrawingMode.fillStroke)
                    image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    return image
                }
            }
        }
        return nil
    }

    // 绘制四周圆角图片
    // MARK: - 根据颜色生成图片
    class func createAllCornersImageWithColor(color:UIColor,size:CGSize,isRoundedCorner:Bool,radius:CGFloat) -> UIImage?{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext(){
            context.setFillColor(color.cgColor)
            context.fill(rect)
            
            var image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            if isRoundedCorner {
                let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
                if let mContext = UIGraphicsGetCurrentContext(){
                    let path = UIBezierPath(roundedRect: newRect, byRoundingCorners: [UIRectCorner.topLeft,UIRectCorner.topRight,UIRectCorner.bottomLeft,UIRectCorner.bottomRight],
                                            cornerRadii: CGSize(width: radius, height: radius))
                    mContext.addPath(path.cgPath)
                    mContext.clip()
                    image?.draw(in: newRect)
                    mContext.drawPath(using: CGPathDrawingMode.fillStroke)
                    image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    return image
                }
            }
        }
        return nil
    }
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func resizedTo1MB() -> UIImage? {
        guard let imageData = self.pngData() else { return nil }
        let megaByte = 1000.0

        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB

        while imageSizeKB > megaByte { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resized(withPercentage: 0.5),
            let imageData = resizedImage.pngData() else { return nil }

            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB
        }

        return resizingImage
    }
    
    /// 压缩到多少k
    func resizedImage(toTargetKB:Double) -> UIImage? {
        guard let imageData = self.pngData() else { return nil }
        let megaByte = toTargetKB

        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB

        while imageSizeKB > megaByte { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resized(withPercentage: 0.5),
            let imageData = resizedImage.pngData() else { return nil }

            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB
        }

        return resizingImage
    }
}

