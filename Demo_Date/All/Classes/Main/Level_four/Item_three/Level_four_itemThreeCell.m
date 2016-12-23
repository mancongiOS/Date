//
//  Level_four_itemThreeCell.m
//  Demo_Date
//
//  Created by goulela on 16/12/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Level_four_itemThreeCell.h"
#import "Masonry.h"

@implementation Level_four_itemThreeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
    } return self;
}

- (void)addSubviews {

    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self).with.offset(20);
        make.bottom.mas_equalTo(self.mas_centerY).with.offset(-10);
        make.height.mas_equalTo(20);
    }];
    
    [self addSubview:self.countDownLabel];
    [self.countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self).with.offset(20);
        make.top.mas_equalTo(self.mas_centerY).with.offset(10);
        make.height.mas_equalTo(20);
    }];
}

- (UILabel *)timeLabel {

    if (_timeLabel == nil) {
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = [UIColor blackColor];
        self.timeLabel.text = @"time";
    } return _timeLabel;
}

- (UILabel *)countDownLabel {
    
    if (_countDownLabel == nil) {
        self.countDownLabel = [[UILabel alloc] init];
        self.countDownLabel.font = [UIFont systemFontOfSize:14];
        self.countDownLabel.textColor = [UIColor blackColor];
        self.countDownLabel.text = @"countDownLabel";
    } return _countDownLabel;
}


@end
