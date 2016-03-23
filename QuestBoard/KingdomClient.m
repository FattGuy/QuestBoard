//
//  KingdomClient.m
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomClient.h"
#import "CommonUtil.h"

@implementation KingdomClient

+(void)getKingdomList:(Success)success{
    NSString *Url = [HOST stringByAppendingString:KINGDOMS_API];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [[BaseHttpRequest sharedInstance] GET:Url parameters:params withResponse:^(id _Nullable response) {
        success(response);
    }];
}

@end