//
//  KingdomDetailClient.m
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomDetailClient.h"
#import "CommonUtil.h"

@implementation KingdomDetailClient

+(void)getKingdomDetailList:(NSNumber *)kid withSuccess:(Success)success{
    NSString *Url = [HOST stringByAppendingString:KINGDOMS_API];
    
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    
//    if (kid) {
//        [params setObject:kid forKey:@"id"];
//        
//    }
    // Create the third API for last view
    NSString *KINGDOMDETAIL_API = [NSString stringWithFormat:@"/%@",kid];
    NSString *detailURL = [Url stringByAppendingString:KINGDOMDETAIL_API];
    
    [[BaseHttpRequest sharedInstance] GET:detailURL parameters:kid withResponse:^(id _Nullable response) {
        success(response);
    }];
}

@end
