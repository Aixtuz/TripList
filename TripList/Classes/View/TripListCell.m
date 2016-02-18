//
//  TripListCell.m
//  TripList
//
//  Created by Aixtuz Kang on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "TLNetworkTools.h"
#import "TripListCell.h"

NSString *const kTripListCellID = @"TripListCell";

@interface TripListCell ()

// 图片
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 地点
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;

@end


@implementation TripListCell

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#warning TODO 大部分情况下setter方法尽量少用，特别此处给cell的数据赋值，有可能有时候属性改了，但是忘记改setter方法
- (void)configCellWithModel:(TripList *)tripList
{
    [TLNetworkTools setImageView:self.iconView withUrlStr:tripList.imageUrl];
    self.titleLabel.text = tripList.title;
    self.destinationLabel.text = tripList.destination;
}

+ (UINib *)nib
{
    // If the bundle parameter is nil, the main bundle is used.
    return [UINib nibWithNibName:kTripListCellID bundle:nil];
}

@end
