
#import "RFDMagicMoveDestinationViewController.h"

@implementation RFDMagicMoveDestinationViewController
RFUIInterfaceOrientationSupportDefault

- (NSString *)RFTransitioningStyle {
    return NSStringFromClass([RFDSampleMagicMoveTransitioning class]);
}

@end

@implementation RFDSampleMagicMoveTransitioning

- (NSDictionary *)viewBindings {
    return @{ @"a" : @"c", @"b" : @"d" };
}

@end
