//
//  UIView+NextController.m
//  AipaiConfigurable
//
//  Created by Captain Black on 2016/10/19.
//  Copyright © 2016年 Aipai. All rights reserved.
//

#import "UIResponder+APExtension.h"

@implementation UIResponder (APExtension)

- (UIViewController *)nextController {
    UIResponder *responder = [self nextResponder];
    
    while (responder && ![responder isKindOfClass:[UIViewController class]]) {
        responder = [responder nextResponder];
    }
    
    return (UIViewController*)responder;
}

@end
