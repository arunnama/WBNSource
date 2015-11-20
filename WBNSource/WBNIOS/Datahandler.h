//
//  Datahandler.h
//  Ckure
//
//  Created by KH1386 on 3/11/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface Datahandler : NSObject
{
    NSMutableArray * viewControllerList;
}
+(id) sharedObj;
-(void) prepareHelpMeEventObj:(NSDictionary*)dict;
-(void) prepareReportEventObj:(NSDictionary*)dict;
-(NSDictionary*) getReportEventObj;
-(NSDictionary*) getHelpmeObj;
-(void) setCurrentUser:(NSString*) user;
-(NSString*) getCurrentUser;
-(void) setCurrentUserRole:(NSString*) user;
-(NSString*) getCurrentUserRole;
-(NSString*) getPushRegistrationId;
-(void) setPushRegistrationId:(NSString*) identifier;
-(void) pushView:(UIViewController *) vc;
-(void) setCookieValue:(NSString * )cookie;
-(NSString * )getCookieValue;

-(NSDictionary*) getBuyItemObj;
-(void) prepareBuyItemObj:(NSDictionary*)dict;

-(UIViewController *) popView;
//-(NSDictionary*) getEventDetailsObj;


@end
