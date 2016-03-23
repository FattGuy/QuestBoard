//
//  LoginController.h
//  QuestBoard
//
//  Created by Feng Chang on 3/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface LoginController : UIViewController
// Login page UIs
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) User * user;

@property (nonatomic) BOOL isFromLogOut;

@end
