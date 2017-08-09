//
//  UIColor+APAdditions.h
//  Captain Black
//
//  Created by Roger on 15/5/28.
//  Copyright (c) 2015年 www.aipai.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(APExtension)

/**
 *  字符串转成颜色对象
 *
 *  @param hexString 颜色字符串，如：#RGB、#ARGB、#RRGGBB、#AARRGGBB
 *
 *  @return 颜色对象
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

/**
 *  24bit 数值转成颜色对象
 *
 *  @param hexValue  颜色数值，如：0xFFFFFF。 alpha为1，如果需要修改 alpha 请用-colorFromHexValue: withAlpha:
 *
 *  @return 颜色对象
 */
+ (UIColor *)colorFromHexValue:(NSUInteger)hexValue;

/**
 *  24bit 数值转成颜色对象
 *
 *  @param hexValue 颜色数值，如：0xFFFFFF。
 *  @param alpha     透明度
 *
 *  @return 颜色对象
 */
+ (UIColor *)colorFromHexValue:(NSUInteger)hexValue withAlpha:(CGFloat)alpha;


/**
 *  获取像素点颜色
 *  @param point 坐标
 *  @param image 图像
 *
 *  @result 颜色对象
 */
+ (UIColor *)pixelColorAtLocation:(CGPoint)point inImage:(UIImage *)image;

@end
