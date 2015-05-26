//
//  RFDTabBarRootController.h
//  RFDemo
//
//  Created by BB9z on 5/19/15.
//  Copyright (c) 2015 RFUI. All rights reserved.
//

#import "RFTabController.h"

@interface RFDBasicTabController : RFTabController <
    RFTabControllerDelegate
>
@property (strong, nonatomic) UIViewController *tab1ViewController;
@property (strong, nonatomic) UIViewController *tab2ViewController;
@property (strong, nonatomic) UIViewController *tab3ViewController;

@property (weak, nonatomic) IBOutlet UISwitch *shouldChangeSelectionSwitch;
@end

#import "RFPageTabController.h"

@interface RFDPageTabController : RFPageTabController <
    RFTabControllerDelegate
>
@property (strong, nonatomic) UIViewController *tab1ViewController;
@property (strong, nonatomic) UIViewController *tab2ViewController;
@property (strong, nonatomic) UIViewController *tab3ViewController;

@property (weak, nonatomic) IBOutlet UISwitch *shouldChangeSelectionSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scrollEnabledSwitch;
@end

@interface RFDDataSourcePageTabController : RFDPageTabController <
    RFTabControllerDataSource
>
@property (weak, nonatomic) IBOutlet UISwitch *shouldUnloadFirstViewController;
@end
