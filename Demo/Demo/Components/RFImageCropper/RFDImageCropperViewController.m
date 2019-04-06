
#import "RFDImageCropperViewController.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@interface RFDImageCropperViewController () <
    UIImagePickerControllerDelegate
>
@end

@implementation RFDImageCropperViewController
RFUIInterfaceOrientationSupportAll

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageCropper.cropSize = CGSizeMake(300, 300);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:animated];
}

- (IBAction)onPickPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = (id)self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageCropper.sourceImage = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onCropSizeChangeTo1x1:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        self.imageCropper.cropSize = CGSizeMake(300, 300);
    }];
}

- (IBAction)onCropSizeChangeTo3x4:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        self.imageCropper.cropSize = CGSizeMake(300, 400);
    }];
}

- (IBAction)onCropSizeChangeTo4x3:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        self.imageCropper.cropSize = CGSizeMake(300, 225);
    }];
}

- (IBAction)onCrop:(id)sender {
}

@end
