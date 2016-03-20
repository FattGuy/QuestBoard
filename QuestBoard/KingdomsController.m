//
//  KingdomsController.m
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "KingdomsController.h"
#import "User.h"
#import "UserDefaultsUtil.h"
#import "KingdomClient.h"
#import "Mantle.h"
#import "Kingdom.h"
#import "KingdomCell.h"
#import "LoginController.h"
#import "SVProgressHUD.h"
#import "UIColor+Hex.h"
#import "Constant.h"
#import "CommonUtil.h"

@interface KingdomsController ()
{
@private User *user;
    
@private __block NSArray *kingdomList;
    
@private Kingdom *selectedKingdom;
}
@end

@implementation KingdomsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *bgImage = [CommonUtil imageWithColor:[UIColor colorWithHex:OutstandingBlue]];
    
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    user = [[User alloc] init];
    user.email = [UserDefaultsUtil getEmail];
    
    self.navigationItem.title = user.email;
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"Loading"];
    
    [KingdomClient getKingdomList:^(id _Nullable result) {
        [SVProgressHUD dismiss];
        NSError *error = nil;
        kingdomList = [MTLJSONAdapter modelsOfClass:[Kingdom class] fromJSONArray:result error:&error];
        
        [self.tableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kingdomList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KingdomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KingdomCell" forIndexPath:indexPath];
    
    [cell setCellValue:kingdomList[indexPath.row]];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    [self performSegueWithIdentifier:@"KingdomDetailSegue" sender:nil];
}

- (IBAction)logOutAction:(id)sender {
    [UserDefaultsUtil saveEmail:@""];
    
    LoginController *loginController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
    loginController.isFromLogOut = true;
    [self.navigationController presentViewController:loginController animated:true completion:^{
        
    }];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
 }


@end
