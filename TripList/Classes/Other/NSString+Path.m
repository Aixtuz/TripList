//
//  NSString+Path.m
//  TripList
//
//  Created by Kangcl on 15/12/25.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

// 文件路径
- (NSString *)fileNameToPath
{
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [dict objectForKey:@"CFBundleIdentifier"];
    NSString *folder = [cache stringByAppendingPathComponent:appName];
    return [folder stringByAppendingPathComponent:self];
}

@end
