//
//  UIButton+APExtension.h
//  APExtension
//
//  Created by Dean.Yang on 2017/7/31.
//  Copyright © 2017年 aipai156. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, APButtonEdgeInsetsStyle) {
    APButtonEdgeInsetsStyleTop, // image在上，label在下
    APButtonEdgeInsetsStyleLeft, // image在左，label在右
    APButtonEdgeInsetsStyleBottom, // image在下，label在上
    APButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (APExtension)

/**
 *  @author hj, 06.27 2016 20:06
 *
 *  同时向按钮的四个方向延伸响应面积
 *
 *  @param size 间距
 */
- (void)setEnlargeEdge:(CGFloat) size;

/**
 *  @author hj, 06.27 2016 20:06
 *
 *  向按钮的四个方向延伸响应面积
 *
 *  @param top    上间距
 *  @param left   左间距
 *  @param bottom 下间距
 *  @param right  右间距
 */
- (void)setEnlargeEdgeWithTop:(CGFloat) top left:(CGFloat) left bottom:(CGFloat) bottom right:(CGFloat) right;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)imageTitleInsert_layoutButtonWithEdgeInsetsStyle:(APButtonEdgeInsetsStyle)style  imageTitleSpace:(CGFloat)space;

@end
