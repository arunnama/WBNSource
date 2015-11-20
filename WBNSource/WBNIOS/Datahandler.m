//
//  Datahandler.m
//  Ckure
//
//  Created by KH1386 on 3/11/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import "Datahandler.h"

#define HELPME_EVENT_KEY @"HELPME_EVENT_KEY"
#define REPORT_EVENT_KEY @"REPORT_EVENT_KEY"
#define CURRENT_USER @"CURRENT_USER"
#define CURRENT_USER_ROLE @"CURRENT_USER_ROLE"
#define PUSH_REGISTRATION_ID @"PUSH_REGISTRATION_ID"
#define COOKIE_ID @"COOKIE_ID"

#define BUY_ITEM_KEY @"BUY_ITEM_KEY"

@implementation Datahandler

-(id) init{
    self =[super init];
    viewControllerList =[[NSMutableArray alloc] init];
    return self;
}
+(id) sharedObj
{
    static Datahandler *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[Datahandler alloc] init];
    });
    return sharedMyManager;
}
-(void) prepareReportEventObj:(NSDictionary*)dict
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSDictionary * obj = [defaults objectForKey:REPORT_EVENT_KEY];
    NSMutableDictionary *finalDict =[[NSMutableDictionary alloc] init];
    if(obj)
        [finalDict addEntriesFromDictionary:obj];
    
    [finalDict addEntriesFromDictionary:dict];
    [defaults setObject:finalDict forKey:REPORT_EVENT_KEY];
    [defaults synchronize];
}
-(void) prepareHelpMeEventObj:(NSDictionary*)dict
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSDictionary * obj = [defaults objectForKey:HELPME_EVENT_KEY];
    NSMutableDictionary *finalDict =[[NSMutableDictionary alloc] init];
    if(obj)
        [finalDict addEntriesFromDictionary:obj];
    
    [finalDict addEntriesFromDictionary:dict];
    [defaults setObject:finalDict forKey:HELPME_EVENT_KEY];
    [defaults synchronize];
}

-(NSDictionary*) getReportEventObj
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:REPORT_EVENT_KEY];
}
-(NSDictionary*) getBuyItemObj
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:BUY_ITEM_KEY];
}
-(void) prepareBuyItemObj:(NSDictionary*)dict
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSDictionary * obj = [defaults objectForKey:BUY_ITEM_KEY];
    NSMutableDictionary *finalDict =[[NSMutableDictionary alloc] init];
    if(obj)
        [finalDict addEntriesFromDictionary:obj];
    
    [finalDict addEntriesFromDictionary:dict];
    [defaults setObject:finalDict forKey:BUY_ITEM_KEY];
    [defaults synchronize];
}



-(NSDictionary*) getHelpmeObj
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:HELPME_EVENT_KEY];
}

-(void) setCurrentUser:(NSString*) user
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:user forKey:CURRENT_USER];
    [defaults synchronize];
}
-(NSString*) getCurrentUser
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:CURRENT_USER];
}
-(void) setCurrentUserRole:(NSString*) userRole
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:userRole forKey:CURRENT_USER_ROLE];
    [defaults synchronize];
}
-(NSString*) getCurrentUserRole
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:CURRENT_USER_ROLE];

}

-(NSString*) getPushRegistrationId
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:PUSH_REGISTRATION_ID];
}

-(void) setPushRegistrationId:(NSString*) identifier
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:identifier forKey:PUSH_REGISTRATION_ID];
    [defaults synchronize];
}
-(void) setCookieValue:(NSString * )cookie;
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:cookie forKey:COOKIE_ID];
    [defaults synchronize];

}
-(NSString * )getCookieValue
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:COOKIE_ID];
}

-(void) pushView:(UIViewController *) vc
{
    [viewControllerList addObject:vc];
}
-(UIViewController *) popView
{
    id obj =[viewControllerList lastObject];
    if(obj)
    {
        [viewControllerList removeLastObject];
    return obj;
    }
    return nil;
}
@end
