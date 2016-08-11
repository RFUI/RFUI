//
//  UIViewController+RFDNavigationAppearance.m
//  RFDemo
//
//  Created by BB9z on 8/11/16.
//  Copyright © 2016 RFUI. All rights reserved.
//

#import "UIViewController+RFDNavigationAppearance.h"
#import "RFNavigationController.h"
#import "RFSynthesizeCategoryProperty.h"

@implementation UIViewController (RFDNavigationAppearance)

RFSynthesizeCategoryBoolProperty(RFPrefersStatusBarHidden, setRFPrefersStatusBarHidden)
RFSynthesizeCategoryBoolProperty(RFPrefersNavigationBarHidden, setRFPrefersNavigationBarHidden)
RFSynthesizeCategoryBoolProperty(RFPrefersBottomBarShown, setRFPrefersBottomBarShown)
RFSynthesizeCategoryObjectProperty(RFPreferredNavigationBarColor, setRFPreferredNavigationBarColor, UIColor *, OBJC_ASSOCIATION_COPY)
RFSynthesizeCategoryBoolProperty(RFPrefersLightContentBarStyle, setRFPrefersLightContentBarStyle)

- (NSDictionary<NSString *,id> *)RFNavigationAppearanceAttributes {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:10];
    dic[RFViewControllerPrefersStatusBarHiddenAttribute] = @(self.RFPrefersStatusBarHidden);
    dic[RFViewControllerPrefersNavigationBarHiddenAttribute] = @(self.RFPrefersNavigationBarHidden);
    dic[RFViewControllerPrefersBottomBarShownAttribute] = @(self.RFPrefersBottomBarShown);
    [dic rf_setObject:self.RFPreferredNavigationBarColor forKey:RFViewControllerPreferredNavigationBarTintColorAttribute];
    if (self.RFPrefersLightContentBarStyle) {
        dic[RFViewControllerPreferredStatusBarStyleAttribute] = @(UIStatusBarStyleLightContent);
        dic[RFViewControllerPreferredNavigationBarItemColorAttribute] = [UIColor whiteColor];
        dic[RFViewControllerPreferredNavigationBarTitleTextAttributes] = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
    }
    return dic;
}

@end
