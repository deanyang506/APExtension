//
//  NSData+APExtension.h
//  Captain Black
//
//  Created by Captain Black on 16/1/23.
//  Copyright © 2016年 Captain Black. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * AES向量
 */
extern char *AESVectorString;

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
 *  ASE加密
 *  @param key 加密Key
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key;

/**
 *  ASE解密
 *  @param key 解密Key
 */
- (NSData *)AES256DecryptWithKey:(NSString *)key;

/**
 *  把二进制数据转化成十六进制字符串形式
 *
 *  @param upperCaseOrNot 是否大写
 *
 *  @return 十六进制字符串
 */
- (NSString *)hexString:(BOOL)upperCaseOrNot NS_AVAILABLE_IOS(2_0);

@end
