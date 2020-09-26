
#import "RFDNavigationRootController.h"

@implementation RFDNavigationRootController

- (IBAction)onTest:(id)sender {
    douto(self.defaultAppearanceAttributes)
}

- (IBAction)navigaitonPop:(id)sender {
    [self popViewControllerAnimated:YES];
}

@end
