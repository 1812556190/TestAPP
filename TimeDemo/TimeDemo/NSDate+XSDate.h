//
//  NSDate+XSDate.h
//  TimeDemo
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XSDate)

/**
 *  获取本地的当前时间，返回一个数组
 *
 *  @return 格式 时 分 秒
 */
+ (NSArray *)currentLocelDate;


@end
