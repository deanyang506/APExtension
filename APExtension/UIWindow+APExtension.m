//
//  UIWindow+APExtension.m
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import "UIWindow+APExtension.h"

@implementation UIWindow (APExtension)


- (UIResponder *)firstResponder {
    return [self valueForKey:@"_firstResponder"];
}

- (UIViewController *)currentShowController {
    return [[self class] topViewController:self.rootViewController];
}

+ (UIViewController *)topViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [[self class] topViewController:[navigationController.viewControllers lastObject]];
    }
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabController = (UITabBarController *)rootViewController;
        return [[self class] topViewController:tabController.selectedViewController];
    }
    if (rootViewController.presentedViewController) {
        return [[self class] topViewController:rootViewController.presentedViewController];
    }
    return rootViewController;
}

- (UIViewController*)topViewController {
    UIViewController *topViewController = self.rootViewController;
    while (topViewController.presentedViewController) {
        topViewController = topViewController.presentedViewController;
    }
    return topViewController;
}

- (UIViewController *)currentShowBottomController {
    UIViewController *viewController = self.topViewController;
    UIViewController *presentingViewController = viewController.presentingViewController;
    while (presentingViewController) {
        if (presentingViewController.presentingViewController && [presentingViewController.presentingViewController isViewLoaded] && presentingViewController.presentingViewController.view.window) {
            presentingViewController = presentingViewController.presentingViewController;
        } else {
            break;
        }
    }
    
    if (presentingViewController) {
        viewController = presentingViewController;
    }
    
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        viewController = ((UITabBarController *)viewController).selectedViewController;
    }
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        viewController = ((UINavigationController *)viewController).topViewController;
    }
    
    return viewController;
}

@end
