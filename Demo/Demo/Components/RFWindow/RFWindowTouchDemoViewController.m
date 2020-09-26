
#import "RFWindowTouchDemoViewController.h"
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@interface RFWindowTouchDemoViewController ()
@property (strong, nonatomic) RFWindow *window;
@end

@implementation RFWindowTouchDemoViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addWindow];
    self.windowTriggerButton.selected = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeWindow];
}

- (void)addWindow {
    RFWindow *win = [[RFWindow alloc] init];

    // Fix a window is opaque on iOS 9
    win.backgroundColor = nil;

    win.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ROOT1"];
    win.hidden = NO;
    self.window = win;
}

- (void)removeWindow {
    // Fix unexpected nil window in _UIApplicationHandleEventFromQueueEvent, _windowServerHitTestWindow: on iOS 9
    [self.window removeFromSuperview];
    self.window.hidden = YES;
    self.window = nil;
}


- (IBAction)onToggleWindowDisplay:(id)sender {
    if (self.window) {
        [self removeWindow];
        self.windowTriggerButton.selected = NO;
    }
    else {
        [self addWindow];
        self.windowTriggerButton.selected = YES;
    }
}

@end
