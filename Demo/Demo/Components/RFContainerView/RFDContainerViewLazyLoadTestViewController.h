//
//  RFDContainerViewLazyLoadTestViewController.h
//  RFDemo
//
//  Created by BB9z on 7/18/15.
//  Copyright (c) 2015 RFUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFContainerView.h"

@interface RFDContainerViewLazyLoadTestViewController : UIViewController

@property (weak, nonatomic) IBOutlet RFContainerView *container1;
@property (weak, nonatomic) IBOutlet UIButton *loadButton1;
@property (weak, nonatomic) IBOutlet RFContainerView *container2;
@property (weak, nonatomic) IBOutlet UIButton *loadButton2;

@end
