
#import "RFDNavigationBarAppearanceTestViewController.h"
#import "UIViewController+RFNavigationBehavingIBInspectableSupport.h"

@interface RFDNavigationBarAppearanceTestViewController ()
@end

@implementation RFDNavigationBarAppearanceTestViewController
RFUIInterfaceOrientationSupportDefault

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *dst = segue.destinationViewController;
    dst.prefersStatusBarHidden = !self.statusBarShownSwith.on;
    dst.prefersNavigationBarHidden = !self.navigationBarShownSwith.on;
    dst.prefersBottomBarShown = self.bottomBarShownSwith.on;
}

- (IBAction)onCurrentStatusBarShownSwithChanged:(UISwitch *)sender {
    self.prefersStatusBarHidden = !sender.on;
    [self updateNavigationAppearanceAnimated:YES];
}

- (IBAction)onCurrentNavigationBarShownSwithChanged:(UISwitch *)sender {
    self.prefersNavigationBarHidden = !sender.on;
    [self updateNavigationAppearanceAnimated:YES];
}

- (IBAction)onCurrentBottomBarShownSwithChanged:(UISwitch *)sender {
    self.prefersBottomBarShown = sender.on;
    [self updateNavigationAppearanceAnimated:YES];
}

@end
