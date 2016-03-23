//
//  KingdomCell.h
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Kingdom.h"

@interface KingdomCell : UITableViewCell
// Table cell UIs
@property (weak, nonatomic) IBOutlet UIImageView *kImageView;
@property (weak, nonatomic) IBOutlet UILabel *kNameLabel;

-(void)setCellValue:(Kingdom *)kingdom;

@end
