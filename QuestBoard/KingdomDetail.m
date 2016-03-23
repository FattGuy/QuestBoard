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
//             @"qid":@"quests.id",
//             @"qname":@"quests.name",
//             @"qImageURL":@"quests.image",
//             @"questDescription":@"quests.description",
//             @"giver":@"giver",
//             @"gid":@"giver.id",
//             @"gname":@"giver.name",
//             @"gImageURL":@"giver.image"
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)climateJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)populationJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

//+ (NSValueTransformer *)qImageURLJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}
//
+ (NSValueTransformer *)questDescriptionJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Quest.class];
}

//+ (NSValueTransformer *)questsJSONTransformer {
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Quest.class];
//}

@end