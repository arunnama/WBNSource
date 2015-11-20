//
//  DetailVeiwController.h
//  WBNIOS
//
//  Created by Synergy on 27/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailVeiwController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;
@property (weak, nonatomic) IBOutlet UITextView *desc;


-(void)setData:(NSDictionary*)selectedItem;


@end
