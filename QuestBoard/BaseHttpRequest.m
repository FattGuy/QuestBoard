//
//  BaseHttpRequest.m
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@implementation BaseHttpRequest{
    
    AFHTTPRequestOperationManager * requestManager;
    
}

static BaseHttpRequest *sharedInstance = nil;
+(BaseHttpRequest *)sharedInstance{
    @synchronized(self) {
        if(sharedInstance == nil) {
            sharedInstance = [[[self class] alloc] init]; //   assignment   not   done   here
        }
    }
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        requestManager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}

-(void)GET:(nonnull NSString *)url parameters:(id)parameters withResponse:(nullable Response)response{
    
    [requestManager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        response(responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        [self failureOperation];
    }];
}

-(void)POST:(nonnull NSString *)url parameters:(nullable id)parameters withResponse:(nonnull Response)response{
    
    [requestManager POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        response(responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        [self failureOperation];
    }];
}

-(void)failureOperation{
    [SVProgressHUD showInfoWithStatus:@"Request Error"];
}

@end
