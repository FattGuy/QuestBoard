//
//  Quest.m
//  QuestBoard
//
//  Created by Feng Chang on 3/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "Quest.h"
#import "QuestGiver.h"

@implementation Quest

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"qid":@"id",
             @"qname":@"name",
             @"qImageURL":@"image",
             @"questDescription":@"description",
             @"giver":@"giver"
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)giverJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass: QuestGiver.class];
}

@end
