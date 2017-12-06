//
//  UIView+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

@interface UIView (APExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat maxX;//最小不能小于x, 影响w
@property (nonatomic, assign) CGFloat maxY;//最小不能小于y, 影响h
@property (nonatomic, assign) CGFloat centerX;//影响x
@property (nonatomic, assign) CGFloat centerY;//影响y

/**
 *  截图
 *
 *  @return UIImage对象
 */
- (UIImage *)snapshot NS_AVAILABLE_IOS(4_0);

/**
 *  设置view的圆角
 *  @param corners 边角
 *  @param radius 弧度
 */
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;


/**
 添加边线

 @param color 颜色
 @param borderWidth 边框尺寸
 @param borderType 指定边框
 @return
 */
- (CALayer *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;


/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
- (void)drawDashLineWithLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal;

@end
