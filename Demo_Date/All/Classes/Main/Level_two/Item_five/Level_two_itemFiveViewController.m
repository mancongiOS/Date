//
//  Level_two_itemFiveViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_two_itemFiveViewController.h"

@interface Level_two_itemFiveViewController ()

@end

@implementation Level_two_itemFiveViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self sendNetWorking];
    
    [self initUI];
}

#pragma mark - 系统代理

#pragma mark - 点击事件

#pragma mark - 网络请求
- (void)sendNetWorking {
    
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"计算一个时间段有多少天/小时/分钟/秒";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    NSTimeInterval value = 3659;
    NSArray * timeArray = [self calculateTimeQuantumWithValue:value];
    
    NSLog(@"时间: timeArray = %@",timeArray);
}


// 计算一个时间段是多少天 多少时分秒
- (NSArray *)calculateTimeQuantumWithValue:(NSTimeInterval)time {
    
    long value = (long)time;
    
    // 计算一天/一小时/一分钟/一秒 包含多少秒
    long day = 60 * 60 * 24;
    long hour = 60 * 60;
    long minute = 60;
    long second = 1;
    
    long daysCount = value / day;
    long hoursCount = (value % day) / hour;
    long minutesCount = ((value % day) % hour) / minute;
    long secondsCount = (((value % day) % hour) % minute) / second;
    
    NSString * daysStr = [NSString stringWithFormat:@"day: %ld",daysCount];
    NSString * hoursStr = [NSString stringWithFormat:@"hour: %ld",hoursCount];
    NSString * minutesStr = [NSString stringWithFormat:@"minute: %ld",minutesCount];
    NSString * secondsStr = [NSString stringWithFormat:@"second: %ld",secondsCount];
    
    NSArray * timeArray = @[daysStr,hoursStr,minutesStr,secondsStr];
    
    return timeArray;
}


#pragma mark - setter & getter
@end
