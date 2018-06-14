//
//  MainLoggedIn.m
//  
//
//  Created by Alan on 3/6/18.
//

#import "MainLoggedIn.h"
#import "ImageEditing.h"
@import Firebase;
@interface MainLoggedIn ()

@end

@implementation MainLoggedIn

@synthesize image1;

- (IBAction)Opencamera:(id)sender {
  
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        pickerController.delegate = self;
        [pickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        pickerController.allowsEditing = NO;
        [self presentViewController:pickerController animated:YES completion:nil];
     // [self performSegueWithIdentifier:@"goToImageView" sender:sender];
        
        
    } else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Is Not Detected!" message:@"This feature is not available on this device, as the camera cannot be found." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    
    }
}





- (IBAction)Openphoto:(id)sender {
    
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        pickerController.delegate = self;
    
        pickerController.allowsEditing = NO;
        [self presentViewController:pickerController animated:YES completion:nil];
    

   // [self performSegueWithIdentifier:@"goToImageView" sender:sender];

}

- (IBAction)Signoutbutton:(id)sender {
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
        
        
    }
     [self performSegueWithIdentifier:@"gotomainview" sender:self];
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)pickerController{
    [pickerController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)pickerController didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image1 = [info valueForKey:UIImagePickerControllerOriginalImage];
    //self.albumImage.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
     [self performSegueWithIdentifier:@"goToImageView" sender:self];
}
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

 In a storyboard-based application, you will often want to do a little preparation before navigation

*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goToImageView"]) {
        
        // Get destination view
        ImageEditing *imageeditview = [segue destinationViewController];
        
        imageeditview.image = image1;
        
      
    }
        
        
    
    //Get the new view controller using [segue destinationViewController].
    //Pass the selected object to the new view controller.
    
    //import imageediting.h
    //Create Image editing subject
    //imageediting.h.imageproperty = image;
}

@end
