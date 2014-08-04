
#import "RFDNavigationBarHiddenViewController.h"

@implementation RFDNavigationBarHiddenViewController
RFUIInterfaceOrientationSupportDefault

- (BOOL)prefersNavigationBarHiddenForNavigationController:(RFNavigationController *)navigation {
    return YES;
}

@end
