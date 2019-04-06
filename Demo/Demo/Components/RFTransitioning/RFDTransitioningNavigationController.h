//
//  RFTransitioningDemoNavigationController.h
//  RFDemo
//
//  Created by BB9z on 7/30/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import <RFKit/RFRuntime.h>

@interface RFDTransitioningNavigationController : UINavigationController

@end

@interface RFDTransitioningNavigationBar : UINavigationBar
@end

@interface RFDTransitioningBarHiddenControl : NSObject <
    UINavigationControllerDelegate
>
@end
