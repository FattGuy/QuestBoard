//
//  Kingdom.h
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//
// Kingdom model

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface Kingdom : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *imageURL;

@end
