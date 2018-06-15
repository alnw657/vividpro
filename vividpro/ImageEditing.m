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
@import CoreMedia;
@import CoreVideo;
@import OpenGLES;
@import AVFoundation;
@import QuartzCore;


@interface ImageEditing ()

@end

@implementation ImageEditing
@synthesize image;


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
     self.albumImage.image = image;
    UIImageOrientation originalOrientation = _albumImage.image.imageOrientation;
    CGFloat originalscale = _albumImage.image.scale;
    CIImage *beginImage = [CIImage imageWithCGImage:[_albumImage.image CGImage]];
    
    CIImage *outputImage = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", [NSNumber numberWithFloat:1.0], @"inputColor", [[CIColor alloc] initWithColor:[UIColor whiteColor]], nil].outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg scale:originalscale orientation:originalOrientation];
    
    [_albumImage setImage:newImg];
    CGImageRelease(cgimg);
}

- (IBAction)pinkbutton:(id)sender {
    
     self.albumImage.image = image;
    UIImageOrientation originalOrientation = _albumImage.image.imageOrientation;
    CGFloat originalscale = _albumImage.image.scale;
    CIImage *beginImage = [CIImage imageWithCGImage:[_albumImage.image CGImage]];
    CGRect beginImagerect = beginImage.extent;
    CIFilter * vignetteFilter = [CIFilter filterWithName:@"CIVignetteEffect"];
    [vignetteFilter setValue:beginImage forKey:kCIInputImageKey];
    [vignetteFilter setValue:[CIVector vectorWithX:beginImagerect.size.width/2 Y:beginImagerect.size.height/2] forKey:kCIInputCenterKey];
    [vignetteFilter setValue:@(beginImagerect.size.width/2) forKey:kCIInputRadiusKey];
    CIImage *filteredImage = [vignetteFilter outputImage];
    
    CIFilter *effectFilter = [CIFilter filterWithName:@"CIPhotoEffectInstant"];
    [effectFilter setValue:filteredImage forKey:kCIInputImageKey];
    filteredImage = [effectFilter outputImage];
     CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:filteredImage fromRect:filteredImage.extent];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg scale:originalscale orientation:originalOrientation];
    
     [_albumImage setImage:newImg];
}

- (IBAction)purplebutton:(id)sender {
    self.albumImage.image = image;
    UIImageOrientation originalOrientation = _albumImage.image.imageOrientation;
    CGFloat originalscale = _albumImage.image.scale;
    CIImage *beginImage = [CIImage imageWithCGImage:[_albumImage.image CGImage]];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIHueAdjust"];
    
    // Change the float value here to change the hue
    [filter setValue:[NSNumber numberWithFloat:0.5] forKey: @"inputAngle"];
    
    // input black and white image
    [filter setValue:beginImage forKey:kCIInputImageKey];
    
    // get output from filter
    CIImage *hueImage = [filter valueForKey:kCIOutputImageKey];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImage = [context createCGImage:hueImage
                                       fromRect:[hueImage extent]];
    
   
    UIImage *newImg = [UIImage imageWithCGImage:cgImage scale:originalscale orientation:originalOrientation];
    [_albumImage setImage:newImg];
    CGImageRelease(cgImage);
    
    
}


- (IBAction)icybutton:(id)sender {
    self.albumImage.image = image;
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
