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
    
    user = [[User alloc] init];
    user.email = [UserDefaultsUtil getEmail];
    self.navigationItem.title = user.email;
    selectedKingdom = [[Kingdom alloc] init];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"Loading"];
    // Load basic information for Kingdom in tableview
    [KingdomClient getKingdomList:^(id _Nullable result) {
        [SVProgressHUD dismiss];
        NSError *error = nil;
        kingdomList = [MTLJSONAdapter modelsOfClass:[Kingdom class] fromJSONArray:result error:&error];
        
        [self.tableView reloadData];
        
    }];
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
    // Sign the basic infromation as values for each selected Kingdom
    selectedKingdom.name = [kingdomList[indexPath.row] valueForKey:@"name"];
    selectedKingdom.id = [kingdomList[indexPath.row] valueForKey:@"id"];
    selectedKingdom.imageURL = [kingdomList[indexPath.row] valueForKey:@"imageURL"];
    [self performSegueWithIdentifier:@"KingdomDetailSegue" sender:nil];
}
// Logout action
- (IBAction)logOutAction:(id)sender {
    [UserDefaultsUtil saveEmail:@""];
    
    LoginController *loginController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
    loginController.isFromLogOut = true;
    [self.navigationController presentViewController:loginController animated:true completion:^{
        
    }];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation

 // Pass the values of basic information of a selected Kingdom
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.

     if ([segue.identifier isEqualToString:@"KingdomDetailSegue"]) {
         KingdomDetailController *kdc = segue.destinationViewController;
         kdc.navigationItem.title = selectedKingdom.name;
         [kdc setValue:selectedKingdom forKey:@"selectedKingdom"];
         
     } else {
         [SVProgressHUD showErrorWithStatus:@"Kingdom not found"];
     }
 }


@end
