//
//  NSDictionary+APExtension.h
//  Pods
//
//  Created by Captain Black on 16/6/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (APExtension)

/**
 *  把URL中的queryString转化成字典
 *
 *  @param queryString URL中的queryString
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithQueryString:(NSString *)queryString;

/**
 *  转化成URL中的queryString
 *
 *  @return URL中的queryString
 */
- (NSString *)queryString;

@end
