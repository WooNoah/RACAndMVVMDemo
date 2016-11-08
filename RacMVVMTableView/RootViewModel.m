//
//  RootViewModel.m
//  RacMVVMTableView
//
//  Created by tb on 16/11/8.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "RootViewModel.h"

@implementation RootViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    RootViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        
        [viewModel initialized];
    }
    return viewModel;
}

- (instancetype)initWithModel:(RootModel *)mode {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)initialized {
    for (int i = 1; i < 13; i++) {
        RootModel *mode = [[RootModel alloc]init];
        mode.name = [NSString stringWithFormat:@"model-%d",i];
        mode.descriptionss = [NSString stringWithFormat:@"description-%d",i];
        [self.dataArr addObject:mode];
    }
}

#pragma mark - Lazy load
- (RACSubject *)cellClickSubject {
    if (!_cellClickSubject) {
        _cellClickSubject = [RACSubject subject];
    }
    return _cellClickSubject;
}

//- (RACCommand *)dataCommand {
//    if (!_dataCommand) {
//        _dataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
//            @weakify(self);
//            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//               subscriber sendNext:<#(id)#>
//            }];
//        }];
//    }
//    return _dataCommand;
//}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArr;
}


@end
