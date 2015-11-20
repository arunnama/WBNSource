//
//  CatergoryCVLayout.h
//  WBNIOS
//
//  Created by Synergy on 24/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CatergoryCVLayout : UICollectionViewLayout


@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;
/**
 If specified, each section will have a border around it defined by these insets.
 Defaults to UIEdgeInsetsZero.
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;
/**
 How much space the layout should place between items on the same line.
 Defaults to 10.
 */
@property (nonatomic, assign) CGFloat interitemSpacing;
/**
 How much space the layout should place between lines.
 Defaults to 10.
 */
@property (nonatomic, assign) CGFloat lineSpacing;
/**
 How many items the layout should place on a single line.
 Defaults to 1.
 */
@property (nonatomic, assign) NSInteger numberOfItemsPerLine;
/**
 The ratio of every item's width to its height (regardless of scroll direction).
 Defaults to 1 (square).
 */
@property (nonatomic, assign) CGFloat aspectRatio;




@end
