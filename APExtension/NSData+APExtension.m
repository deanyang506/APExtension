//
//  NSData+APExtension.m
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import "NSData+APExtension.h"
#import <CommonCrypto/CommonCrypto.h>

NS_INLINE int hexValueOfChar(unichar c) {
    int b;
    if (c >= '0' && c <= '9') {
        b = (c - '0');
    } else if (c >= 'A' && c <= 'F') {
        b = 10 + c - 'A';
    } else if (c >= 'a' && c <= 'f') {
        b = 10 + c - 'a';
    } else {
        return -1;
    }
    return b;
}

@implementation NSData (APExtension)

+ (instancetype)dataWithHexString:(NSString *)hexString {
    if (!hexString.length || hexString.length % 2) {
        NSLog(@"error hexString");
        return nil;
    }
    NSMutableData *data = [NSMutableData data];
    unichar c;
    Byte b;
    NSInteger h;
    NSInteger i = 0;
    for (; i < hexString.length; i += 2) {
        c = [hexString characterAtIndex:i];
        h = hexValueOfChar(c);
        if (h < 0) return nil;
        b = h * 16;
        
        c = [hexString characterAtIndex:i + 1];
        h = hexValueOfChar(c);
        if (h < 0) return nil;
        b += h;
        
        [data appendBytes:&b length:1];
    }
    
    return data;
}

- (NSString *)md5String {
    
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    CC_MD5_Update (&md5, [self bytes], (CC_LONG)[self length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
    
}

- (NSString *)sha1String {
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], (CC_LONG)[self length], digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

//(key和iv向量这里是16位的) 这里是CBC加密模式，安全性更高
- (NSData *)AES128EncryptWithKey:(NSString *)key gIv:(NSString *)gIv {
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    
    
    
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

- (NSData *)AES128DecryptWithKey:(NSString *)key gIv:(NSString *)gIv {
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

- (NSString *)hexString:(BOOL)upperCaseOrNot {
    
    NSMutableString *output = [NSMutableString stringWithCapacity:([self length] * 2)];
    const unsigned char *bytes = [self bytes];
    
    NSString *format = upperCaseOrNot ? @"%02X" : @"%02x";
    for (int i = 0; i < [self length]; ++i)
    {
        [output appendFormat:format, bytes[i]];
    }
    return output;
}

@end
