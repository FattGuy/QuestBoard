//
//  KingdomDetail.h
//  QuestBoard
//
//  Created by Feng Chang on 3/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
#import "Quest.h"
#import "QuestGiver.h"

@interface KingdomDetail : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *imageURL;
@property (strong, nonatomic) NSString *climate;
@property (strong, nonatomic) NSNumber *population;
//@property (strong, nonatomic) NSArray *questList;
@property (strong, nonatomic) Quest *quests;
//
//@property (strong, nonatomic) NSNumber *qid;
//@property (strong, nonatomic) NSString *qname;
//@property (strong, nonatomic) NSURL *qImageURL;
//@property (strong, nonatomic) NSString *questDescription;
//
//@property (strong, nonatomic) QuestGiver *giver;
//
//@property (strong, nonatomic) NSNumber *gid;
//@property (strong, nonatomic) NSString *gname;
//@property (strong, nonatomic) NSURL *gImageURL;

@end
