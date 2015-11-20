//
//  OneCategoryCell.h
//  WBNIOS
//
//  Created by Synergy on 26/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneCategoryCell : UICollectionViewCell
@property (strong
, nonatomic) IBOutlet UIImageView *oneCategoryImage;
@property (strong, nonatomic) IBOutlet UILabel *oneCategoryName;
@property (strong, nonatomic) IBOutlet UITextView *oneCategoryDesc;

@end
