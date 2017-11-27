//
//  BaseApi.h
//  MVVM
//
//  Created by 田耀琦 on 2017/11/22.
//  Copyright © 2017年 田耀琦. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^BaseResultBlock)(id data, NSError *error);
typedef void (^ BaseRequestSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^ BaseRequestFailureBlock)(NSURLSessionDataTask *task, NSError *error);

typedef void (^ BaseRequestSuccessBlock)(NSURLSessionDataTask *task, id responseObject);

typedef void (^ BaseRequestFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface BaseApi : AFHTTPSessionManager

+ (instancetype)loginTokenInstance;

@end
