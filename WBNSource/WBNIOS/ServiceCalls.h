//
//  ServiceCalls.h
//  WBNIOS
//
//  Created by Synergy on 1/11/15.
//  Copyright (c) 2015 ArunApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ServiceCalls : NSObject

@property (nonatomic, strong) NSMutableData *responseData;

-(NSMutableArray*) getCategoriesDataService;
@property (nonatomic, strong) NSMutableArray *myCategoriesList;





@end
