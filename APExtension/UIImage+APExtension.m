//
//  UIImage+APExtension.m
//  Captain Black
//
//  Created by Captain Black on 16/1/22.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import "UIImage+APExtension.h"
#import <Foundation/Foundation.h>

NS_INLINE double cosByAngle(double angle) {
    return cos(M_PI * angle / 180);
}
NS_INLINE double sinByAngle(double angle) {
    return sin(M_PI * angle / 180);
}

NS_INLINE CGPoint CGPointGetPointInCircle(CGPoint center, CGFloat radius, CGFloat angle) {
    CGFloat x = center.x + radius * cosByAngle(angle);
    CGFloat y = center.y - radius * sinByAngle(angle);
    return CGPointMake(x, y);
}

NS_INLINE CGFloat CGPointValueWithPixel(NSUInteger pixel) {
    return 1.0 * pixel / [UIScreen mainScreen].scale;
}

@implementation UIImage (APExtension)

+ (UIImage*)imageWithSize:(CGSize)size color:(UIColor*)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    [color setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage*)imageWithTintColor:(UIColor*)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    [color setFill];
    CGRect rc = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(rc);
    [self drawInRect:rc blendMode:kCGBlendModeDestinationIn alpha:1];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageBlendWithColor:(UIColor *)color mode:(CGBlendMode)mode {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    [color setFill];
    CGRect rc = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(rc);
    [self drawInRect:rc blendMode:mode alpha:1];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithAlpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    CGRect rc = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:rc blendMode:kCGBlendModeMultiply alpha:alpha];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageClipByCircleWithRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctxRef, self.size.width / 2, self.size.height / 2, radius, 0, 2*M_PI, 0);
    
    CGContextClosePath(ctxRef);
    CGContextClip(ctxRef);
    
    CGContextTranslateCTM(ctxRef, 0, self.size.height);
    CGContextScaleCTM(ctxRef, 1, -1);
    CGContextDrawImage(ctxRef, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
}

- (UIImage *)imageWithTopLefRadius:(CGFloat)topLeftRadius topRightRadius:(CGFloat)topRightRadius bottomRightRadius:(CGFloat)bottomRightRadius bottomLeftRadius:(CGFloat)bottomLeftRadius {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    if (ctxRef == NULL) {
        return nil;
    }
    
    CGPoint topLeft = CGPointMake(0, 0);
    CGPoint topRight = CGPointApplyAffineTransform(topLeft, CGAffineTransformMakeTranslation(self.size.width, 0));
    CGPoint bottomRight = CGPointApplyAffineTransform(topRight, CGAffineTransformMakeTranslation(0, self.size.height));
    CGPoint bottomLeft = CGPointApplyAffineTransform(bottomRight, CGAffineTransformMakeTranslation(-self.size.width, 0));
    
    CGContextMoveToPoint(ctxRef, topLeft.x, topLeft.y + topLeftRadius);
    CGContextAddArcToPoint(ctxRef, topLeft.x, topLeft.y, topLeft.x+topLeftRadius, topRight.y, topLeftRadius);
    CGContextAddArcToPoint(ctxRef, topRight.x, topRight.y, topRight.x, topRight.y+topRightRadius, topRightRadius);
    CGContextAddArcToPoint(ctxRef, bottomRight.x, bottomRight.y, bottomRight.x-bottomRightRadius, bottomRight.y, bottomRightRadius);
    CGContextAddArcToPoint(ctxRef, bottomLeft.x, bottomLeft.y, bottomLeft.x, bottomLeft.y-bottomLeftRadius, bottomLeftRadius);
    
    CGContextClosePath(ctxRef);
    CGContextClip(ctxRef);
    
    CGContextTranslateCTM(ctxRef, 0, self.size.height);
    CGContextScaleCTM(ctxRef, 1, -1);
    CGContextDrawImage(ctxRef, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
}

- (UIImage *)imageWithScale:(CGFloat)scale {
    CGSize size = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
    
}

- (UIImage *)imageFillToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
}

- (UIImage *)imageAspectFillToSize:(CGSize)size {
    CGFloat scale, w, h;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    if (self.size.width == 0 || self.size.height == 0) {
        return  nil;
    }
    if (size.width < size.height) {
        scale = size.height / self.size.height;
        w = self.size.width * scale;
        h = size.height;
    } else {
        scale = size.width / self.size.width;
        w = size.width;
        h = self.size.height * scale;
    }
    
    [self drawInRect:CGRectMake((size.width - w) / 2, (size.height - h) / 2, w, h)];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimage;
}

- (UIImage *)imageAspectFitToSize:(CGSize)size {
    CGFloat scale, w, h;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    if (UIGraphicsGetCurrentContext() == NULL) {
        return nil;
    }
    
    if (self.size.width == 0 || self.size.height == 0) {
        return  nil;
    }
    if (size.width > size.height) {
        scale = size.height / self.size.height;
        w = self.size.width * scale;
        h = size.height;
    } else {
        scale = size.width / self.size.width;
        w = size.width;
        h = self.size.height * scale;
    }
    
    [self drawInRect:CGRectMake((size.width - w) / 2, (size.height - h) / 2, w, h)];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimage;
}

@end
