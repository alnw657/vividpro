//
//  MainLoggedIn.h
//  
//
//  Created by Alan on 3/6/18.
//

#import <UIKit/UIKit.h>

@interface MainLoggedIn : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)Opencamera:(id)sender;
- (IBAction)Openphoto:(id)sender;
- (IBAction)Signoutbutton:(id)sender;



@property (strong, nonatomic) UIImage *image1;

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)pickerController;

@end
