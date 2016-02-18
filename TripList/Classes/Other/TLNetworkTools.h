//
//  TLNetworkTools.h
//  TripList
//
//  Created by Kangcl on 15/12/25.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLNetworkTools : NSObject

// GET 请求
+ (void)getWithUrl:(NSURL *)url completion:(void (^)(NSArray *))completion;

// 下载图片
+ (void)setImageView:(UIImageView *)imageView withUrlStr:(NSString *)str;

// 单例对象的初始化方法
+ (instancetype)shareNetworkTools;

@end
