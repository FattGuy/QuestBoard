//
//  KingdomCell.m
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomCell.h"
#import "UIImageView+WebCache.h"

@implementation KingdomCell

- (void)awakeFromNib {
    // Initialization code
    self.kImageView.layer.masksToBounds = true;
    self.kImageView.layer.cornerRadius = 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setCellValue:(Kingdom *)kingdom{
    [self.kImageView sd_setImageWithURL:kingdom.imageURL];
    self.kNameLabel.text = kingdom.name;
}

@end

