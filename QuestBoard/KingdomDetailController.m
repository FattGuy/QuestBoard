//
//  KingdomDetailController.m
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomDetailController.h"
#import "CommonUtil.h"
#import "UIColor+Hex.h"
#import "Constant.h"
#import "KingdomsController.h"
#import "KingdomDetailClient.h"
#import "SVProgressHUD.h"
#import "KingdomClient.h"
#import "KingdomDetail.h"
#import "UIImageView+WebCache.h"
#import "Quest.h"

@interface KingdomDetailController (){

@private KingdomDetail *kingdomDetail;
    
}
// Top view UIs
@property (weak, nonatomic) IBOutlet UIImageView *kImageView;
@property (weak, nonatomic) IBOutlet UILabel *climateLabel;
@property (weak, nonatomic) IBOutlet UILabel *populationLabel;

@end

@implementation KingdomDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

-(void)loadData{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"Loading"];
    
    // Load detail infomation of Kingdom
    [KingdomDetailClient getKingdomDetailList:self.selectedKingdom.id withSuccess:^(id _Nullable result) {
        [SVProgressHUD dismiss];
        NSError *error = nil;
        kingdomDetail = [MTLJSONAdapter modelOfClass:[KingdomDetail class] fromJSONDictionary:result error:&error];
        [self setUpTopRegion];
        [self buildQustView];
    }];
}

-(void)buildQustView{
    
    self.scrollView.contentSize = CGSizeMake(kingdomDetail.quests.count *kWinSize.width, 0);
    
    for (int i = 0 ; i < kingdomDetail.quests.count ; i++){
        QuestView *questView = [[QuestView alloc] initWithFrame:CGRectMake(kWinSize.width*i, 0,kWinSize.width , 350)];
        
        [questView buildWithQuest:kingdomDetail.quests[i]];
        
        [self.scrollView addSubview:questView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Set up top view
-(void)setUpTopRegion {
    self.climateLabel.text = kingdomDetail.climate;
    self.populationLabel.text = [kingdomDetail.population stringValue];
    [self.kImageView sd_setImageWithURL:kingdomDetail.imageURL];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
