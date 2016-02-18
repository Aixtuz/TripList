//
//  TripListController.m
//  TripList
//
//  Created by Kangcl on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "TLNetworkTools.h"
#import "TripList.h"
#import "TripListCell.h"
#import "TripListController.h"

@interface TripListController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *urlStr;          // 请求地址(用于获取清单数据)
@property (strong, nonatomic) NSMutableArray *tripLists; // 清单模型数组

@end


@implementation TripListController

///--------------------------------------
#pragma mark - life cycle
///--------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 注册 Cell
    [self.tableView registerNib:[TripListCell nib] forCellReuseIdentifier:kTripListCellID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

///--------------------------------------
#pragma mark - setup & configuration
///--------------------------------------

#warning TODO 比较简单的注释就不用写了，注释一般用于解释为什么这么做

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.tripLists.count;
}

// 自定义 cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TripListCell *cell = [tableView dequeueReusableCellWithIdentifier:kTripListCellID forIndexPath:indexPath];
    // 设置 cell
    [cell configCellWithModel:self.tripLists[indexPath.row]];
    return cell;
}

//!!!: 懒加载模型数组, 改用网络数据时, 修改此方法;
- (NSMutableArray *)tripLists
{
    if (_tripLists == nil) {
        // plist -> dictArray -> modelArray
        NSMutableArray *modelArray = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TripList" ofType:@"plist"];
        NSArray *dictArray = [[NSArray alloc] initWithContentsOfFile:path];
        for (NSDictionary *dict in dictArray) {
            TripList *tripList = [[TripList alloc] initWithDict:dict];
            [modelArray addObject:tripList];
        }
        _tripLists = modelArray;
    }
    return _tripLists;
}

///--------------------------------------
#pragma mark - update views
///--------------------------------------

// 设置每行可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 清单删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tripLists removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
    }
    else {
        NSLog(@"Unhandled editing style! %lu", editingStyle);
    }
}

///--------------------------------------
#pragma mark - event response
///--------------------------------------

// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第 %ld 个 cell", (long)indexPath.row);
    //TODO: 点击弹出"事件列表"
}

///--------------------------------------
#pragma mark - getters and setters
///--------------------------------------

// urlStr 的 Setter 方法
- (void)setUrlStr:(NSString *)urlStr
{
    // 赋值属性
    _urlStr = urlStr;

    // GET -> dictArray -> modelArray
    NSMutableArray *modelArray = [NSMutableArray array];
    NSURL *url = [NSURL URLWithString:urlStr];
    [TLNetworkTools getWithUrl:url completion:^(NSArray *array) {
        for (NSDictionary *dict in array) {
            TripList *tripList = [[TripList alloc] initWithDict:dict];
            [modelArray addObject:tripList];
        }
    }];
    self.tripLists = modelArray;
}

@end
