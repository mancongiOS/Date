//
//  Level_two_itemFourViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_two_itemFourViewController.h"

#import "Masonry.h"

@interface Level_two_itemFourViewController ()

@property (nonatomic, strong) UILabel * contentLabel;

@end

@implementation Level_two_itemFourViewController

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
    self.title = @"NSTimeInterval";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    [self.view addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    
    /** NSTimeInterval
     1. 时间段 Interval --> 间隔
     2. 单位 秒s.
     */
    
    NSDate * startDate = [NSDate date];
    
    NSTimeInterval timeInterval = 60 * 60 + 0.5;
    NSDate * endDate = [startDate dateByAddingTimeInterval:timeInterval];
    
    
    // 计算两个时间点的间隔
    NSTimeInterval endTimeInerval = [self calculateBetweenStartDate:startDate AndEndDate:endDate];
    NSLog(@"时间间隔: endTimeInerval = %f",endTimeInerval);
    
    // NSTimeInterval -- > NSInteger
    NSInteger time1 = endTimeInerval;
    NSLog(@"NSTimeInterval -- > NSInteger: time1 = %ld",(long)time1);
    
    NSInteger time2 = round(endTimeInerval);
    NSLog(@"NSTimeInterval -- > NSInteger(四舍五入): time2 = %ld",(long)time2);
}


// 计算两个时间点之间的毫秒数
- (NSTimeInterval)calculateBetweenStartDate:(NSDate *)startDate AndEndDate:(NSDate *)endDate {
    
    NSTimeInterval startTime = [startDate timeIntervalSince1970]*1;
    NSTimeInterval endTime = [endDate timeIntervalSince1970]*1;
    NSTimeInterval value = endTime - startTime;
    NSLog(@"value: %f",value);
    return value;
}

#pragma mark - setter & getter
- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        self.contentLabel.text = @"时间戳: 从1970年1月1号 00:00:00开始走过的毫秒数";
    } return _contentLabel;
}

@end
