//
//  UIView+APExtension.m
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import "UIView+APExtension.h"
#import <OpenGLES/gltypes.h>
#import <OpenGLES/ES1/gl.h>

@implementation UIView (APExtension)
@dynamic x, y, w, h, width, height, maxX, maxY, centerX, centerY;

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect rc = self.frame;
    rc.origin.x = x;
    self.frame = rc;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect rc = self.frame;
    rc.origin.y = y;
    self.frame = rc;
}

- (CGFloat)w {
    return self.frame.size.width;
}

- (void)setW:(CGFloat)w {
    CGRect rc = self.frame;
    rc.size.width = w;
    self.frame = rc;
}

- (CGFloat)h {
    return self.frame.size.height;
}

- (void)setH:(CGFloat)h {
    CGRect rc = self.frame;
    rc.size.height = h;
    self.frame = rc;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect rc = self.frame;
    rc.size.width = width;
    self.frame = rc;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect rc = self.frame;
    rc.size.height = height;
    self.frame = rc;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect rc = self.frame;
    rc.origin = origin;
    self.frame = rc;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect rc = self.frame;
    rc.size = size;
    self.frame = rc;
}

- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxX:(CGFloat)maxX {
    CGRect rc = self.frame;
    CGFloat d = maxX - self.x;
    if (d <= 0) {
        rc.size.width = 0;
    } else {
        rc.size.width = d;
    }
    self.frame = rc;
}

- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMaxY:(CGFloat)maxY {
    CGRect rc = self.frame;
    CGFloat d = maxY - self.y;
    if (d <= 0) {
        rc.size.height = 0;
    } else {
        rc.size.height = d;
    }
    self.frame = rc;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint c = self.center;
    c.x = centerX;
    self.center = c;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint c = self.center;
    c.y = centerY;
    self.center = c;
}

- (UIImage *)snapshot {
    int width = CGRectGetWidth([self bounds]);
    int height = CGRectGetHeight([self bounds]);
    
    NSInteger myDataLength = width * height * 4;
    
    // allocate array and read pixels into it.
    GLubyte* buffer = (GLubyte*)malloc(myDataLength);
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
    
    // gl renders "upside down" so swap top to bottom into new array.
    // there's gotta be a better way, but this works.
    GLubyte* buffer2 = (GLubyte*)malloc(myDataLength);
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width * 4; x++) {
            buffer2[(height - 1 - y) * width * 4 + x] = buffer[y * 4 * width + x];
        }
    }
    
    // make data provider with data.
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer2, myDataLength, NULL);
    
    // prep the ingredients
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 * width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    // make the cgimage
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    // then make the uiimage from that
    UIImage* myImage = [UIImage imageWithCGImage:imageRef];
    return myImage;
}

-(void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    CGRect rect = self.bounds;
    
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

- (CALayer *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType {
    
    if (borderType == UIBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
    }
    
    CAShapeLayer *shapeLayer;
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        shapeLayer = [self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        shapeLayer = [self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        shapeLayer = [self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        shapeLayer = [self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth];
    }
    
    [self.layer addSublayer:shapeLayer];
    
    return shapeLayer;
}

- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    
    return shapeLayer;
}

@end
