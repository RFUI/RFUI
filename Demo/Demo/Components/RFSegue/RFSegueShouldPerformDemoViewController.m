
#import "RFSegueShouldPerformDemoViewController.h"

@interface RFSegueShouldPerformDemoViewController ()
@end

@implementation RFSegueShouldPerformDemoViewController
RFUIInterfaceOrientationSupportDefault

- (BOOL)RFSegueShouldPerform:(RFSegue *)segue {
    if (self.shouldSwitch.on) {
        return YES;
    }
    [UIAlertView showWithTitle:@"Can not perform segue now." message:@"Try turn the swithch on" buttonTitle:nil];
    return NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.shouldSwitch.on = NO;
}

@end
