//
//  NSDictionary+APExtension.m
//  Pods
//
//  Created by Captain Black on 16/6/14.
//
//

#import "NSDictionary+APExtension.h"

@implementation NSDictionary (APExtension)

+ (NSDictionary *)dictionaryWithQueryString:(NSString *)queryString {
    NSArray *keyValuePairs = [queryString componentsSeparatedByString:@"&"];
    if (keyValuePairs.count == 0) {
        return nil;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSString *pair in keyValuePairs) {
        if (pair.length) {
            NSArray *keyValue = [pair componentsSeparatedByString:@"="];
            if (keyValue.count < 2) {
                continue;
            }
            if ([keyValue[0] length] == 0 || [keyValue[1] length] == 0) {
                continue;
            }
            [dict setValue:keyValue[1] forKey:keyValue[0]];
        }
    }
    return dict;
}

- (NSString *)queryString {
    if (self.count == 0) {
        return nil;
    }
    NSMutableString *queryString = [[NSMutableString alloc] init];
    for (NSString *key in self.allKeys) {
        if (queryString.length == 0) {
            [queryString appendFormat:@"%@=%@", key, self[key]];
        } else {
            [queryString appendFormat:@"&%@=%@", key, self[key]];
        }
    }
    return [queryString copy];
}

@end
