//
//  RootView.m
//  RacMVVMTableView
//
//  Created by tb on 16/11/8.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "RootView.h"
#import "WDTableViewCell.h"

@interface RootView() <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) RootViewModel *vm;

@end

@implementation RootView

- (instancetype)initWithViewModel:(RootViewModel *)vm {
    self = [super init];
    if (self) {
        _vm = vm;
        [self wd_setupViews];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self wd_setupViews];
    }
    return self;
}


- (void)wd_setupViews {
    //override
    
    [self addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
        
    }];
}

#pragma mark - Lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"WDTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"WDTableViewCell"];
    }
    return _tableView;
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
#if 0
    //Normal System Cell
    static NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    RootModel *mod = self.vm.dataArr[indexPath.row];
    cell.textLabel.text = mod.name;
#else
    //Specific Cell --> xib
    WDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDTableViewCell" forIndexPath:indexPath];
    RootModel *mod = self.vm.dataArr[indexPath.row];
    cell.userIcon.backgroundColor = RandomColor;
    cell.titleLabel.text = mod.name;
    cell.secLabel.text = mod.descriptionss;

#endif
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.vm.cellClickSubject sendNext:indexPath];
}

@end
