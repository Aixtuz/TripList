//
//  TripList.h
//  TripList
//
//  Created by Kangcl on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TripList : NSObject

// 清单名称
@property (nonatomic, strong) NSString *title;
// 目的地
@property (nonatomic, strong) NSString *destination;
// 图示
@property (nonatomic, strong) NSString *imageUrl;
// 事件模型数组
@property (nonatomic, strong) NSMutableArray *matterList;

// 封装字典转模型的构造方法
+ (instancetype)tripListWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
