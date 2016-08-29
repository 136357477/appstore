//
//  TabLabCell.h
//  Demo2
//
//  Created by guohui on 16/8/29.
//  Copyright © 2016年 guohui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface TabLabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
- (void)configwithmodel:(Model *)model ;
@end
