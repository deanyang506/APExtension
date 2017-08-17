//
//  NSData+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *AESgIv = @"AD8BB59CE350BBC7";

@interface NSData (APExtension)
/**
 *  用十六进制字符串生成NSData
 *
 *  @param hexString 必须十六进制字符串
 *
 *  @return 返回NSData对象
 */
+ (instancetype)dataWithHexString:(NSString*)hexString NS_AVAILABLE_IOS(2_0);

/**
 *  计算MD5值
 *
 *  @return MD5字符串
 */
- (NSString *)md5String NS_AVAILABLE_IOS(2_0);

/**
 *  计算SHA1值
 *
 *  @return SHA1字符串
 */
- (NSString *)sha1String NS_AVAILABLE_IOS(2_0);


/**
 AES128加密

 @param key 加密key
 @param gIv 向量16位字符，或传入默认的AESgIv
 @return 加密后数据
 */
- (NSData *)AES128EncryptWithKey:(NSString *)key gIv:(NSString *)gIv;


/**
 AES128解密

 @param key 解密key
 @param gIv 向量16位字符，或传入默认的AESgIv
 @return 解密后数据
 */
- (NSData *)AES128DecryptWithKey:(NSString *)key gIv:(NSString *)gIv;

/**
 *  把二进制数据转化成十六进制字符串形式
 *
 *  @param upperCaseOrNot 是否大写
 *
 *  @return 十六进制字符串
 */
- (NSString *)hexString:(BOOL)upperCaseOrNot NS_AVAILABLE_IOS(2_0);

@end
