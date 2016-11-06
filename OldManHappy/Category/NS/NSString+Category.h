//
//  NSString+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

+ (NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+ (NSString *) jsonStringWithArray:(NSArray *)array;

+ (NSString *)md5:(NSString *)str;


@end
