//
//  ServiceCalls.m
//  WBNIOS
//
//  Created by Synergy on 1/11/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import "ServiceCalls.h"

@implementation ServiceCalls




-(NSMutableArray*) getCategoriesDataService{
    
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/service.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             
             
             NSLog(@"result is %@",result);
             
             
              NSMutableArray *categoriesArray = [result objectForKey:@"categories"];
             NSLog(@"Categories is %@",categoriesArray);
             
             
             self.myCategoriesList =categoriesArray;
             
             
            // self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
            // self.greetingContent.text = [greeting objectForKey:@"content"];
         }
     }];
    
    
    
    return self.myCategoriesList;
    
}












@end
