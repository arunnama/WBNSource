//
//  ViewController.h
//  WBNIOS
//
//  Created by Synergy on 22/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneCategoryItemsCollectionViewController.h"
#import "JDFPeekabooCoordinator.h"

@interface ViewController : UICollectionViewController <UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

    @property (nonatomic, strong)  OneCategoryItemsCollectionViewController *oneCategoryList;
   @property (nonatomic,strong)NSMutableArray *categoriesList;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (assign, readwrite) NSInteger selectedItemIndex;

@property (nonatomic, strong) JDFPeekabooCoordinator *scrollCoordinator;

@property (strong, nonatomic) IBOutlet UINavigationBar *homePageNavigationBar;

- (IBAction)tapped:(UITapGestureRecognizer *)gesture;




@end

