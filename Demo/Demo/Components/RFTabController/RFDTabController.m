//
//  RFDTabBarRootController.m
//  RFDemo
//
//  Created by BB9z on 5/19/15.
//  Copyright (c) 2015 RFUI. All rights reserved.
//

#import "RFDTabController.h"

@interface RFDBasicTabController ()
@end

@implementation RFDBasicTabController

- (UIViewController *)tab1ViewController {
    if (_tab1ViewController) return _tab1ViewController;

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"T1"];
    _tab1ViewController = vc;
    return _tab1ViewController;
}

- (UIViewController *)tab2ViewController {
    if (_tab2ViewController) return _tab2ViewController;

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"T2"];
    _tab2ViewController = vc;
    return _tab2ViewController;
}

- (UIViewController *)tab3ViewController {
    if (_tab3ViewController) return _tab3ViewController;

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"T3"];
    _tab3ViewController = vc;
    return _tab3ViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = [NSArray arrayWithObjects:self.tab1ViewController, self.tab2ViewController, self.tab3ViewController, nil];
    self.delegate = self;
}

- (IBAction)onTabButtonTapped:(UIButton *)sender {
    [self setSelectedIndex:sender.tag animated:YES];
}

- (IBAction)onSimulateMemoryWarningButtonTapped:(id)sender {
    [self didReceiveMemoryWarning];
}

#pragma mark - RFTabControllerDelegate

- (BOOL)RFTabController:(RFTabController *)tabController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    return self.shouldChangeSelectionSwitch.on;
}

@end



@interface RFDPageTabController ()
@end

@implementation RFDPageTabController

- (UIViewController *)tab1ViewController {
    if (_tab1ViewController) return _tab1ViewController;

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"T1"];
    _tab1ViewController = vc;
    return _tab1ViewController;
}

- (UIViewController *)tab2ViewController {
    if (_tab2ViewController) return _tab2ViewController;

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"T2"];
    _tab2ViewController = vc;
    return _tab2ViewController;
}

- (UIViewController *)tab3ViewController {
    if (_tab3ViewController) return _tab3ViewController;

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"T3"];
    _tab3ViewController = vc;
    return _tab3ViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = [NSArray arrayWithObjects:self.tab1ViewController, self.tab2ViewController, self.tab3ViewController, nil];
    self.delegate = self;
}

- (IBAction)onTabButtonTapped:(UIButton *)sender {
    [self setSelectedIndex:sender.tag animated:YES];
}

- (IBAction)onShouldChangeSelectionSwitchChanged:(id)sender {
    self.selectedViewController = self.selectedViewController;
}

- (IBAction)onSimulateMemoryWarningButtonTapped:(id)sender {
    [self didReceiveMemoryWarning];
}

#pragma mark - RFTabControllerDelegate

- (BOOL)RFTabController:(RFTabController *)tabController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    if (viewController == tabController.selectedViewController) {
        doutwork()
        return YES;
    }
    return self.shouldChangeSelectionSwitch.on;
}

@end

