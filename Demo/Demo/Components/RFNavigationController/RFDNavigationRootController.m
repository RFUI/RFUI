
#import "RFDNavigationRootController.h"

@implementation RFDNavigationRootController

- (void)onInit {
    [super onInit];
    self.handelViewControllerBasedStatusBarAppearance = YES;
}

- (IBAction)onTest:(id)sender {
    douto(self.defaultAppearanceAttributes)
}

- (IBAction)navigaitonPop:(id)sender {
    [self popViewControllerAnimated:YES];
}

@end
