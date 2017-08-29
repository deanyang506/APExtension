//
//  UIView+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (APExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
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

@end
