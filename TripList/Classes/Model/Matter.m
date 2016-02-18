//
//  Matter.m
//  TripList
//
//  Created by Kangcl on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "Matter.h"

@implementation Matter

// 字典转模型的构造方法
+ (instancetype)matterWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

// 处理字典中多余的键值对
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

@end
