//
//  Level_two_itemOneViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_two_itemOneViewController.h"

@interface Level_two_itemOneViewController ()

@property (nonatomic, strong) NSDateFormatter * dateFormatter_one;

@end

@implementation Level_two_itemOneViewController

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
    self.title = @"基本知识";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    NSDate * nowDate = [NSDate date];
    
    NSString * localDateStr = [self.dateFormatter_one stringFromDate:nowDate];
    NSLog(@"localDateSt = %@",localDateStr);
}


#pragma mark - setter & getter
- (NSDateFormatter *)dateFormatter_one {

    if (_dateFormatter_one == nil) {
        self.dateFormatter_one = [[NSDateFormatter alloc] init];
        
        
        /** 1. 设置时间格式
         说明下格式对应的意义
         YYYY（年）/MM（月）/dd（日） hh（时）:mm（分）:ss（秒） SS（毫秒）
         需要用哪个的话就把哪个格式加上去。
         值得注意的是，如果想显示两位数的年份的话，可以用”YY/MM/dd hh:mm:ss SS”，两个Y代表两位数的年份。
         而且大写的M和小写的m代表的意思也不一样。“M”代表月份，“m”代码分钟
         “HH”代表24小时制，“hh”代表12小时制
         
         ** 更详细的介绍 **
         a      : AM/PM (上午/下午)
         A      : 0~86399999 (一天的第A微秒)
         c/cc   : 1~7 (一周的第一天, 周天为1)
         ccc    : Sun/Mon/Tue/Wed/Thu/Fri/Sat (星期几简写)
         cccc   : Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday (星期几全拼)
         d      : 1~31 (月份的第几天, 带0)
         D      : 1~366 (年份的第几天,带0)
         e      : 1~7 (一周的第几天, 带0)
         E~EEE  : Sun/Mon/Tue/Wed/Thu/Fri/Sat (星期几简写)
         EEEE   : Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday (星期几全拼)
         F      : 1~5 (每月的第几周, 一周的第一天为周一)
         h      : 1~12 (0 padded Hour (12hr)) 带0的时, 12小时制
         H      : 0~23 (0 padded Hour (24hr))  带0的时, 24小时制
         k      : 1~24 (0 padded Hour (24hr) 带0的时, 24小时制
         K      : 0~11 (0 padded Hour (12hr)) 带0的时, 12小时制
         L/LL   : 1~12 (0 padded Month)  第几月
         LLL    : Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec 月份简写
         LLLL   : January/February/March/April/May/June/July/August/September/October/November/December 月份全称
         m      : 0~59 (0 padded Minute) 分钟
         M/MM   : 1~12 (0 padded Month) 第几月
         MMM    : Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec
         MMMM   : January/February/March/April/May/June/July/August/September/October/November/December
         q/qq   : 1~4 (0 padded Quarter) 第几季度
         qqq    : Q1/Q2/Q3/Q4 季度简写
         qqqq   : 1st quarter/2nd quarter/3rd quarter/4th quarter 季度全拼
         Q/QQ   : 1~4 (0 padded Quarter) 同小写
         QQQ    : Q1/Q2/Q3/Q4 同小写
         QQQQ   : 1st quarter/2nd quarter/3rd quarter/4th quarter 同小写
         s      : 0~59 (0 padded Second) 秒数
         S      : (rounded Sub-Second) 未知
         v~vvv  : (General GMT Timezone Abbreviation) 常规GMT时区的编写
         vvvv   : (General GMT Timezone Name) 常规GMT时区的名称
         w      : 1~53 (0 padded Week of Year, 1st day of week = Sunday, NB: 1st week of year starts from the last Sunday of last year) 一年的第几周, 一周的开始为周日,第一周从去年的最后一个周日起算
         W      : 1~5 (0 padded Week of Month, 1st day of week = Sunday) 一个月的第几周
         y/yyyy : (Full Year) 完整的年份
         yy/yyy : (2 Digits Year)  2个数字的年份
         */
        [self.dateFormatter_one setDateFormat:@"yyyy-MM-dd HH:mm-ss"];
        
        
        /** 2. 自定义区域语言
         1. en_US   美国英语 (默认语言)
         2. zh_CN   简体中文
         */
        self.dateFormatter_one.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];


        /** 3. NSDateFormatterStyle    // date and time format styles 日期和时间的格式
         
         // 默认美国英语下的输出
         NSDateFormatterNoStyle = kCFDateFormatterNoStyle,                    // 无输出
         NSDateFormatterShortStyle = kCFDateFormatterShortStyle,              // 10/29/12, 2:27 PM
         NSDateFormatterMediumStyle = kCFDateFormatterMediumStyle,            // Oct 29, 2012, 2:36:59 PM
         NSDateFormatterLongStyle = kCFDateFormatterLongStyle,                // October 29, 2012, 2:38:46 PM GMT+08:00
         NSDateFormatterFullStyle = kCFDateFormatterFullStyle                 // Monday, October 29, 2016, 2:39:56 PM China Standard Time
         };
         
         // 修改为简体中文下的输出
         typedef CF_ENUM(CFIndex, CFDateFormatterStyle) {    // date and time format styles
         kCFDateFormatterNoStyle = 0,       // 无输出
         kCFDateFormatterShortStyle = 1,    // 12-10-29 下午2:52
         kCFDateFormatterMediumStyle = 2,   // 2012-10-29 下午2:51:43
         kCFDateFormatterLongStyle = 3,     // 2012年10月29日 GMT+0800下午2时51分08秒
         kCFDateFormatterFullStyle = 4      // 2012年10月29日星期一 中国标准时间下午2时46分49秒
         };
         */
        self.dateFormatter_one.dateStyle = kCFDateFormatterFullStyle;
        self.dateFormatter_one.timeStyle = kCFDateFormatterFullStyle;
        
        
        
    } return _dateFormatter_one;
}


@end
