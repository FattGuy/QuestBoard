//
//  CommonUtil.m
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil

+(SignUpState)isVaildEmail:(NSString *)email{
    if (email == nil || [email isEqual: @""]) {
        return EmptyEmail;
    }
    
    NSString *emailFormat = @"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailFormat];
    
    if ([emailTest evaluateWithObject:email]) {
        return Correct;
    }else{
        return WrongFormatEmail;
    }
}

+(UIImage*) imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
