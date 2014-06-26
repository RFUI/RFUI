
#import "RFSegueShouldReturnDemoViewController.h"

@interface RFSegueShouldReturnDemoViewController ()
@end

@implementation RFSegueShouldReturnDemoViewController
RFUIInterfaceOrientationSupportDefault

- (BOOL)RFSegueShouldReturn:(id)sender {
    if (self.shouldSwitch.on) {
        return YES;
    }
    [UIAlertView showWithTitle:@"Can not return now." message:@"Try turn the swithch on" buttonTitle:nil];
    return NO;
}

@end
