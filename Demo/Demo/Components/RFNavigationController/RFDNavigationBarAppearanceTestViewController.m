
#import "RFDNavigationBarAppearanceTestViewController.h"
#import "UIViewController+RFDNavigationAppearance.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@implementation RFDNavigationBarAppearanceTestViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *dst = segue.destinationViewController;
    dst.RFPrefersStatusBarHidden = !self.statusBarShownSwith.on;
    dst.RFPrefersNavigationBarHidden = !self.navigationBarShownSwith.on;
    dst.RFPrefersBottomBarShown = self.bottomBarShownSwith.on;
}

- (IBAction)onCurrentStatusBarShownSwithChanged:(UISwitch *)sender {
    self.RFPrefersStatusBarHidden = !sender.on;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden {
    return self.RFPrefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.RFPrefersLightContentBarStyle? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}

- (IBAction)onCurrentNavigationBarShownSwithChanged:(UISwitch *)sender {
    self.RFPrefersNavigationBarHidden = !sender.on;
    [self updateNavigationAppearanceAnimated:YES];
}

- (IBAction)onCurrentBottomBarShownSwithChanged:(UISwitch *)sender {
    self.RFPrefersBottomBarShown = sender.on;
    [self updateNavigationAppearanceAnimated:YES];
}

@end
