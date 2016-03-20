//
//  CommonUtil.h
//  QuestBoard
//
//  Created by Feng Chang on 3/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StateUtil.h"
#import <UIKit/UIKit.h>

@interface CommonUtil : NSObject

+(SignUpState)isVaildEmail: (NSString *)email;

+(UIImage*) imageWithColor:(UIColor*)color;

@end
