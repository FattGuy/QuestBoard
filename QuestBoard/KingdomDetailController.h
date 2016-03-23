//
//  KingdomDetailController.h
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Kingdom.h"

@interface KingdomDetailController : UIViewController

@property (strong, nonatomic) Kingdom *selectedKingdom;



-(void)setUpTopRegion;

@end
