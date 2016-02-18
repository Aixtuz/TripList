//
//  TripList.m
//  TripList
//
//  Created by Kangcl on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "Matter.h"
#import "TripList.h"

@implementation TripList

// 封装字典转模型的构造方法
+ (instancetype)tripListWithDict:(NSDictionary *)dict
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

// 事件模型数组的 Setter 方法
- (void)setMatterList:(NSMutableArray *)matterList
{
    NSMutableArray *modelArray = [NSMutableArray array];
    // 字典数组转存模型数组
    for (NSDictionary *dict in matterList) {
        Matter *matter = [[Matter alloc] initWithDict:dict];
        [modelArray addObject:matter];
    }
    _matterList = modelArray;
}

@end
