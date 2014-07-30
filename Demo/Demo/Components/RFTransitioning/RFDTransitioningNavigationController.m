
#import "RFDTransitioningNavigationController.h"
#import "RFNavigationControllerTransitionDelegate.h"

@interface RFDTransitioningNavigationController ()
@property (strong, nonatomic) id transitionDelegate;
@property (strong, nonatomic) RFDTransitioningBarHiddenControl *barHiddenControl;
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
        _barHiddenControl = [RFDTransitioningBarHiddenControl new];

        RFNavigationControllerTransitionDelegate *td = [RFNavigationControllerTransitionDelegate new];
        td.delegate = _barHiddenControl;
        self.delegate = td;
        _transitionDelegate = td;
    }
    return self;
}

@end

@implementation RFDTransitioningNavigationBar
@end

@implementation RFDTransitioningBarHiddenControl

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    dout_debug(@"Navigation controller will show %@", viewController);
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    dout_debug(@"Navigation controller did show %@", viewController);
}

@end
