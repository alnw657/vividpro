//
//  ImageEditing.h
//  vividpro
//
//  Created by Alan on 5/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageEditing : UIViewController <UINavigationBarDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *albumImage;
@property (strong, nonatomic) UIImage *image;
- (IBAction)savebutton:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property(nonatomic, strong) UIColor *tintColor;
- (IBAction)blackandwhitebutton:(id)sender;
- (IBAction)sepiabutton:(id)sender;
- (IBAction)lanabutton:(id)sender;
- (IBAction)randombutton:(id)sender;
- (IBAction)normalbutton:(id)sender;
@end
