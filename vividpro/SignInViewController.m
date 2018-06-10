//
//  SignInViewController.m
//  vividpro
//
//  Created by Alan on 20/5/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import "SignInViewController.h"
#import "AppData.h"
@import Firebase;



@interface SignInViewController ()

@end

@implementation SignInViewController

@synthesize  usernamefield, passwordfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self firebaseTests];
}

-(void)firebaseTests
{
    [FIRAuth.auth createUserWithEmail:@"alan12345@yahoo.com" password:@"alan12345" completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if(error == nil){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Is Not Detected!" message:@"This feature is not available on this device, as the camera cannot be found." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];}
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)signInButton:(id)sender {
    
    //user tries to register without feeling in the fields, prompt alert error
    @try{
        if([usernamefield.text isEqualToString:@""]){
            
            
        }
        else if ([passwordfield.text isEqualToString:@""]){
            
        }
        
        else{
            //if everything's ok do the login process
            [[FIRAuth auth]signInWithEmail:usernamefield.text
                                  password: passwordfield.text
                                completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                                    
                                    if(authResult){
                                        //when login successful, go to main view
                                        [self performSegueWithIdentifier:@"goToMainView" sender:self];
                                        
                                    }
                                    
                                    else{
                                        //display error message
                                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Is Not Detected!" message:@"This feature is not available on this device, as the camera cannot be found." preferredStyle:UIAlertControllerStyleAlert];
                                        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
                                        [alert addAction:action];
                                        [self presentViewController:alert animated:YES completion:nil];
                                        
                                    }
                                }];
        }
        
    }
    
    @catch(NSException *ex){
        
    }
}
@end


