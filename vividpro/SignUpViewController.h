//
//  SignUpViewController.h
//  vividpro
//
//  Created by Alan on 10/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate, UITextFieldDelegate,UITextFieldDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernamefield;
@property (strong, nonatomic) IBOutlet UITextField *passwordfield;
@property (strong, nonatomic) IBOutlet UITextField *passwordconfirmfield;
@property (strong, nonatomic) IBOutlet UITextField *emailfield;
- (IBAction)signUpfield:(id)sender;

@end
