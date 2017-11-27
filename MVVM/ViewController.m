//
//  ViewController.m
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "BaseApi.h"

#define kBASEURL  @"http://api.daigoush.com"
#define kHOTSEARCH   @"/c/v1/pdd/findlist"
#define API_TESTTOKEN @"backUser/getUserId"
#define API_ROOT_STRING @"http://106.14.142.186:8080/fengqianggo"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *mytable;

@property (nonatomic,strong)ViewModel *viewmodel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM设计模式";
    [self creatUI];
    self.viewmodel = [[ViewModel alloc] init];
    [self fetchData];
}

- (void)creatUI {
    self.mytable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.mytable.dataSource = self;
    self.mytable.delegate = self;
    [self.view addSubview:self.mytable];
}

- (void)fetchData {
    NSDictionary *paraDic = @{@"token":@""};
    [ViewModel fetchDataWithDic:paraDic WithUrlString:[NSString stringWithFormat:@"%@/%@",API_ROOT_STRING,API_TESTTOKEN]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewmodel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewmodel tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewmodel tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewmodel tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewmodel tableView:tableView didSelectRowAtIndexPath:indexPath];
}



@end
