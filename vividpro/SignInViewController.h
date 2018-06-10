//
//  SignInViewController.h
//  vividpro
//
//  Created by Alan on 20/5/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController<UITextFieldDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernamefield;
@property (weak, nonatomic) IBOutlet UITextField *passwordfield;

@property (strong, nonatomic) IBOutlet UIButton *signInButton;

- (IBAction)signInButton:(id)sender;

@end
