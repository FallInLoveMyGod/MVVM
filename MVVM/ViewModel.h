//
//  ViewModel.h
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseApi.h"

@class TableViewCell, UITableView;

@interface ViewModel : NSObject

@property (nonatomic,strong)NSMutableArray * _Nullable dataArr;

- (NSInteger)numberOfSections;

- (NSInteger)tableView:(UITableView *_Nullable)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *_Nullable)tableView:(UITableView *_Nullable)tableView cellForRowAtIndexPath:(NSIndexPath *_Nullable)indexPath;

- (CGFloat)tableView:(UITableView *_Nullable)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;

- (void)tableView:(UITableView *_Nullable)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath;

+ (void)fetchDataWithDic:(NSDictionary *_Nullable)dic WithUrlString:(NSString *)urlString;

@end
