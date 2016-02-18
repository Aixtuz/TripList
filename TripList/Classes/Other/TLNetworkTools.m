//
//  TLNetworkTools.m
//  TripList
//
//  Created by Kangcl on 15/12/25.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "NSString+Path.h"
#import "NSString+md5.h"
#import "TLNetworkTools.h"

@implementation TLNetworkTools

// GET 请求
+ (void)getWithUrl:(NSURL *)url completion:(void (^)(NSArray *))completion
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // 解析数据(JSON -> Array)
        if (data) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            // 判断数组是否有数据
            if (array.count) {
                // 执行 block;
                completion(array);
            }
            else {
                NSLog(@"无数据...");
            }
        }
        else {
            NSLog(@"%@", error);
        }
    }];
    [task resume];
}

// 下载图片
+ (void)setImageView:(UIImageView *)imageView withUrlStr:(NSString *)urlStr
{
    // 拼接路径 + App 文件夹 + 文件名
    NSString *fileName = [urlStr md5];
    NSString *path = [fileName fileNameToPath];
    // 无缓存则下载
    if (![UIImage imageWithContentsOfFile:path]) {
#warning TODO 一大堆图片在下载，下载顺序如何，图片很可能出现不匹配的情况
        
#warning TODO 图片还不能下载
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDownloadTask *task = [session downloadTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            // 缓存 --> path
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr moveItemAtPath:location.path toPath:path error:nil];
            // 主线程更新 UI
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = [UIImage imageWithContentsOfFile:path];
            });
        }];
        [task resume];
    } else {
        // 有缓存直接加载
        imageView.image = [UIImage imageWithContentsOfFile:path];
    }
    
}

// 单例对象的初始化方法
+ (instancetype)shareNetworkTools
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
