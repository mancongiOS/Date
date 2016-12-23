//
//  Level_one_itemOneViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_one_itemOneViewController.h"

@interface Level_one_itemOneViewController ()

@property (nonatomic, strong) NSDate * date;

@end

@implementation Level_one_itemOneViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self initUI];
}



#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"获取当前时间";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    // 获取当前时间
    self.date = [NSDate date];
    NSLog(@"当前时间: date = %@",self.date);
}



#pragma mark - setter & getter

- (NSDate *)date {

    if (_date == nil) {
        self.date = [[NSDate alloc] init];
    } return _date;
}

@end
