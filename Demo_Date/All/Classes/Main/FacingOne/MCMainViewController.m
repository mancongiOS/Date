//
//  MCMainViewController.m
//  Demo_Animation
//
//  Created by goulela on 16/10/8.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCMainViewController.h"

#import "Masonry.h"

#import "Level_oneViewController.h"
#import "Level_twoViewController.h"
#import "Level_threeViewController.h"
#import "Level_fourViewController.h"

@interface MCMainViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArrayM;

@end

@implementation MCMainViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
    
    [self createData];
}


#pragma mark - 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idetifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    
    cell.textLabel.text = self.dataArrayM[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        Level_oneViewController * oneViewController = [[Level_oneViewController alloc] init];
        [self.navigationController pushViewController:oneViewController animated:YES];
    } else if (indexPath.row == 1) {
        Level_twoViewController * twoViewController = [[Level_twoViewController alloc] init];
        [self.navigationController pushViewController:twoViewController animated:YES];
    } else if (indexPath.row == 2) {
        Level_threeViewController * threeViewController = [[Level_threeViewController alloc] init];
        [self.navigationController pushViewController:threeViewController animated:YES];
    } else if (indexPath.row == 3) {
        Level_fourViewController * fourViewController = [[Level_fourViewController alloc] init];
        [self.navigationController pushViewController:fourViewController animated:YES];
    }
}

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"掌握了时间,就掌握了一切!";
}

- (void)addTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)createData
{
    NSArray * array = @[@"NSDate",@"NSDateFormatter",@"NSCalendar",@"倒计时"];
    
    self.dataArrayM = [NSMutableArray arrayWithArray:array];
    
    [self.tableView reloadData];
}

#pragma mark - setter & getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArrayM
{
    if (!_dataArrayM)
    {
        self.dataArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArrayM;
}

@end
