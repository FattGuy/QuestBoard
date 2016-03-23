//
//  SignUpClient.m
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "SignUpClient.h"

@implementation SignUpClient

+(void)signUp:(User *)user withSuccess:(Success)success{
    
    NSString *Url = [HOST stringByAppendingString:SIGN_UP_API];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    if (user) {
        [params setObject:user.email forKey:@"email"];
        [params setObject:user.name forKey:@"name"];
    }
    
    [[BaseHttpRequest sharedInstance] POST:Url parameters:params withResponse:^(id _Nullable response) {
        success(response);
    }];
}

@end