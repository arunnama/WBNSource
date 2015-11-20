//
//  CategoryCell.h
//  WBNIOS
//
//  Created by Synergy on 22/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCell : UICollectionViewCell

//@property (weak, nonatomic) IBOutlet UILabel *lblName;
- (void)setNumber:(NSString*)number;

@property (strong, nonatomic) IBOutlet UILabel *lblArun;

@end
