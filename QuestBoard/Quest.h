//
//  Quest.h
//  QuestBoard
//
//  Created by Feng Chang on 3/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//
// Quest model

#import <Foundation/Foundation.h>
#import "QuestGiver.h"
#import "Mantle.h"

@interface Quest : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *qid;
@property (strong, nonatomic) NSString *qname;
@property (strong, nonatomic) NSURL *qImageURL;
@property (strong, nonatomic) NSString *questDescription;
//@property (strong, nonatomic) QuestGiver *giver;
//@property (strong, nonatomic) NSArray *qGiverList;

@end
