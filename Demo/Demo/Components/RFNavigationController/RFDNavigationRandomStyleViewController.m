
#import "RFDNavigationRandomStyleViewController.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

static double LightDetectFactor = 0.7;

@interface RFDNavigationRandomStyleViewController ()
@property NSDictionary *navigationAppearanceAttributes;
@property BOOL isLightStyle;
@end

@implementation RFDNavigationRandomStyleViewController

- (void)awakeFromNib {
    [super awakeFromNib];

    CGFloat hue = arc4random()%255/255.f;
    CGFloat saturation = arc4random()%255/255.f;
    CGFloat brightness = arc4random()%255/255.f;
    UIColor *themeColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    BOOL isLightStyle = brightness < LightDetectFactor;
    UIColor *itemColor = [UIColor colorWithHue:hue saturation:saturation *1.2 brightness:isLightStyle? .9 : .1 alpha:1];

    NSArray *choice = @[ @"RFD", @"Navigation", @"Random", @"StyleViewController", @"RFDNavigationRandomStyleViewController" ];
    self.title = [choice objectAtIndex:arc4random_uniform((u_int32_t)choice.count)];

    self.navigationAppearanceAttributes = @{
        RFViewControllerPrefersNavigationBarHiddenAttribute : @(arc4random_uniform(4) == 0),
        RFViewControllerPrefersBottomBarShownAttribute : @(arc4random_uniform(2) == 0),
        RFViewControllerPreferredNavigationBarTintColorAttribute : themeColor,
        RFViewControllerPreferredNavigationBarItemColorAttribute : itemColor,
        RFViewControllerPreferredNavigationBarTitleTextAttributes : @{ NSForegroundColorAttributeName : itemColor, NSFontAttributeName : [UIFont boldSystemFontOfSize:(arc4random_uniform(6) + 14)] }
    };
}

- (BOOL)prefersStatusBarHidden {
    return arc4random_uniform(4) == 0;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.isLightStyle? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}

- (NSDictionary<NSString *,id> *)RFNavigationAppearanceAttributes {
    return self.navigationAppearanceAttributes;
}

- (IBAction)onBackToRoot:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
