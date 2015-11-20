//
//  OneCategoryItemsCollectionViewController.h
//  WBNIOS
//
//  Created by Synergy on 24/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDFPeekabooCoordinator.h";

@interface OneCategoryItemsCollectionViewController : UICollectionViewController<UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate>


 @property (nonatomic,strong)NSMutableArray *oneCategoryList;


-(void)setHeaderData: (NSDictionary*)selectedCategory;
@property (assign, readwrite) NSInteger selectedItemIndex;
@property (nonatomic, strong) JDFPeekabooCoordinator *scrollCoordinator;



@end
