
//
//  Level_one_itemTwoViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_one_itemTwoViewController.h"

@interface Level_one_itemTwoViewController ()

@end

@implementation Level_one_itemTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 世界时间转化为本地时间
    NSDate * localDate = [self worldDateToLocalDate:[NSDate date]];
    NSLog(@"本地时间: date = %@",localDate);
}


#pragma mark 世界时间转换为本地时间
- (NSDate *)worldDateToLocalDate:(NSDate *)date {
    
    // 获取本地时区
    NSTimeZone * localTimeZone = [NSTimeZone localTimeZone];
    
    //计算本地时间与时间时间的偏差
    NSInteger offset = [localTimeZone secondsFromGMTForDate:date];
    
    // 世界时间 + 偏差值 = 中国时区的时间
    NSDate * localDate = [date dateByAddingTimeInterval:offset];
    
    return localDate;
}

@end
