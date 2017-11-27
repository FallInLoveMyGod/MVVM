//
//  TableViewCell.h
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface TableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *label;

@property (nonatomic,strong)Model *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
