//
//  Commons.m
//  Ckure
//
//  Created by KH1386 on 3/18/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import "Commons.h"
#import  <UIKit/UIKit.h>

#import "Datahandler.h"
@implementation Commons

+(void) showMessage:(NSString*)title :(NSString*)message
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];

}
+(void) setFont:(UIView *) view :(UIFont*) font
{
    for(UIView * subView in view.subviews)
    {
        if([subView isKindOfClass:[UILabel class]])
        {
            UILabel * label =(UILabel*)subView;
            label.font =font;
        }
        else if([subView isKindOfClass:[UITextField class]])
        {
            UITextField * textField =(UITextField*)subView;
            textField.font =font;
        }
        else if([subView isKindOfClass:[UIButton class]])
        {
            UIButton * button =(UIButton*)subView;
            button.titleLabel.font = font;
        }
        else if([subView isKindOfClass:[UIView class]])
        {
            [Commons setCustomFont:subView];
        }
    }
}

+(void) setCustomFont:(UIView *) view
{
   // [Commons setFont:view : [[UIViewController *mycontroller] customFont]];
}
+(UIColor *) getButtonColor
{
    return  [UIColor colorWithRed:73/255.0 green:148/255.0 blue:205/255.0 alpha:1.0];
}
+(void) setUnderlineText:(UIButton *)button
{
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    UIColor* textColor = button.titleLabel.textColor;
    [commentString setAttributes:@{NSForegroundColorAttributeName:textColor,NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0,[commentString length])];
    // Or for adding Colored text use----------
    
    [button setAttributedTitle:commentString forState:UIControlStateNormal];
    [button setAttributedTitle:commentString forState:UIControlStateHighlighted];
    
}

+ (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+(BOOL) validateMobileNumber:(NSString*)mobile
{
    if(mobile.length == 0) return FALSE;
    
    
    NSCharacterSet *charcter =[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered;
    filtered = [[mobile componentsSeparatedByCharactersInSet:charcter] componentsJoinedByString:@""];
    return [mobile isEqualToString:filtered];
}

+(void) setScreen:(UIView *)newView superView:(UIView*) superView
{
    
    for(UIView * view in superView.subviews)
    {
        [view removeFromSuperview];
    }
    [superView addSubview:newView];
}
+(BOOL) checkViewControllerExists:(UIViewController*)controller in:(UINavigationController*)navController
{
    for (UIViewController *vc in navController.viewControllers) {
        if ([vc isKindOfClass:[controller class]]) {
            return  TRUE;
        }
    }
    return  FALSE;
}

+(NSString *) getImageName:(NSString *)subcategory
{
    NSString * imageName =@"carlignt";
    if([subcategory isEqualToString:@"THIRD_PARTY_STRANDED_MOTORIST"])
    {
        imageName = @"stranded_motorist";
    }
    else if([subcategory isEqualToString:@"THIRD_PARTY_ACCIDENT"])
    {
        imageName = @"accident_icon";
    }
    else if([subcategory isEqualToString:@"CAR_HEAD_LIGHT"])
    {
        imageName = @"broken_headlight";
    }
    else if([subcategory isEqualToString:@"CAR_TAIL_LIGHT"])
    {
        imageName = @"broken_taillamp";
    }
    else if([subcategory isEqualToString:@"CAR_BLINKERS"])
    {
        imageName = @"blinkers";
    }
    else if([subcategory isEqualToString:@"CAR_OTHERS"])
    {
        imageName = @"towing";
    }
    
    else if([subcategory isEqualToString:@"TOWING"])
    {
        imageName = @"towing";
    }
    else if([subcategory isEqualToString:@"BOOST"])
    {
        imageName = @"boost";
    }
    else if([subcategory isEqualToString:@"FLAT_TIRE"])
    {
        imageName = @"flattire";
    }
    else if([subcategory isEqualToString:@"LOCKOUT"])
    {
        imageName = @"lock";
    }
    else if([subcategory isEqualToString:@"GAS_FILL_UP"])
    {
        imageName = @"gasfill";
    }
    
    else if([subcategory isEqualToString:@"HAZARD_ACCIDENT"])
    {
        imageName = @"accident_icon";
    }
    else if([subcategory isEqualToString:@"HAZARD_POLICE"])
    {
        imageName = @"policecheck";
    }
    else if([subcategory isEqualToString:@"HAZARD_DEBRI"])
    {
        imageName = @"debri";
    }
    else if([subcategory isEqualToString:@"HAZARD_OTHERS"])
    {
        imageName = @"others";
    }
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES && [[UIScreen mainScreen] scale] == 2.00) {
        imageName = [imageName stringByAppendingString:@"@2x"];
    }

    return  imageName;
}
@end
