//
//  UIButton+APExtension.h
//  APExtension
//
//  Created by Dean.Yang on 2017/7/31.
//  Copyright © 2017年 aipai156. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
