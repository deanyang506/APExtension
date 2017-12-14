//
//  NSString+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/6/1.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import <CoreGraphics/CGGeometry.h>

@interface NSString (APExtension)

/**
 *  MD5加密
 */
- (NSString *)MD5Hash;

/**
 *  URL编码
 */
- (NSString *)URLEncodedString;

/**
 *  URL解码
 */
- (NSString *)URLDecodedString;

/**
 *  base64编码
 */
- (NSString *)base64StringFromText;

/**
 *  base64解码
 */
- (NSString *)textFromBase64String;

/**
 *  计算字符串高度 （多行）
 *
 *  @param width 字符串的宽度
 *  @param font  字体大小
 *
 *  @return 字符串的尺寸
 */
- (CGSize)calculateHeightWithWidth:(CGFloat)width font:(CGFloat)font;

/**
 *  计算字符串高度 （多行）
 *
 *  @param height 字符串的宽度
 *  @param font  字体大小
 *
 *  @return 字符串的尺寸
 */
- (CGSize)calculateWidthWithHeight:(CGFloat)height font:(CGFloat)font;

/**
 去除前后空格

 @return
 */
- (NSString *)stringByTrimming;

@end
