
#import "RFDMagicMoveDestinationViewController.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

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
