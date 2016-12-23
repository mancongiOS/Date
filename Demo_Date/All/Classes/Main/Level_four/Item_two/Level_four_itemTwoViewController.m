//
//  Level_four_itemTwoViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_four_itemTwoViewController.h"
#import "Masonry.h"
#import "CountDown.h"

@interface Level_four_itemTwoViewController ()

@property (nonatomic, strong) UILabel * dayLabel;
@property (nonatomic, strong) UILabel * hourLabel;
@property (nonatomic, strong) UILabel * minuteLabel;
@property (nonatomic, strong) UILabel * secondLabel;

@property (strong, nonatomic)  CountDown *countDownForLabel;


@end

@implementation Level_four_itemTwoViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self initUI];
    
    
    [self countDownSetting];
}


#pragma mark - 点击事件


#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    [self.view addSubview:self.hourLabel];
    [self.hourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.view.mas_centerX).with.offset(-5);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    [self.view addSubview:self.dayLabel];
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.hourLabel.mas_left).with.offset(-10);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    [self.view addSubview:self.minuteLabel];
    [self.minuteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_centerX).with.offset(5);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    [self.view addSubview:self.secondLabel];
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.minuteLabel.mas_right).with.offset(10);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
}

- (void)countDownSetting {

    _countDownForLabel = [[CountDown alloc] init];

    ///方法一倒计时测试
   // long long startLongLong =  1467713971000;
   // long long finishLongLong = 1467714322000;
 //   [self startLongLongStartStamp:startLongLong longlongFinishStamp:finishLongLong];
    
    
    // 方法二
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* startDate = [formater dateFromString:@"2015-12-21 19:24:20"];
    NSDate* finishDate = [formater dateFromString:@"2015-12-31 19:24:20"];
    [self startWithStartDate:startDate finishDate:finishDate];
}

///此方法用两个时间戳做参数进行倒计时
-(void)startLongLongStartStamp:(long long)strtLL longlongFinishStamp:(long long)finishLL{
    __weak __typeof(self) weakSelf= self;
    
    [_countDownForLabel countDownWithStratTimeStamp:strtLL finishTimeStamp:finishLL completeBlock:^(NSInteger day, NSInteger hour, NSInteger minute, NSInteger second) {
        NSLog(@"666");
        [weakSelf refreshUIDay:day hour:hour minute:minute second:second];
    }];
}

-(void)refreshUIDay:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second{
    if (day==0) {
        self.dayLabel.text = @"0天";
    }else{
        self.dayLabel.text = [NSString stringWithFormat:@"%ld天",(long)day];
    }
    if (hour<10&&hour) {
        self.hourLabel.text = [NSString stringWithFormat:@"0%ld小时",(long)hour];
    }else{
        self.hourLabel.text = [NSString stringWithFormat:@"%ld小时",(long)hour];
    }
    if (minute<10) {
        self.minuteLabel.text = [NSString stringWithFormat:@"0%ld分",(long)minute];
    }else{
        self.minuteLabel.text = [NSString stringWithFormat:@"%ld分",(long)minute];
    }
    if (second<10) {
        self.secondLabel.text = [NSString stringWithFormat:@"0%ld秒",(long)second];
    }else{
        self.secondLabel.text = [NSString stringWithFormat:@"%ld秒",(long)second];
    }
}

//此方法用两个NSDate对象做参数进行倒计时
-(void)startWithStartDate:(NSDate *)strtDate finishDate:(NSDate *)finishDate{
    __weak __typeof(self) weakSelf= self;
    
    [_countDownForLabel countDownWithStratDate:strtDate finishDate:finishDate completeBlock:^(NSInteger day, NSInteger hour, NSInteger minute, NSInteger second) {
        NSLog(@"777");
        [weakSelf refreshUIDay:day hour:hour minute:minute second:second];
    }];
}

#pragma mark - setter & getter

- (UILabel *)dayLabel {
    if (_dayLabel == nil) {
        self.dayLabel = [[UILabel alloc] init];
        self.dayLabel.backgroundColor = [UIColor redColor];
        self.dayLabel.font = [UIFont systemFontOfSize:14];
        self.dayLabel.textAlignment = NSTextAlignmentCenter;
    } return _dayLabel;
}

- (UILabel *)hourLabel {
    if (_hourLabel == nil) {
        self.hourLabel = [[UILabel alloc] init];
        self.hourLabel.backgroundColor = [UIColor greenColor];
        self.hourLabel.font = [UIFont systemFontOfSize:14];
        self.hourLabel.textAlignment = NSTextAlignmentCenter;

    } return _hourLabel;
}

- (UILabel *)minuteLabel {
    if (_minuteLabel == nil) {
        self.minuteLabel = [[UILabel alloc] init];
        self.minuteLabel.backgroundColor = [UIColor yellowColor];
        self.minuteLabel.font = [UIFont systemFontOfSize:14];
        self.minuteLabel.textAlignment = NSTextAlignmentCenter;

    } return _minuteLabel;
}
- (UILabel *)secondLabel {
    if (_secondLabel == nil) {
        self.secondLabel = [[UILabel alloc] init];
        self.secondLabel.backgroundColor = [UIColor orangeColor];
        self.secondLabel.font = [UIFont systemFontOfSize:14];
        self.secondLabel.textAlignment = NSTextAlignmentCenter;

    } return _secondLabel;
}

@end
