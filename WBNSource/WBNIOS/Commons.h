//
//  Commons.h
//  Ckure
//
//  Created by KH1386 on 3/18/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Commons : NSObject
+(void) showMessage:(NSString*)title :(NSString*)message;
+(void) setCustomFont:(UIView *) view;
+(void) setFont:(UIView *) view :(UIFont*) font;
+(UIColor *) getButtonColor;
+(void) setUnderlineText:(UIButton *)button;
+ (BOOL)validateEmailWithString:(NSString*)email;
+(BOOL) validateMobileNumber:(NSString*)mobile;
+(void) setScreen:(UIView *)view superView:(UIView*) superView;

+(BOOL) checkViewControllerExists:(UIViewController*)controller in:(UINavigationController*)navController;
+(NSString *) getImageName:(NSString *)subcategory;
@end
