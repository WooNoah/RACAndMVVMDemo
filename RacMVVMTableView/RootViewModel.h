//
//  RootViewModel.h
//  RacMVVMTableView
//
//  Created by tb on 16/11/8.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootModel.h"

@interface RootViewModel : NSObject

- (instancetype)initWithModel:(RootModel *)mode;

@property (nonatomic,strong) RootModel *model;

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) RACSubject *cellClickSubject;

//@property (nonatomic,strong) RACCommand *dataCommand;

@end
