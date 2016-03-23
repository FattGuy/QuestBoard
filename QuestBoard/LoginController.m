//
//  LoginController.m
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import "LoginController.h"
#import "Constant.h"
#import "CommonUtil.h"
#import "SVProgressHUD.h"
#import "StateUtil.h"
#import "SignUpClient.h"
#import "UserDefaultsUtil.h"

@interface LoginController ()<UITextFieldDelegate>

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initial a User
    self.user = [[User alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFiledReturn:(id)sender {
    [self.nameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
}
// Submit the user information, check the signup history for next page
- (IBAction)submitAction:(id)sender {
    self.user.name = self.nameTextField.text;
    self.user.email = self.emailTextField.text;
    
    SignUpState state = [CommonUtil isVaildEmail:self.user.email];
    
    if (state == Correct) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        [SVProgressHUD show];
        [SignUpClient signUp:self.user withSuccess:^(id _Nullable success) {
            [SVProgressHUD showInfoWithStatus:[success valueForKey:@"message"]];
            if (self.isFromLogOut) {
                [self dismissViewControllerAnimated:true completion:^{
                    
                }];
            }else{
                [self performSegueWithIdentifier:@"SignUpSegue" sender:nil];
            }
            
            [UserDefaultsUtil saveEmail:self.user.email];
        }];
    }else if (state == EmptyEmail){
        [SVProgressHUD showErrorWithStatus:@"Please Enter Email"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Wrong Email"];
    }
}

@end

