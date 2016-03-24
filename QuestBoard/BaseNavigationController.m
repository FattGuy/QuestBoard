//
//  BaseNavigationController.m
//  QuestBoard
//
//  Created by Feng Chang on 16/3/24.
//  Copyright © 2016年 FattGuy. All rights reserved.
//

#import "BaseNavigationController.h"
#import "CommonUtil.h"
#import "Constant.h"
#import "UIColor+Hex.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgImage = [CommonUtil imageWithColor:[UIColor colorWithHex:OutstandingBlue]];
    [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    // Name UIBarButtonItem
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]
                                          initWithTitle:@"Back"
                                          style:UIBarButtonItemStylePlain
                                          target:self
                                          action:nil];
    self.navigationBar.topItem.backBarButtonItem = backBarButtonItem;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
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
