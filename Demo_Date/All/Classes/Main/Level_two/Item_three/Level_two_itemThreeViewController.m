//
//  Level_two_itemThreeViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_two_itemThreeViewController.h"


@interface Level_two_itemThreeViewController ()

@end

@implementation Level_two_itemThreeViewController

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
    self.title = @"NSDate <--> NSString";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    [self NSStringToNSDate];
    
    [self NSDateToNSString];
}

- (void)NSStringToNSDate {
    
    NSString * timeStr = @"2016-01-01 01:01:01";
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate * date = [dateFormatter dateFromString:timeStr];
    NSLog(@"NSStringToNSDate: date = %@",date);
}

- (void)NSDateToNSString {
 
    NSDate * nowDate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateFormatter.dateStyle = kCFDateFormatterFullStyle;
    dateFormatter.timeStyle = kCFDateFormatterLongStyle;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSString * dateStr = [dateFormatter stringFromDate:nowDate];
    NSLog(@"NSDateToNSString: dateStr = %@",dateStr);
    
}

#pragma mark - setter & getter
@end
