//
//  QuestGiver.h
//  QuestBoard
//
//  Created by Feng Chang on 3/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//
// Giver model

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface QuestGiver : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *gid;
@property (strong, nonatomic) NSString *gname;
@property (strong, nonatomic) NSURL *gImageURL;

@end
