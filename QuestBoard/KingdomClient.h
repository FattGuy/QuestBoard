//
//  KingdomClient.h
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHttpRequest.h"

@interface KingdomClient : BaseHttpRequest

typedef void(^Success)(_Nullable id);

+(void)getKingdomList:(nonnull Success)success;

@end
