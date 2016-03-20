//
//  BaseHttpRequest.h
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIInterface.h"

@interface BaseHttpRequest : NSObject

typedef void (^Response)(_Nullable id);

+(nonnull BaseHttpRequest *)sharedInstance;

-(void)GET:(nonnull NSString *)url parameters:(nullable id)parameters withResponse:(nullable Response)response;

-(void)POST:(nonnull NSString *)url parameters:(nullable id)parameters withResponse:(nonnull Response)response;

@end
