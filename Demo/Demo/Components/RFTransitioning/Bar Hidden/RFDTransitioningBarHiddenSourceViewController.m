
#import "RFDTransitioningBarHiddenSourceViewController.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@implementation RFDTransitioningBarHiddenSourceViewController
RFUIInterfaceOrientationSupportDefault

- (void)viewWillAppear:(BOOL)animated {
    doutwork()
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    doutwork()
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    doutwork()
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    doutwork()
    [super viewDidDisappear:animated];
}

@end
