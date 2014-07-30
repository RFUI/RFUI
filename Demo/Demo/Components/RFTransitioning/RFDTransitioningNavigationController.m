
#import "RFDTransitioningNavigationController.h"
#import "RFNavigationControllerTransitionDelegate.h"

@interface RFDTransitioningNavigationController ()
@property (strong, nonatomic) id transitionDelegate;
@end

@implementation RFDTransitioningNavigationController
RFUIInterfaceOrientationSupportNavigation

+ (void)load {
    // Make navigation bar looks diffrent
    [[RFDTransitioningNavigationBar appearance] setTintColor:[UIColor redColor]];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _transitionDelegate = [RFNavigationControllerTransitionDelegate new];
        self.delegate = _transitionDelegate;
    }
    return self;
}

@end

@implementation RFDTransitioningNavigationBar
@end
