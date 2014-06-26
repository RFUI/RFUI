//
//  RFSegueDelegateDemoViewController.h
//  RFDemo
//
//  Created by BB9z on 6/26/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "RFUI.h"
#import "RFSegueDelegate.h"

@interface RFSegueDelegateDemoViewController : UIViewController <
    RFSegueSourceDelegate,
    RFSegueDestinationDelegate,
    RFSegueReturnDelegate
>

@end
