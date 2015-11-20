//
//  ViewController.m
//  WBNIOS
//
//  Created by Synergy on 22/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//


#import "ViewController.h"
#import "CategoryCell.h"
#import "applicationStubData.h"
#import "CatergoryCVLayout.h"
#import "OneCategoryItemsCollectionViewController.h"
#import "ServiceCalls.h"
#import "HTTPHelper.h"

#import "MBProgressHUD.h"


@implementation ViewController


-(void) loadData
{
    
    NSLog(@"Loading ALerts...");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString  *url =@"http://whatbestnow.com/service.php";
    
    
    [[HTTPHelper sharedObj] get:url completion:^(NSData *resp) {
        [MBProgressHUD hideHUDForView:self.view animated:TRUE];
        
        NSLog(@"Resp: %@",resp);
        id json =[[HTTPHelper sharedObj] convertJSONToObject:resp];
        
        NSDictionary *nsArray = [[NSDictionary alloc] initWithDictionary:json];
        NSLog(@"%@",nsArray);
        _categoriesList = [nsArray valueForKey:@"categories"];
        
        NSLog(@"Categories List is now  %@",_categoriesList);
        
        [self.collectionView reloadData];
        
            
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   /// Start
    //NSString * url =[[Properities sharedObj] helpmeURL];
    
    
   
    
    
    
    
    //End
    
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:@"Hello"];
    
    
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    // [_homePageNavigationBar setBackgroundColor:[UIColor redColor]];
    //[[self navigationController] setNavigationBarHidden:NO animated:NO];
    
 //   ServiceCalls *serviceCall = [[ServiceCalls alloc]init];
    
    // _categoriesList =  [serviceCall getCategoriesDataService];
    
    
    _categoriesList =  [applicationStubData getCategoriesList];
     [self loadData];
    
    self.layout.numberOfItemsPerLine = 2;
    self.layout.aspectRatio = 1;
    self.layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.layout.interitemSpacing = 5;
    self.layout.lineSpacing = 5;
    
    
    UIColor *headerColor = [UIColor colorWithRed:1.00 green:0.72 blue:0.0 alpha:1.0];
    
    UIColor *blueColour = [UIColor colorWithRed:44.0f/255.0f green:62.0f/255.0f blue:80.0f/255.0f alpha:1.0f];
    
  //  UIColor *headerColor = [UIColor colorWithRed:1.0 green:0.85 blue:0.06 alpha:1.0];
    
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.navigationBar.barTintColor = headerColor;
    self.navigationController.toolbar.barTintColor = headerColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.scrollCoordinator = [[JDFPeekabooCoordinator alloc] init];
    self.scrollCoordinator.scrollView = self.collectionView;
    self.scrollCoordinator.topView = self.navigationController.navigationBar;
    self.scrollCoordinator.topViewMinimisedHeight = 20.0f;
    self.scrollCoordinator.bottomView = self.navigationController.toolbar;
    
    self.navigationItem.title = @"What Best Now!";
    
    
   /* NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],UITextAttributeTextColor,
                                               [UIColor whiteColor], UITextAttributeTextShadowColor,
                                               [NSValue valueWithUIOffset:UIOffsetMake(-1, 0)], UITextAttributeTextShadowOffset, nil];
    */
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:28], NSFontAttributeName,
                                [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
 //   [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    
    
    
    self.navigationController.navigationBar.titleTextAttributes = attributes;
    
   // [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [searchButton setImage:[UIImage imageNamed:@"searchIcon"] forState:UIControlStateNormal];
    searchButton.frame = CGRectMake(0.0f, 0.0f, 25.0f, 25.0f);
    
    //  UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    //  self.navigationItem.rightBarButtonItem = searchBarButton;
    
    
    // UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:_searchBar];
    // self.navigationItem.rightBarButtonItem = searchBarItem;
    
    
    //[self.navigationController setNavigationBarHidden: YES animated: NO];
    
    
    
    
    // self.navigationItem.rightBarButtonItem set
    
    
    
    
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
  [self.collectionView reloadData];
    
    
}


- (CatergoryCVLayout *)layout
{
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return (id)self.collectionView.collectionViewLayout;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.scrollCoordinator disable];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.scrollCoordinator enable];
}

