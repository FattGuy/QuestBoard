//
//  UserDefaultsUtil.m
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "UserDefaultsUtil.h"

@implementation UserDefaultsUtil

+(void)saveEmail:(NSString *)email{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setValue:email forKey:@"USER_EMAIL"];
    [userDefaults synchronize];
}

+(NSString *)getEmail{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults valueForKey:@"USER_EMAIL"];
}

@end
