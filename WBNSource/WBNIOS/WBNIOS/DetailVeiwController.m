//
//  DetailVeiwController.m
//  WBNIOS
//
//  Created by Synergy on 27/10/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import "DetailVeiwController.h"
#import "applicationStubData.h"
#import "HTTPHelper.h"

@interface DetailVeiwController ()

@end

@implementation DetailVeiwController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self setData];
    
    
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


-(void)setData:(NSDictionary*) selectedItem{
    
    
    NSString *selectedItemName = [selectedItem valueForKey:@"name"];
    [self setHeaderData:selectedItemName];
    
    NSLog(@"Loading ALerts...");
    
    
    NSString  *url =@"http://whatbestnow.com/details.php?item_id=1";
    
    
    [[HTTPHelper sharedObj] get:url completion:^(NSData *resp) {
        //  [MBProgressHUD hideHUDForView:self.view animated:TRUE];
        
        
        NSLog(@"Resp: %@",resp);
        id json =[[HTTPHelper sharedObj] convertJSONToObject:resp];
        
        NSDictionary *nsArray = [[NSDictionary alloc] initWithDictionary:json];
        NSLog(@"%@",nsArray);
        NSArray *arrayResp = [nsArray valueForKey:@"details"];
        NSDictionary *respDict = [arrayResp objectAtIndex:0];
         NSString *desc = [respDict valueForKey:@"detailValue2"];
        NSLog(@"Description for the item is%@",desc);
        
        NSDictionary *descDictionary =  [applicationStubData getItemDescription:@"cars"];
        [_desc setText:desc];
        UIImage *image;
        image = [UIImage imageNamed:@"car2.jpeg"];
        [_detailImage setImage:image];

        
        
    }];
    

    
}



-(void)setHeaderData: (NSString*)selectedItemName{
    
    
    NSLog(@"Details : Calling the Set Header data%@",selectedItemName);
   // NSString *title = [[NSString alloc]initWithString:[selectedCategory valueForKey:@"name"]];
    
 //   NSString *selectedCategory_id = [[NSString alloc]initWithString:[selectedCategory valueForKey:@"name"]];
    self.navigationItem.title = selectedItemName;
    
   // [self loadEachCategory : selectedCategory_id ];
    
    
    
}



@end
