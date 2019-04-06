
#import "RFDContainerViewLazyLoadTestViewController.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@interface RFDContainerViewLazyLoadTestViewController ()
@end

@implementation RFDContainerViewLazyLoadTestViewController
RFUIInterfaceOrientationSupportDefault

- (IBAction)onLoadButton1Tapped:(id)sender {
    if (self.loadButton1.selected) {
        [self.container1 unloadEmbedViewController:NO];
    }
    else {
        [self.container1 loadEmbedViewController];
    }
    self.loadButton1.selected = self.container1.embedViewControllerLoaded;
}

- (IBAction)onLoadButton2Tapped:(id)sender {
    if (self.loadButton2.selected) {
        [self.container2 unloadEmbedViewController:YES];
    }
    else {
        [self.container2 loadEmbedViewController];
    }
    self.loadButton2.selected = self.container2.embedViewControllerLoaded;
}

@end
