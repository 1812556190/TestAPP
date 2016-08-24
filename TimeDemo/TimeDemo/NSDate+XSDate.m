//
//  NSDate+XSDate.m
//  TimeDemo
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "NSDate+XSDate.h"

@implementation NSDate (XSDate)

+ (NSArray *)currentLocelDate{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];//时间本地化
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateformatter stringFromDate:currentDate];
    NSRange rang = {11,8};
    NSString *strTime = [strDate substringWithRange:rang];
    NSArray *arrayTime = [strTime componentsSeparatedByString:@":"];
    
    return arrayTime;
}
@end
