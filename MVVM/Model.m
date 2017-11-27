//
//  Model.m
//  MVVM
//
//  Created by 田耀琦 on 2017/9/13.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+ (instancetype)modelWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDictionary:dic];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

@end
