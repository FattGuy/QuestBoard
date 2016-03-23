//
//  KingdomDetailController.m
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomDetailController.h"
#import "Kingdom.h"
#import "CommonUtil.h"
#import "UIColor+Hex.h"
#import "Constant.h"
#import "KingdomsController.h"
#import "KingdomDetailClient.h"
#import "SVProgressHUD.h"
#import "KingdomClient.h"
#import "KingdomDetail.h"
#import "UIImageView+WebCache.h"

@interface KingdomDetailController (){

@private KingdomDetail *kingdomDetail;
    
@private __block NSArray *kingdomDetailList;
    
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
    UIImage *bgImage = [CommonUtil imageWithColor:[UIColor colorWithHex:OutstandingBlue]];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    // Name UIBarButtonItem
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]
                                          initWithTitle:@"Back"
                                          style:UIBarButtonItemStylePlain
                                          target:self
                                          action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem = backBarButtonItem;

    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"Loading"];

    // Load detail infomation of Kingdom
    [KingdomDetailClient getKingdomDetailList:self.selectedKingdom.id withSuccess:^(id _Nullable result) {
        [SVProgressHUD dismiss];
        NSError *error = nil;
        kingdomDetailList = [MTLJSONAdapter modelsOfClass:[KingdomDetail class] fromJSONArray:result error:&error];
        NSLog(@"%@",kingdomDetailList);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Set up top view
//-(void)setUpTopRegion:(KingdomDetail *)kingdomDetail{
//    kingdomDetail.imageURL = [kingdomDetailList valueForKey:@"imageURL"];
//    [self.kImageView sd_setImageWithURL:kingdomDetail.imageURL];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
