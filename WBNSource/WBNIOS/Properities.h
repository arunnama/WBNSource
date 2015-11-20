//
//  Properities.h
//  Ckure
//
//  Created by KH1386 on 3/6/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Properities : NSObject
{
    NSDictionary * props;
}
+(id) sharedObj;
-(NSString*) getViewAlertsSPURL;

-(NSString*) getReportEventURL;
-(NSString*) getViewAlertsURL;
-(NSString*) getSignUpURL;
-(NSString*) getLoginURL;
-(NSString*) forgotPassURL;
-(NSString*) changePasswordURL;
-(NSString*) reportAccidentURL;
-(NSString*) standardMotoristURL;
-(NSString*) logoutULRL;
-(NSString*) helpmeURL;
-(NSString*) payViewURL;
-(NSString*) updatePayamentStatusURL;
-(NSString*) helpmeAgainURL;
-(NSString*) helpMeClose;
-(NSString*) sendFeedbackURL;
-(NSString*) getHelpRequestsURL;

@end
