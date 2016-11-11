//
//  NSArray+Category.m
//  KindnessFind
//
//  Created by zhangyi on 16/9/26.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

+ (NSArray *)getOSSImageNameArrayWithImageCount:(NSInteger)count
{
    NSMutableArray * imageNameArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i ++) {
        NSDate * date = [NSDate date];
        double timeInter = [date timeIntervalSince1970] * 1000000;
        
        NSString * imageNameString = [NSString stringWithFormat:@"%f%ld",timeInter,(long)i];
        
        NSMutableString * md5String = [[NSMutableString alloc] initWithString:[NSString md5:imageNameString]];
        
        for (int j = 0; j < 4; j ++) {
            [md5String insertString:@"-" atIndex:8 + j * 5];
        }
        
        [md5String appendString:@".jpg"];
        [imageNameArray addObject:md5String];
    }
    return imageNameArray;
}


+ (void)storageArrayToPhoneWithDataArray:(NSArray *)array fileName:(NSString *)fileName
{
    //1.获取文件路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:fileName];
    
    NSLog(@"path=%@",path);
    
    //2.将数组保存到文件中
    [NSKeyedArchiver archiveRootObject:array toFile:path];
    
}

+ (NSArray *)getArrayFromLocalWithFileName:(NSString *)fileName
{
    //1.获取文件路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:fileName];
    
    //2.取出数据
    NSArray * objectArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return objectArray;
}

@end
