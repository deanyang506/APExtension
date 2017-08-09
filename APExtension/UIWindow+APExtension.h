//
//  UIWindow+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (APExtension)
/**
 *  返回该Window下的第一响应者
 *
 *  @return UIResponder对象
 */
- (UIResponder*)firstResponder NS_AVAILABLE_IOS(2_0);
/**
 *  返回Window下的顶层视图控制器（能接收旋屏事件的，非navigationController/tabBarController下的子控制器）
 *
 *  @return UIViewController对象
 */
- (UIViewController*)topViewController NS_AVAILABLE_IOS(5_0);

@end
