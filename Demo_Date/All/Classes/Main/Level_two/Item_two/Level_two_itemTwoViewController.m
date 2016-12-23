//
//  Level_two_itemTwoViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_two_itemTwoViewController.h"

#import "Masonry.h"

@interface Level_two_itemTwoViewController ()

@property (nonatomic, strong) UILabel * contentLabel;

@end

@implementation Level_two_itemTwoViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    // 设置默认时区
    [self settingTimeZone];
    
    [self initUI];
}

#pragma mark - 系统代理


#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"NSTimeZone";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)settingTimeZone
{
    //只能够修改程序的defaultTimeZone，不能修改系统的，更不能修改其他程序的。
    NSTimeZone * timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [NSTimeZone setDefaultTimeZone:timeZone];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSDate *dateNow = [NSDate date];
    NSLog(@"dateNow:%@",dateNow);
    NSLog(@"%@",[dateFormatter stringFromDate:dateNow]);
}

#pragma mark - UI布局
- (void)initUI {
    
    [self.view addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}


#pragma mark - setter & getter

- (UILabel *)contentLabel {

    if (_contentLabel == nil) {
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.text = @"NSTimeZone: 时区是一个地理名字，是为了客服各个地区或者国家之间在时间上的混乱.\n1.GMT:0:00格林威治标准时间；UTC +00：00校准的全球时间；CCD +08：00中国的标准时间；\n2.任何时区都以GMT为基准，即任何NSTimeZone对象所代表的时区都是相对于GMT的，这里的相对性是NSTimeZone中的一个重要的属性，我们称之为当前时区相对于GMT的偏移量，一旦知道了一个偏移量，便可以确定一个时区。在iOS中，偏移量是以'秒'为单位的。\n3.iOS中的时间类NSDate中存储的时间，都是相对于GMT的，我们使用NSDate的时候，会根据App的时区设置返回与时区对应的数据。\n4.iOS中的时区表示方法：GMT+0800 GMT-0800;(+:东区  -:西区; 前两位是小时数，后两位是分钟数)。GMT+0830意思是比GMT早8小时外加30分钟的时区。";
    } return _contentLabel;
}

@end
