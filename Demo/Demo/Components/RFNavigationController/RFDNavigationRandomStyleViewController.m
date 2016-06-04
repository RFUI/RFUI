
#import "RFDNavigationRandomStyleViewController.h"

static double LightDetectFactor = 0.7;

@interface RFDNavigationRandomStyleViewController ()
@property (nonatomic, strong) UIColor *themeColor;
@property (nonatomic, strong) UIColor *itemColor;
@property (nonatomic) BOOL hideStatusBar;
@property (nonatomic) BOOL hideNavigationBar;
@property (nonatomic) BOOL hideBottomBar;
@end

@implementation RFDNavigationRandomStyleViewController
RFUIInterfaceOrientationSupportAll

- (void)awakeFromNib {
    [super awakeFromNib];

    self.hideStatusBar = arc4random_uniform(4) == 0;
    self.hideNavigationBar = arc4random_uniform(4) == 0;
    self.hideBottomBar = arc4random_uniform(2) == 0;

    CGFloat hue = arc4random()%255/255.f;
    CGFloat saturation = arc4random()%255/255.f;
    CGFloat brightness = arc4random()%255/255.f;
    UIColor *themeColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.themeColor = themeColor;


    self.itemColor = [UIColor colorWithHue:hue saturation:saturation *1.2 brightness:brightness < LightDetectFactor? .9 : .1 alpha:1];

    NSArray *choice = @[ @"RFD", @"Navigation", @"Random", @"StyleViewController", @"RFDNavigationRandomStyleViewController" ];
    self.title = [choice objectAtIndex:arc4random_uniform((u_int32_t)choice.count)];
}

- (BOOL)prefersStatusBarHidden {
    return self.hideStatusBar;
}

- (BOOL)prefersNavigationBarHidden {
    return self.hideNavigationBar;
}

- (BOOL)prefersBottomBarShown {
    return self.hideBottomBar;
}

- (UIColor *)preferredNavigationBarTintColor {
    return self.themeColor;
}

- (UIColor *)preferredNavigationBarItemColor {
    return self.itemColor;
}

- (NSDictionary<NSString *,id> *)preferredNavigationBarTitleTextAttributes {
    return @{ NSForegroundColorAttributeName : self.itemColor, NSFontAttributeName : [UIFont boldSystemFontOfSize:(arc4random_uniform(6) + 14)] };
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.hideNavigationBar) return UIStatusBarStyleDefault;

    CGFloat brightness = 0;
    [self.themeColor getHue:nil saturation:nil brightness:&brightness alpha:nil];
    UIStatusBarStyle style = UIStatusBarStyleDefault;
    style = brightness < LightDetectFactor? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;;
    return style;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    NSArray *choice = @[ @(UIStatusBarAnimationNone), @(UIStatusBarAnimationFade), @(UIStatusBarAnimationSlide) ];
    return (UIStatusBarAnimation)[choice[(NSUInteger)arc4random_uniform((u_int32_t)choice.count)] integerValue];
}

- (IBAction)onBackToRoot:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
