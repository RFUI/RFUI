
#import "RFDTransitioningMoveInFromBottomViewController.h"
#import "RFMoveInFromBottomTransitioning.h"

@implementation RFDTransitioningMoveInFromBottomViewController
RFUIInterfaceOrientationSupportDefault

- (NSString *)RFTransitioningStyle {
    return NSStringFromClass([RFMoveInFromBottomTransitioning class]);
}

@end
