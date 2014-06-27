
#import "RFWindowTouchDemoViewController.h"

@interface RFWindowTouchDemoViewController ()
@property (strong, nonatomic) RFWindow *window;
@end

@implementation RFWindowTouchDemoViewController
RFUIInterfaceOrientationSupportAll

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupWindow];
}

- (void)setupWindow {
    RFWindow *win = [[RFWindow alloc] init];
    win.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ROOT1"];
    win.hidden = NO;
    win.windowLevel = UIWindowLevelStatusBar;
    self.window = win;
}

@end
