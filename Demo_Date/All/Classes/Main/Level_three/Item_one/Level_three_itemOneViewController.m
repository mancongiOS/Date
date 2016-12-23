//
//  Level_three_itemOneViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_three_itemOneViewController.h"

@interface Level_three_itemOneViewController ()

@end

@implementation Level_three_itemOneViewController

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
    self.title = @"实例化";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    
    [self way_one];

    [self way_two];
    
    [self way_three];
}

- (void)way_one {
    
    
    // 若获取dateComponents对象时，设置components的时候未添加NSYearCalendarUnit，dateComponents.year将返回错误的数值，其他的也一样，所以使用NSDateComponents表示时间时，要确保需要使用的数据都在componets中添加了。

    // 先定义一个遵循某个历法的日历对象
    NSCalendar * greCalender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // 通过已定义的日历对象,后去某个时间点的NSDateComponents表示,并设置需要哪些信息
    NSDateComponents * dateComponents = [greCalender components:NSCalendarUnitYear | NSCalendarUnitQuarter | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear  fromDate:[NSDate date]];
    
    
    NSLog(@"year(年份): %li", (long)dateComponents.year);
    NSLog(@"quarter(季度):%li", (long)dateComponents.quarter);
    NSLog(@"month(月份):%li", (long)dateComponents.month);
    NSLog(@"day(日期):%li", (long)dateComponents.day);
    NSLog(@"hour(小时):%li", (long)dateComponents.hour);
    NSLog(@"minute(分钟):%li", (long)dateComponents.minute);
    NSLog(@"second(秒):%li", (long)dateComponents.second);
    
    //  NSDateComponents返回的day, week, weekday, month, year这一类数据都是从1开始的。因为日历是给人看的，不是给计算机看的，从0开始就是个错误。
    //  默认星期天是1.可能是美国的设定吧.   Sunday:1, Monday:2, Tuesday:3, Wednesday:4,Thursday:5, Friday:6, Saturday:7
    NSLog(@"weekday(星期):%li", (long)dateComponents.weekday);
}


- (void)way_two {

    // 距离某个日期多少时间
    
    NSCalendar * greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //    定义一个NSDateComponents对象，设置一个时间段
    NSDateComponents *dateComponentsAsTimeQantum = [[NSDateComponents alloc] init];
    [dateComponentsAsTimeQantum setDay:6];

    //    在当前历法下，获取6天后的时间点
    NSDate *dateFromDateComponentsAsTimeQantum = [greCalendar dateByAddingComponents:dateComponentsAsTimeQantum toDate:[NSDate date] options:0];
    NSLog(@"dateFromDateComponentsAsTimeQantum: %@",dateFromDateComponentsAsTimeQantum);

}

- (void)way_three {
    //    先定义一个遵循某个历法的日历对象
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //    根据两个时间点，定义NSDateComponents对象，从而获取这两个时间点的时差
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitYear fromDate:[NSDate dateWithTimeIntervalSince1970:0] toDate:[NSDate date] options:0];
    NSLog(@"number of years:%li", (long)dateComponents.year);
}

#pragma mark - setter & getter
@end
