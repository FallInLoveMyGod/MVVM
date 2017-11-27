//
//  TableViewCell.m
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
@interface TableViewCell()

@property (nonatomic,strong)UIImageView *imgView;

@property (nonatomic,strong)UILabel *subLabel;

@end

@implementation TableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identify = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 60)];
    imgView.backgroundColor = [UIColor redColor];
    self.imgView = imgView;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(115, 5, 180, 16)];
    label.text = @"试试看";
    label.font = [UIFont systemFontOfSize:16];
    label.backgroundColor = [UIColor greenColor];
    self.label = label;
    
    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 30, 180, 14)];
    subLabel.text = @"那就试试吧";
    subLabel.font = [UIFont systemFontOfSize:14];
    subLabel.backgroundColor = [UIColor blueColor];
    self.subLabel = subLabel;
    
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.subLabel];
}

- (void)setModel:(Model *)model {
    _model = model;
    self.imgView.image = [UIImage imageNamed:model.image];
    self.label.text = model.title;
    self.subLabel.text = model.subTitle;
}


@end
