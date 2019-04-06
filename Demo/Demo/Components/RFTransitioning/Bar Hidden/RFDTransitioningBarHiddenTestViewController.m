
#import "RFDTransitioningBarHiddenTestViewController.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@implementation RFDTransitioningBarHiddenTestViewController
RFUIInterfaceOrientationSupportDefault

- (NSString *)RFTransitioningStyle {
    return @"RFMoveInFromBottomTransitioning";
}

- (void)viewWillAppear:(BOOL)animated {
    doutwork()
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    doutwork()
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    doutwork()
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    doutwork()
    [super viewDidDisappear:animated];
}

@end
