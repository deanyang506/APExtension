//
//  UIImage+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/22.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  对应角度的cos值
 *
 *  @param angle 角度
 *
 *  @return 对应角度的cos值
 */
NS_INLINE double cosByAngle(double angle);

/**
 *  对应角度的sin值
 *
 *  @param angle 角度
 *
 *  @return 对应角度的sin值
 */
NS_INLINE double sinByAngle(double angle);

/**
 *  获取平面圆某半径和角度上的坐标点
 *
 *  @param center 圆心点
 *  @param radius 半径
 *  @param angle  角度
 *
 *  @return 返回平面坐标点
 */
NS_INLINE CGPoint CGPointGetPointInCircle(CGPoint center, CGFloat radius, CGFloat angle);
/**
 *  像素值转化为点值
 *
 *  @param pixel 像素
 *
 *  @return 点值
 */
NS_INLINE CGFloat CGPointValueWithPixel(NSUInteger pixel);

@interface UIImage (APExtension)

/**
 *  生成纯色图片
 *
 *  @param size  图片尺寸
 *  @param color 颜色
 *
 *  @return UIImage对象
 */
+ (UIImage*)imageWithSize:(CGSize)size color:(UIColor*)color NS_AVAILABLE_IOS(4_0);

/**
 *  用tintColor对图片染色
 *
 *  @param color 颜色
 *
 *  @return 新的UIImage对象
 */
- (UIImage*)imageWithTintColor:(UIColor*)color NS_AVAILABLE_IOS(4_0);

/**
 *  对图片混色
 *
 *  @param color 混合的颜色
 *
 *  @param mode 混合模式，传入kCGBlendModeDestinationIn，即可实现-imageWithTintColor:相同的效果
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageBlendWithColor:(UIColor *)color mode:(CGBlendMode)mode NS_AVAILABLE_IOS(4_0);

/**
 *  修改图片透明度
 *
 *  @param alpha 透明度
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageWithAlpha:(CGFloat)alpha NS_AVAILABLE_IOS(4_0);

/**
 *  图片剪切圆角
 *
 *  @param topLeftRadius     左上角弧度
 *  @param topRightRadius    右上角弧度
 *  @param bottomRightRadius 右下角弧度
 *  @param bottomLeftRadius  左下角弧度
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageWithTopLefRadius:(CGFloat)topLeftRadius topRightRadius:(CGFloat)topRightRadius bottomRightRadius:(CGFloat)bottomRightRadius bottomLeftRadius:(CGFloat)bottomLeftRadius NS_AVAILABLE_IOS(4_0);

/**
 *  缩放图片
 *
 *  @param scale 缩放比例
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageWithScale:(CGFloat)scale;

/**
 *  图片拉伸填充到对应 size
 *
 *  @param size  目标图片 size
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageFillToSize:(CGSize)size;

/**
 *  图片等比填充到对应 size
 *
 *  @param size 目标图片 size
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageAspectFillToSize:(CGSize)size;

/**
 *  图片等比适配到对应 size
 *
 *  @param size 目标图片 size
 *
 *  @return 新的UIImage对象
 */
- (UIImage *)imageAspectFitToSize:(CGSize)size;

@end
