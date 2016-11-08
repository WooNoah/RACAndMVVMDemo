//
//  WDTableViewCell.h
//  RacMVVMTableView
//
//  Created by tb on 16/11/8.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootModel.h"

@interface WDTableViewCell : UITableViewCell

@property (nonatomic,strong) RootModel *mode;

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *secLabel;

@end
