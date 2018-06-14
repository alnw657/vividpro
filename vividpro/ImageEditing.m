//
//  ImageEditing.m
//  vividpro
//
//  Created by Alan on 5/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import "ImageEditing.h"
#import "MainLoggedIn.h"
@import AssetsLibrary;

@interface ImageEditing ()

@end

@implementation ImageEditing
@synthesize image;

/*- (void)imagePickerController:(UIImagePickerController *)pickerController didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.albumImage.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.albumImage.image = image;
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


- (IBAction)savebutton:(id)sender {
    UIImage *imagetosave = _albumImage.image;
    UIImageWriteToSavedPhotosAlbum(imagetosave, nil, nil, nil);
     [self performSegueWithIdentifier:@"gotofinishedview" sender:self];
}

- (IBAction)blackandwhitebutton:(id)sender {
    UIImageOrientation originalOrientation = _albumImage.image.imageOrientation;
    CGFloat originalscale = _albumImage.image.scale;
    CIImage *beginImage = [CIImage imageWithCGImage:[_albumImage.image CGImage]];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues: kCIInputImageKey, beginImage, @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg scale:originalscale orientation:originalOrientation];
    
    [_albumImage setImage:newImg];
    
    CGImageRelease(cgimg);
}


- (IBAction)normalbutton:(id)sender {
    self.albumImage.image = image;
}
@end
