//
//  UIWindow+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (APExtension)

- (UIResponder *)firstResponder;
- (UIViewController *)topViewController;
- (UIViewController *)currentShowController;
- (UIViewController *)currentShowBottomController;

@end
