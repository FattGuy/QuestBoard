//
//  KingdomDetailClient.h
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHttpRequest.h"

@interface KingdomDetailClient : BaseHttpRequest

typedef void(^Success)(_Nullable id);

+(void)getKingdomDetailList:(nonnull NSNumber *)parameters withSuccess:(nonnull Success)success;

@end
