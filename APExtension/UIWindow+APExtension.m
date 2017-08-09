//
//  UIWindow+APExtension.m
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import "UIWindow+APExtension.h"

@implementation UIWindow (APExtension)

- (UIResponder*)firstResponder {
    return [self valueForKey:@"_firstResponder"];
}

- (UIViewController*)topViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topViewController = rootViewController;
    while (topViewController.presentedViewController) {
        topViewController = topViewController.presentedViewController;
    }
    return topViewController;
}

@end
