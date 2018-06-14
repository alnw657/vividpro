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
                                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"The Fields Have Not Been Completed" message:@"Please check if you missed any fields above." preferredStyle:UIAlertControllerStyleAlert];
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


