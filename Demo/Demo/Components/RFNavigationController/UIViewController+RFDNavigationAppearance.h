//
//  UIViewController+RFDNavigationAppearance.h
//  RFDemo
//
//  Created by BB9z on 8/11/16.
//  Copyright © 2016 RFUI. All rights reserved.
//

#import "RFNavigationController.h"

@interface UIViewController (RFDNavigationAppearance)

@property IBInspectable BOOL RFPrefersStatusBarHidden;

@property IBInspectable BOOL RFPrefersNavigationBarHidden;

@property IBInspectable BOOL RFPrefersBottomBarShown;

@property (nullable, copy) IBInspectable UIColor *RFPreferredNavigationBarColor;

@property IBInspectable BOOL RFPrefersLightContentBarStyle;

- (nullable NSMutableDictionary<RFViewControllerAppearanceAttributeKey, id> *)RFNavigationAppearanceAttributes;

@end
