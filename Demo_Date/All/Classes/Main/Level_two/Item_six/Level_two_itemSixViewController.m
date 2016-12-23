//
//  Level_two_itemSixViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_two_itemSixViewController.h"

@interface Level_two_itemSixViewController ()

@end

@implementation Level_two_itemSixViewController

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
    self.title = @"比较两个时间的大小";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    // 时间字符串
    NSString *createdAtString = @"2015-11-20 11:10:05";
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [fmt dateFromString:createdAtString];
    
    // 手机当前时间
    NSDate *nowDate = [NSDate date];
    
    /**
     NSComparisonResult的取值
     NSOrderedAscending = -1L, // 升序, 越往右边越大
     NSOrderedSame,  // 相等
     NSOrderedDescending // 降序, 越往右边越小
     */
    // 获得比较结果(谁大谁小)
    NSComparisonResult result = [nowDate compare:createdAtDate];
    if (result == NSOrderedAscending) { // 升序, 越往右边越大
        NSLog(@"createdAtDate > nowDate");
    } else if (result == NSOrderedDescending) { // 降序, 越往右边越小
        NSLog(@"createdAtDate < nowDate");
    } else {
        NSLog(@"createdAtDate == nowDate");
    }
}


#pragma mark - setter & getter

@end
