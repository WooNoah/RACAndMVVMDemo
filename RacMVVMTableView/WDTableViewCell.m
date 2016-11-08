//
//  WDTableViewCell.m
//  RacMVVMTableView
//
//  Created by tb on 16/11/8.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "WDTableViewCell.h"

@implementation WDTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(RootModel *)model
{
    if (!model) {
        return;
    }
    
    _mode = model;
    
    self.titleLabel.text  = model.name;
//    self.secLabel.text = model.descriptionss;
//    [self.movieImageView sd_setImageWithURL:URL(model.images[@"small"]) placeholderImage:ImageNamed(@"picholder")];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
