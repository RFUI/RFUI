//
//  RFDMagicMoveDestinationViewController.h
//  RFDemo
//
//  Created by BB9z on 7/30/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "UIViewController+RFTransitioning.h"
#import "RFMagicMoveTransitioning.h"

@interface RFDMagicMoveDestinationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *c;
@property (weak, nonatomic) IBOutlet UIView *d;
@end

@interface RFDSampleMagicMoveTransitioning : RFMagicMoveTransitioning

@end
