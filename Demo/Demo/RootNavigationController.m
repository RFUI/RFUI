//
//  RootNavigationController.m
//  RFDemo
//
//  Created by BB9z on 5/30/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "RootNavigationController.h"

@implementation RootNavigationController
RFUIInterfaceOrientationSupportNavigation

- (UIViewController *)childViewControllerForStatusBarStyle {
    if (self.presentedViewController) {
        return self.presentedViewController;
    }
    return self.topViewController;
}

@end
