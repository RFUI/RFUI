//
//  RFScrollViewPageControlDemoViewController.h
//  Demo
//
//  Created by BB9z on 13-7-11.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import <RFKit/RFKit.h>
#import "RFScrollViewPageControl.h"

@class SimplePageScrollView;

@interface RFScrollViewPageControlDemoViewController : UIViewController
@property(weak, nonatomic) IBOutlet SimplePageScrollView *scrollView;
@property(weak, nonatomic) IBOutlet RFScrollViewPageControl *pageControl;

// Config
@property(weak, nonatomic) IBOutlet UILabel *pageCountLabel;
@property(weak, nonatomic) IBOutlet UISlider *pageCountSlider;

- (IBAction)onPageCountSliderValueChanged:(UISlider *)sender;
- (IBAction)onSupportHalfPageSwitchChanged:(UISwitch *)sender;
@end


@interface SimplePageScrollView : UIScrollView
@property (assign, nonatomic) float pageCount;
@property (strong, nonatomic) NSMutableArray<UIView *> *pageViews;
@end
