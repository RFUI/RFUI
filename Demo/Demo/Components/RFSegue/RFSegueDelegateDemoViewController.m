
#import "RFSegueDelegateDemoViewController.h"

@interface RFSegueDelegateDemoViewController ()
@end

@implementation RFSegueDelegateDemoViewController
RFUIInterfaceOrientationSupportDefault

#pragma mark - RFSegueSourceDelegate

- (void)RFSegueWillPerform:(RFSegue *)segue {
    dout(@"%@ - RFSegueWillPerform: %@", self, segue);
}

- (void)RFSegueDidPerform:(RFSegue *)segue {
    dout(@"%@ - RFSegueDidPerform: %@", self, segue);
}

#pragma mark - RFSegueDestinationDelegate

- (void)RFSegueWillAppear:(RFSegue *)segue {
    dout(@"%@ - RFSegueWillAppear: %@", self, segue);
}

- (void)RFSegueDidAppear:(RFSegue *)segue {
    dout(@"%@ - RFSegueDidAppear: %@", self, segue);
}

#pragma mark - RFSegueReturnDelegate

- (void)RFSegueWillReturn:(id)sender {
    dout(@"%@ - RFSegueWillReturn: %@", self, sender);
}

- (void)RFSegueDidReturn:(id)sender {
    dout(@"%@ - RFSegueDidReturn: %@", self, sender);
}

@end
