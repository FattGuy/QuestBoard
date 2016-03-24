//
//  QuestView.h
//  QuestBoard
//
//  Created by Feng Chang on 3/23/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quest.h"

@interface QuestView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *qImageView;
@property (weak, nonatomic) IBOutlet UILabel *qNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *questDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gImageView;
@property (weak, nonatomic) IBOutlet UILabel *gNameLabel;

-(void)buildWithQuest:(Quest *)quest;

@end
