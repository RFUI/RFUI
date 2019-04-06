
#import "RFDTransitioningMoveInFromBottomViewController.h"
#import "RFMoveInFromBottomTransitioning.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@implementation RFDTransitioningMoveInFromBottomViewController
RFUIInterfaceOrientationSupportDefault

- (NSString *)RFTransitioningStyle {
    return NSStringFromClass([RFMoveInFromBottomTransitioning class]);
}

@end
