//
//  UserDefaultsUtil.h
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsUtil : NSObject

+(void)saveEmail:(NSString*)email;

+(NSString*)getEmail;

@end
