//
//  UILabel+Extension.m
//  pengxiang_travel
//
//  Created by danny on 2021/4/11.
//  Copyright © 2021 udianbus. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
//    label.text = title;
//    label.font = font;
//    label.numberOfLines = 0;
//    [label sizeToFit];
//    CGFloat height = label.frame.size.height;
    
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.textAlignment = NSTextAlignmentRight;
    label.text = title;
    label.font = font;
    CGSize labelSize = [label sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    CGFloat height = ceil(labelSize.height) + 1;
    return ceil(height);
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    CGFloat width = label.frame.size.width;
    return ceil(width);
}

@end
