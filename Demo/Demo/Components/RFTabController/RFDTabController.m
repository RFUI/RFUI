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

- (void)awakeFromNib {
    [super awakeFromNib];
    self.viewControllers = [NSArray arrayWithObjects:self.tab1ViewController, self.tab2ViewController, self.tab3ViewController, nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (IBAction)onTabButtonTapped:(UIButton *)sender {
    [self setSelectedIndex:sender.tag animated:YES completion:nil];
}

- (IBAction)onSimulateMemoryWarningButtonTapped:(id)sender {
    [self didReceiveMemoryWarning];
}

#pragma mark - RFTabControllerDelegate

- (BOOL)RFTabController:(RFTabController *)tabController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    return self.shouldChangeSelectionSwitch.on;
}

- (void)RFTabController:(RFTabController *)tabController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    doutwork()
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
    [self setup];
}

- (void)setup {
    self.viewControllers = [NSArray arrayWithObjects:self.tab1ViewController, self.tab2ViewController, self.tab3ViewController, nil];
    self.delegate = self;
}

- (IBAction)onReload:(id)sender {
    self.tab1ViewController = nil;
    self.tab2ViewController = nil;
    self.tab3ViewController = nil;
    self.viewControllers = [NSArray arrayWithObjects:self.tab1ViewController, self.tab2ViewController, self.tab3ViewController, nil];
}

- (IBAction)onTabButtonTapped:(UIButton *)sender {
    [self setSelectedIndex:sender.tag animated:YES completion:nil];
}

- (IBAction)onShouldChangeSelectionSwitchChanged:(id)sender {
    self.selectedViewController = self.selectedViewController;
}

- (IBAction)onScrollEnabledSwitchChanged:(UISwitch *)sender {
    self.scrollEnabled = sender.on;
}

- (IBAction)onSimulateMemoryWarningButtonTapped:(id)sender {
    [self didReceiveMemoryWarning];
}

#pragma mark - RFTabControllerDelegate

- (BOOL)RFTabController:(RFTabController *)tabController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    doutwork()
    return self.shouldChangeSelectionSwitch.on;
}

- (void)RFTabController:(RFTabController *)tabController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index {
    doutwork()
}

@end


@implementation RFDDataSourcePageTabController

- (void)setup {
    self.dataSource = self;
    self.viewControllers = nil;
    self.tab1ViewController = nil;
    self.tab2ViewController = nil;
    self.tab3ViewController = nil;
}

- (NSUInteger)RFNumberOfViewControllerInTabController:(RFTabController *)tabController {
    doutwork()
    return 3;
}

- (UIViewController *)RFTabController:(RFTabController *)tabController viewControllerAtIndex:(NSUInteger)index {
    doutwork()
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"T%d", (int)(index + 1)]];
    return vc;
}

- (BOOL)RFTabController:(RFTabController *)tabController shouldUnlodadViewControllerAtIndex:(NSUInteger)index {
    if (index) return YES;

    return self.shouldUnloadFirstViewController.on;
}

@end

