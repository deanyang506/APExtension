//
//  NSString+APExtension.m
//  Captain Black
//
//  Created by Captain Black on 16/6/1.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+APExtension.h"
#import <UIKit/UIFont.h>
#import <UIKit/NSStringDrawing.h>

@implementation NSString (APExtension)

- (NSString *) MD5Hash {
    
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    CC_MD5_Update (&md5, [self UTF8String], (CC_LONG)[self length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0],  digest[1],
                   digest[2],  digest[3],
                   digest[4],  digest[5],
                   digest[6],  digest[7],
                   digest[8],  digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
    
}

- (NSString *)URLEncodedString {
    NSString *result = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"]];
    return result;
}

- (NSString*)URLDecodedString {
    NSString *result = [self stringByRemovingPercentEncoding];
    
    return result;
}

- (NSString *)base64Encode {
    NSString *base64E = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self,NULL,(CFStringRef)@":/?#[]@!$'()*+,;\"<>%{}|\\^~`",kCFStringEncodingUTF8));
    return base64E;
}

- (CGSize)calculateHeightWithWidth:(CGFloat)width font:(CGFloat)font {
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize  size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)  attributes:attribute context:nil].size;
    return size;

}

- (CGSize)calculateWidthWithHeight:(CGFloat)height font:(CGFloat)font {
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize  size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height)  options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)   attributes:attribute context:nil].size;
    return size;
}

@end
