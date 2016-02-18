//
//  Matter.h
//  TripList
//
//  Created by Kangcl on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Matter : NSObject

// 事项
@property (nonatomic, strong) NSString *matter;
// 状态
@property (nonatomic) BOOL *isComplete;

// 字典转模型的构造方法
+ (instancetype)matterWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
