//
//  QuestGiver.m
//  QuestBoard
//
//  Created by Feng Chang on 3/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "QuestGiver.h"

@implementation QuestGiver

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"gid":@"id",
             @"gname":@"name",
             @"gImageURL":@"image"
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
