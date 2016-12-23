//
//  Level_four_itemOneViewController.m
//  Demo_Date
//
//  Created by goulela on 16/12/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_four_itemOneViewController.h"
#import "Masonry.h"

@interface Level_four_itemOneViewController ()
{
    NSTimer       *_timer;     //定时器
    NSInteger      _second;    //倒计时的时间
}
@property (nonatomic, strong) UIButton * codeButton;

@end

@implementation Level_four_itemOneViewController

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
- (void)codeButtonClicked {

    // 验证手机号
    self.codeButton.userInteractionEnabled = NO;
    
    _second = 60;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    
}


#pragma mark 定时器调用的方法
- (void)changeTime
{
    
    //每一秒调用一次改方法, 每次调用,_second 减一.
    _second --;
    
    
    //修改倒计时标签文字   ->   把按钮文字改成倒计时的时间
    [self.codeButton setTitle:[NSString stringWithFormat:@"重新获取验证码(%@s)",@(_second)] forState:UIControlStateNormal];
    [self.codeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    //如果时间到了 0 秒, 把定时器取消掉
    if (_second == -1)
    {
        //释放定时器
        [_timer invalidate];
        //把定时器设置成空.不然不起作用.
        _timer = nil;
        
        
        //把修改的验证码按钮调整为初始状态
        self.codeButton.userInteractionEnabled = YES;
        [self.codeButton setTitle:@"| 点击获取验证码" forState:UIControlStateNormal];
        [self.codeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
    }
}
#pragma mark - 网络请求
- (void)sendNetWorking {
    
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting {
    self.title = @"60秒倒计时";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI布局
- (void)initUI {
    
    [self.view addSubview:self.codeButton];
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 40));

    }];
}


#pragma mark - setter & getter
- (UIButton *)codeButton {
    if (_codeButton == nil) {
        self.codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.codeButton.titleLabel.font = [UIFont systemFontOfSize:14];;
        [self.codeButton setTitle:@"| 点击获取验证码" forState:UIControlStateNormal];
        [self.codeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.codeButton addTarget:self action:@selector(codeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    } return _codeButton;
}

@end
