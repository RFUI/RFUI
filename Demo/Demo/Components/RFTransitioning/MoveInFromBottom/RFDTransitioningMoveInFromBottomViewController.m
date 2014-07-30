
#import "RFDTransitioningMoveInFromBottomViewController.h"
#import "RFMoveInFromBottomTransitioning.h"

@interface RFDTransitioningMoveInFromBottomViewController ()
@end

@implementation RFDTransitioningMoveInFromBottomViewController
RFUIInterfaceOrientationSupportDefault

- (NSString *)RFTransitioningStyle {
    return NSStringFromClass([RFMoveInFromBottomTransitioning class]);
}

@end
