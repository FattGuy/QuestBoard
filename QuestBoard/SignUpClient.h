//
//  SignUpClient.h
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHttpRequest.h"
#import "User.h"

@interface SignUpClient : BaseHttpRequest

typedef void(^Success)(_Nullable id);

+(void)signUp:(nonnull User *)parameters withSuccess:(nonnull Success)success;

@end
