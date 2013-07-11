//
//  RFScrollViewPageControlDemoViewController.h
//  Demo
//
//  Created by BB9z on 13-7-11.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "RFUI.h"
#import "RFScrollViewPageControl.h"

@interface RFScrollViewPageControlDemoViewController : UIViewController
<UIScrollViewDelegate>

@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(weak, nonatomic) IBOutlet RFScrollViewPageControl *pageControl;

// Config
@property(assign, nonatomic) float pageCount;
@property(weak, nonatomic) IBOutlet UILabel *pageCountLabel;
@property(weak, nonatomic) IBOutlet UISlider *pageCountSlider;
- (IBAction)onPageCountSliderValueChanged:(UISlider *)sender;
- (IBAction)onSupportHalfPageSwitchChanged:(UISwitch *)sender;
@end
