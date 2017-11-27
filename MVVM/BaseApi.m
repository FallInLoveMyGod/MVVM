//
//  BaseApi.m
//  MVVM
//
//  Created by 田耀琦 on 2017/11/22.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

+ (instancetype)loginTokenInstance {
    static BaseApi *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[BaseApi alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        [api prepareForCommonRequest];
    });
    return api;
}

- (void)prepareForCommonRequest {
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    //    NSString *token  = [UserDefaultsUtils valueWithKey:kToken];
    //    [self.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    //    self.requestSerializer.timeoutInterval = 15.f;
    [self.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    NSMutableDictionary *paraDic = [(NSDictionary *)parameters mutableCopy];
    if (paraDic == nil) {
        paraDic = @{}.mutableCopy;
    }
    NSString *url = [NSString stringWithFormat:@"%@%@",@"",URLString];
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:url parameters:parameters error:nil];
    __block NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if (success) {
                success(task,responseObject);
            }
        }
        else {
            failure(task,error);
        }
    }];
    [task resume];
    return task;
}


@end
