//
//  Model.h
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic,strong)NSString *image;

@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSString *subTitle;

+ (instancetype)modelWithDic:(NSDictionary *)dic;


@end
