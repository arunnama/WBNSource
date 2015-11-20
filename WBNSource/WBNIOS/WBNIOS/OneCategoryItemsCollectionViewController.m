//
//  OneCategoryItemsCollectionViewController.m
//  WBNIOS
//
//  Created by Synergy on 24/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import "applicationStubData.h"
#import "OneCategoryItemsCollectionViewController.h"
#import "OneCategoryCell.h";
#import "HTTPHelper.h";
#import "DetailVeiwController.h";

@interface OneCategoryItemsCollectionViewController ()

@end

@implementation OneCategoryItemsCollectionViewController

static NSString * const reuseIdentifier = @"oneCatCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hello View controller of Category List");
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
  //  // Register cell classes
  //  [self.collectionView registerClass:[OneCategoryCell class] forCellWithReuseIdentifier:@"oneCatCell"];
    
   // _oneCategoryList =  [applicationStubData getListOfSelectedCategory:@"Cars"];
    
    
    
  //  [self.collectionView registerClass:[OneCategoryCell class] forCellWithReuseIdentifier:@"arun"];
    
    
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
        self.view.backgroundColor = [UIColor clearColor];
    
    self.navigationController.toolbarHidden = NO;
   // self.navigationController.navigationBar.barTintColor = headerColor;
    //self.navigationController.toolbar.barTintColor = blueColour;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.scrollCoordinator = [[JDFPeekabooCoordinator alloc] init];
    self.scrollCoordinator.scrollView = self.collectionView;
    self.scrollCoordinator.topView = self.navigationController.navigationBar;
    self.scrollCoordinator.topViewMinimisedHeight = 20.0f;
    self.scrollCoordinator.bottomView = self.navigationController.toolbar;

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"Hello Number of sections");
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return [_oneCategoryList count];
   // return 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    OneCategoryCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
   // [cell.backgroundColor [UIColor *brownColor]];
    
     cell.backgroundColor = [UIColor whiteColor];
    
    
    NSDictionary *categoryName  = [_oneCategoryList objectAtIndex:indexPath.row];
    NSString *categoryNameString =[categoryName valueForKey:@"name"];
    
    NSString *categoryDesc =[categoryName valueForKey:@"descValue2"];
    
    
    
    [cell.oneCategoryName setTextColor:[UIColor blackColor]];
    [cell.oneCategoryName setText:categoryNameString];
    [cell.oneCategoryDesc setText:categoryDesc];

   // [cell.oneCategoryDesc setText:@"Hello Desc"];
    [cell.oneCategoryDesc setBackgroundColor:[UIColor whiteColor]];
    
    
    UIImage *image;
    
    if ([indexPath row] % 2)
        image = [UIImage imageNamed:@"car2.jpeg"];
    else
        image = [UIImage imageNamed:@"car3.jpeg"];
    
    cell.oneCategoryImage.image = image;
    
   
    
    
    return cell;
}

-(void)setHeaderData: (NSDictionary*)selectedCategory{
    
    
    NSLog(@"Calling the Set Header data");
    NSString *title = [[NSString alloc]initWithString:[selectedCategory valueForKey:@"name"]];
    
     NSString *selectedCategory_id = [[NSString alloc]initWithString:[selectedCategory valueForKey:@"name"]];
    self.navigationItem.title = title;
    
    [self loadEachCategory : selectedCategory_id ];
    
    
    
}

-(void)loadEachCategory:(NSString*)categoryId{
    
    
    
    NSLog(@"Loading ALerts...");
   
    
    NSString  *url =@"http://whatbestnow.com/onecat.php?catid=1";
    
    
    [[HTTPHelper sharedObj] get:url completion:^(NSData *resp) {
      //  [MBProgressHUD hideHUDForView:self.view animated:TRUE];
        
        NSLog(@"Resp: %@",resp);
        id json =[[HTTPHelper sharedObj] convertJSONToObject:resp];
        
        NSDictionary *nsArray = [[NSDictionary alloc] initWithDictionary:json];
        NSLog(@"%@",nsArray);
        _oneCategoryList = [nsArray valueForKey:@"category"];
        
        NSLog(@"Categories List is now  %@",_oneCategoryList);
        
        [self.collectionView reloadData];
        
        
    }];

    
    
    
    
    
    
    
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"One  Category Selected row %d",indexPath.row);
    
    _selectedItemIndex = indexPath.row;

    
    NSDictionary *distSelecteCategory = _oneCategoryList[indexPath.row];
        //[[segue destViewController]: setHeaderData:distSelecteCategory];
    
  //  [self performSegueWithIdentifier:@"detailspage" sender:distSelecteCategory];
    NSLog(@"End of navigation Controller");
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"Calling the segui for Details");
    
    
    if ([[segue identifier] isEqualToString:@"detailspage"]) {
        
        
        NSArray *array = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *indexPathImInterestedIn = [array firstObject];
        
        _selectedItemIndex =  indexPathImInterestedIn.row;
        
                             NSLog(@"Selected Item index is  insegui is %ld",(long)_selectedItemIndex);
        
        NSDictionary* selectedItem = [_oneCategoryList objectAtIndex:_selectedItemIndex];
        
        NSLog(@"Selected Item is %@",selectedItem);
       // DetailVeiwController* destViewController = [[DetailVeiwController alloc] init];
        
        DetailVeiwController *destController = [segue destinationViewController];
        
        [destController setData:selectedItem];
        
    }
    
    
    
    
}


@end