#pragma mark - UICollectionView Datasource
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return [_categoriesList count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Hello cell");
    
    CategoryCell* newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Hello"forIndexPath:indexPath];
    //  CategoryCell* cell = (CategoryCell*) cv;
    
UIColor *color = [UIColor colorWithRed:1.00 green:0.8 blue:0.0 alpha:1.0];
    
   // UIColor *color = [UIColor colorWithRed:1.0 green:0.85 blue:0.06 alpha:1.0];
    

    
    newCell.backgroundColor = color;
    
    
   // [newCell setBackgroundColor:color];

    [newCell.lblArun setTextColor:[UIColor whiteColor]];
    //[newCell.lblArun setText:@"Sample"];
    
    NSDictionary *oneCategory  = [_categoriesList objectAtIndex:indexPath.row];
    
    NSLog(@"one Category is %@",oneCategory);
    
    NSString *categoryNameString =[oneCategory valueForKey:@"name"];
    
    /*
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){CELL_CONTENT_WIDTH, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
     */
 //   CGSize size = rect.size;
    
  //  CGSize itemSize = [newCell [indexPath.item] size];
    
  //  int top = itemSize.height - 40;
  //  int width = itemSize.width;
    
  //  [newCell.lblArun initWithFrame:CGRectMake(0, top, width, 40)];

    
    
    [newCell.lblArun setText:categoryNameString];
    newCell.layer.borderWidth=2.0f;
    
    newCell.layer.borderColor=[UIColor whiteColor].CGColor;

    newCell.lblArun.textAlignment=NSTextAlignmentCenter;
    
   
    
    
    return newCell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Hello didSelectItemAtIndexPath");
    
    
    //  self.oneCategoryList = [[OneCategoryItemsCollectionViewController alloc] init];
    
    // self..objIdLabel.text = [[self.objArray objectAtIndex:indexPath.row] objId];
    
    OneCategoryItemsCollectionViewController* destViewController = [[OneCategoryItemsCollectionViewController alloc] init];
    
    
    // [self.navigationController pushViewController:viewController animated:YES];
    
   // NSIndexPath *selectedIndexPath = [self.collectionView indexPathForSelectedRow];
    NSDictionary *distSelecteCategory = _categoriesList[indexPath.row];
    
    
    //[[segue destViewController]: setHeaderData:distSelecteCategory];
   self.selectedItemIndex = indexPath.row;
    
    [self performSegueWithIdentifier:@"goToOneCategory" sender:distSelecteCategory];
    
    
    
    
    NSLog(@"End of navigation Controller");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    if ([[segue identifier] isEqualToString:@"goToOneCategory"]) {

    
    
    NSDictionary* selectedItem = [_categoriesList objectAtIndex:self.selectedItemIndex ];
    
    
    OneCategoryItemsCollectionViewController* destViewController = [[OneCategoryItemsCollectionViewController alloc] init];
    
    OneCategoryItemsCollectionViewController *destController = [segue destinationViewController];
   
    [destController setHeaderData:selectedItem];
    
    }

    
    
    
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        }
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        label.text=[NSString stringWithFormat:@"Recipe Group #%li", indexPath.section + 1];
        [reusableview addSubview:label];
        return reusableview;
    }
    return nil;
}



- (IBAction)tapped:(UITapGestureRecognizer *)gesture {
    
    CGPoint tapLocation = [gesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        
        
        //
        
        //        self.pamphlet = [pamphlet_Array objectAtIndex:indexPath.item]
        
        //        NSLog(@"Selected pamphlet: %@", self.pamphlet);
        
        [self performSegueWithIdentifier:@"goToOneCategory" sender:self];
        
    }
}


/*

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:


(id)sender {
    
    
    NSLog(@"Hello Segueee");
    if ([segue.identifier isEqualToString:@"showPhotoAlbum"]) {
        NSLog(@"Prepare for Segue to load Specific Photo Album");
        NSLog(@"User Selected this cell or the name of the title in the cell which comes from a NSDictionary =>");
        
        
        self.navigationItem.backBarButtonItem.title = @"Back";
        // EXAMPLE NSLOG TO SHOW =>  User Selected - Album Name
        // Where album name is actually the album name grabbed form the server based on the selected row
    }
}

*/










@end
