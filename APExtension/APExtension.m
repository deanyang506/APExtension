//
//  APExtension_APExtension.h
//  Pods
//
//  Created by Captain Black on 16/9/9.
//
//

#import <objc/runtime.h>

BOOL APSwizzleClassMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getClassMethod(class,originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    if (originalMethod == NULL || swizzledMethod == NULL) {
        return NO;
    }
    method_exchangeImplementations(originalMethod, swizzledMethod);
    return YES;
}

void APSwizzleInstanceMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
