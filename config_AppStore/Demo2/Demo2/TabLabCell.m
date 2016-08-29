//
//  TabLabCell.m
//  Demo2
//
//  Created by guohui on 16/8/29.
//  Copyright © 2016年 guohui. All rights reserved.
//

#import "TabLabCell.h"

@implementation TabLabCell

- (void)configwithmodel:(Model *)model{
    self.label.text = model.name ;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
