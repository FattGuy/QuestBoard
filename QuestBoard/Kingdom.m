//
//  Kingdom.m
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "Kingdom.h"

@implementation Kingdom

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"kid":@"id",
             @"name":@"name",
             @"imageURL":@"image",
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
