//
//  RFTableViewCellHeightDelegateAsynchronousDemoViewController.h
//  RFDemo
//
//  Created by BB9z on 7/7/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "RFTableViewCellHeightDelegateDemoViewController.h"
#import "RFTableViewCellHeightDelegate.h"

@interface RFTableViewCellHeightDelegateAsynchronousDemoViewController : RFTableViewCellHeightDelegateDemoViewController
@property (strong, nonatomic) RFTableViewCellHeightDelegate *cellHeightManager;
@end

@interface RDCHWebCell : UITableViewCell <
    UIWebViewDelegate
>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayoutConstraint;
@end
