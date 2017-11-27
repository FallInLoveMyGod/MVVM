//
//  ViewModel.m
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ViewModel.h"
#import "TableViewCell.h"
#import "Model.h"
@implementation ViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self getInfo];
    }
    return self;
}
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)getInfo
{
    //实际开发数据是网络获取到的，这里模拟给出一个数据
    NSArray *array = @[@[@{@"image" : @"hero", @"title" : @"标题1", @"subTitle" : @"副标题1"},
                         @{@"image" : @"hero", @"title" : @"标题2", @"subTitle" : @"副标题2"}],
                       @[@{@"image" : @"hero", @"title" : @"标题3", @"subTitle" : @"副标题3"},
                         @{@"image" : @"hero", @"title" : @"标题4", @"subTitle" : @"副标题4"},
                         @{@"image" : @"hero", @"title" : @"标题5", @"subTitle" : @"副标题5"},
                         @{@"image" : @"hero", @"title" : @"标题6", @"subTitle" : @"副标题6"},
                         @{@"image" : @"hero", @"title" : @"标题7", @"subTitle" : @"副标题7"}]];
    
    //解析数据，转模型保存
    for (int i = 0; i < array.count; i++) {
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array[i]) {
            [tempArray addObject:[Model modelWithDic:dict]];
        }
        [self.dataArr addObject:tempArray];
    }
}

- (NSInteger)numberOfSections {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    cell.model = self.dataArr[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *str = [NSString stringWithFormat:@"点击了第%ld组第%ld行", indexPath.section, indexPath.row];
    cell.label.text = str;
}

+ (void)fetchDataWithDic:(NSDictionary *)dic WithUrlString:(NSString *)urlString {

    BaseRequestSuccessBlock success = ^(NSURLSessionDataTask *task, id responseObject){
        NSLog(@"== %@",responseObject);
    };
    BaseRequestFailureBlock fail = ^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"== %@",error);
    };
    [[BaseApi loginTokenInstance] POST:urlString parameters:dic progress:nil success:success failure:fail];
}

//+ (void)fetchDataWithDic:(NSDictionary *)dic (BaseResultBlock)block{
//    [[BaseApi loginTokenInstance] POST: parameters:API_TESTTOKEN progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//}

@end
