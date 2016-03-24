//
//  KingdomDetailController.h
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Kingdom.h"
#import "KingdomDetailController.h"
#import "QuestView.h"

@interface KingdomDetailController : UIViewController

@property (strong, nonatomic) Kingdom *selectedKingdom;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

-(void)setUpTopRegion;

@end
