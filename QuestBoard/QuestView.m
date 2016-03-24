//
//  QuestView.m
//  QuestBoard
//
//  Created by Feng Chang on 3/23/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "QuestView.h"
#import "UIImageView+WebCache.h"

@implementation QuestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"QuestView" owner:self
                                           options:nil] objectAtIndex:0];
        
        self.frame = frame;
    }
    return self;
}

-(void)buildWithQuest:(Quest *)quest{
    self.gImageView.layer.masksToBounds = true;
    self.gImageView.layer.cornerRadius = 25;
    
    
    //In order to make the image fit the imageView, so the image will not be stretched
    self.qImageView.contentScaleFactor = [UIScreen mainScreen].scale;
    self.qImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.qImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.qImageView.clipsToBounds  = true;
    
    //show image progressive
    [self.qImageView sd_setImageWithURL:quest.qImageURL placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    self.qNameLabel.text = quest.qname;
    self.questDescriptionLabel.text = quest.questDescription;
    
    [self.gImageView sd_setImageWithURL:quest.giver.gImageURL];
    self.gNameLabel.text = quest.giver.gname;
}

@end
