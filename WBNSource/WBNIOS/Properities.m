//
//  Properities.m
//  Ckure
//
//  Created by KH1386 on 3/6/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import "Properities.h"

@implementation Properities

+(id) sharedObj
{
    static Properities *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[Properities alloc] init];
    });
    return sharedMyManager;
}

-(id) init
{
    if(self =[super init])
    {
        NSBundle* bundle = [NSBundle mainBundle];
        NSString* propPath = [bundle pathForResource:@"prop" ofType:@"plist"];
        props = [NSDictionary dictionaryWithContentsOfFile:propPath];
    }
    return self;
}
-(NSString*) getReportEventURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"REPORT_EVENT_URL"];
    return url;
}
-(NSString*) getViewAlertsSPURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"VIEW_EVENT_SP_URL"];
    return url;
}
-(NSString*) getViewAlertsURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"VIEW_EVENT_URL"];
    return url;
}
-(NSString*) getSignUpURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"SIGNUP_URL"];
    return url;
}
-(NSString*) getLoginURL
{

        NSString * url =nil;
        if(props)
            url =[props objectForKey:@"LOGIN_URL"];
        return url;
}
-(NSString*) forgotPassURL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"FORGOT_PASSWORD_URL"];
    return url;
}
-(NSString*) changePasswordURL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"CHANGE_PASSWORD_URL"];
    return url;
}
-(NSString*) reportAccidentURL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"REPORT_ACCIDENT_URL"];
    return url;
}
-(NSString*) standardMotoristURL    
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"STANDARD_MOTORIST_URL"];
    return url;
}
-(NSString*) logoutULRL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"LOGOUT_URL"];
    return url;
}
-(NSString*) helpmeURL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"HELP_ME_URL"];
    return url;
}
-(NSString*) payViewURL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"PAY_TO_VIEW_URL"];
    return url;
}
-(NSString*) updatePayamentStatusURL
{
    
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"UPDATE_PAYMENT_URL"];
    return url;
}

-(NSString*) helpmeAgainURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"HELP_ME_AGAIN_URL"];
    return url;
    
}
-(NSString*) helpMeClose
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"HELP_ME_CLOSE_URL"];
    return url;
    
}
-(NSString*) sendFeedbackURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"SEND_FEED_BACK_URL"];
    return url;
    
}
-(NSString*) getHelpRequestsURL
{
    NSString * url =nil;
    if(props)
        url =[props objectForKey:@"HELP_REQUESTS_URL"];
    return url;
    
}
@end
