//
//  NSArray+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/9/26.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)


/**
 对时间戳进行md5加密，生成不同的图片名称

 */
+ (NSArray *)getOSSImageNameArrayWithImageCount:(NSInteger)count;


/**
 将数组持久化，存入本地

 @param array    需要存入的数组
 @param fileName 保存的文件名
 */
+ (void)storageArrayToPhoneWithDataArray:(NSArray *)array fileName:(NSString *)fileName;


/**
 从本地取出数组

 @param fileName 文件名

 @return 取出的数组
 */
+ (NSArray *)getArrayFromLocalWithFileName:(NSString *)fileName;



@end
