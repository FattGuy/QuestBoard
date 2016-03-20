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

@interface KingdomDetailController ()

@end

@implementation KingdomDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgImage = [CommonUtil imageWithColor:[UIColor colorWithHex:OutstandingBlue]];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]
                                          initWithTitle:@"Back"
                                          style:UIBarButtonItemStylePlain
                                          target:self
                                          action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem = backBarButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
