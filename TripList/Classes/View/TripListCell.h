//
//  TripListCell.h
//  TripList
//
//  Created by Aixtuz Kang on 15/12/24.
//  Copyright © 2015年 Kangcl. All rights reserved.
//

#import "TripList.h"
#import <UIKit/UIKit.h>

extern NSString *const kTripListCellID; 

@interface TripListCell : UITableViewCell

@property (nonatomic, strong) TripList *tripList;

+ (UINib *)nib;
- (void)configCellWithModel:(TripList *)tripList;

@end
