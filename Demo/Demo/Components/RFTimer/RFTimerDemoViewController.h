//
//  RFTimerDemoViewController.h
//  RFDemo
//
//  Created by BB9z on 6/18/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import <RFKit/RFRuntime.h>

@class RFTimer;

@interface RFTimerDemoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButton;

@property (strong, nonatomic) RFTimer *timer;
@end
