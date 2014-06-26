
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
        [s setPerformBlcok:^(RFAsynchronousSegue *this) {
            [[this.sourceViewController navigationController] pushViewController:this.destinationViewController animated:YES];
        }];
        self.segue = s;

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Push?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex) {
        [self.segue fire];
    }
    else {
        [self.segue cancel];
    }
}

@end
