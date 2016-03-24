//
//  KingdomDetail.m
//  QuestBoard
//
//  Created by Feng Chang on 3/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomDetail.h"

@implementation KingdomDetail

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"id":@"id",
             @"name":@"name",
             @"imageURL":@"image",
             @"climate":@"climate",
             @"population":@"population",
             @"quests":@"quests"
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)questsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Quest.class];
}

@end