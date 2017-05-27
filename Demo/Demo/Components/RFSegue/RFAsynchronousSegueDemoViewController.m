
#import "RFAsynchronousSegueDemoViewController.h"

@interface RFAsynchronousSegueDemoViewController () <
    UIAlertViewDelegate
>
@property (weak, nonatomic) RFAsynchronousSegue *segue;
@end

@implementation RFAsynchronousSegueDemoViewController
RFUIInterfaceOrientationSupportDefault

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue isKindOfClass:[RFAsynchronousSegue class]]) {
        RFAsynchronousSegue *s = (id)segue;
        if ([s.identifier isEqualToString:@"PUSH1"]) {
            [s setPerformBlcok:^(RFAsynchronousSegue *this) {
                [this noticeDelegateWillPerform];
                [[this.sourceViewController navigationController] pushViewController:this.destinationViewController animated:YES];
                dispatch_after_seconds(RFSegueNavigationTransitionDuration, ^{
                    [this noticeDelegateDidPerformed];
                });
            }];
            self.segue = s;

            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Push?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
            [alertView show];
        }
        else if ([s.identifier isEqualToString:@"PUSH2"]) {
            if (!self.push2ShouldPerformSegue.on) {
                [s cancel];
            }
            else {
                [s fire];
            }
        }
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex) {
        [self.segue fire];
    }
    else {
        [self.segue cancel];
    }
}

@end
