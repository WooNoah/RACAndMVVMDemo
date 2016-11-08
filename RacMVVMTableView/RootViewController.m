//
//  RootViewController.m
//  RacMVVMTableView
//
//  Created by tb on 16/11/8.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "RootViewController.h"
#import "RootModel.h"
#import "RootViewModel.h"
#import "RootView.h"

@interface RootViewController ()

@property (nonatomic,strong) RootView *mainView;

@property (nonatomic,strong) RootViewModel *viewModel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"list";
    
    
    [self createUI];
    [self bindViewModel];
}

//处理点击的回调事件
- (void)bindViewModel {
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        @strongify(self);
        NSIndexPath *index = (NSIndexPath *)x;
        NSLog(@"%d",index.row);
        RootModel *rootModel = self.viewModel.dataArr[index.row];
        self.title = [NSString stringWithFormat:@"%@-%@",rootModel.name,rootModel.descriptionss];
    }];
}

- (void)createUI {
    [self.view addSubview:self.mainView];
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(self.view);
    }];
}

#pragma mark - Lazy load
- (RootView *)mainView {
    if (!_mainView) {
        _mainView = [[RootView alloc]initWithViewModel:self.viewModel];
        _mainView.backgroundColor = [UIColor yellowColor];
    }
    return _mainView;
}

- (RootViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[RootViewModel alloc]init];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
