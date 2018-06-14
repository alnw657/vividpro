//
//  SignUpViewController.m
//  vividpro
//
//  Created by Alan on 10/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppData.h"
@import Firebase;
@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize usernamefield, passwordfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)signUpfield:(id)sender {
    [[FIRAuth auth]createUserWithEmail:usernamefield.text
                          password: passwordfield.text
                        completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                            
                            if(authResult){
                                //when signup successfully, go to sign in screen
                                
                                [self performSegueWithIdentifier:@"gotosignin" sender:self];
                                
                            }
                            
                            else{
                                //display error message
                                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"The Fields Have Not Been Completed" message:@"Please check if you missed any fields above." preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
                                [alert addAction:action];
                                [self presentViewController:alert animated:YES completion:nil];
                                
                            }
                        }];
}
    

        
    
    
  

@end
