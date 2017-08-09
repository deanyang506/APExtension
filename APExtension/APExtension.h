//
//  APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/6/1.
//  Copyright © 2016年 www.aipai.com. All rights reserved.
//

#ifndef APExtension_h
#define APExtension_h

#import "UIColor+APExtension.h"
#import "UIImage+APExtension.h"
#import "UIWindow+APExtension.h"
#import "UIView+APExtension.h"
#import "NSData+APExtension.h"
#import "NSDate+APExtension.h"
#import "NSString+APExtension.h"
#import "NSDictionary+APExtension.h"
#import "UIResponder+APExtension.h"

BOOL APSwizzleClassMethod(Class class, SEL originalSelector, SEL swizzledSelector);
void APSwizzleInstanceMethod(Class class, SEL originalSelector, SEL swizzledSelector);

#endif /* APExtension_h */
