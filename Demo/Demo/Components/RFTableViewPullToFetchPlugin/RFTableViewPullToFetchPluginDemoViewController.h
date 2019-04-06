//
//  RFPullToFetchTableViewDemoViewController.h
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import <RFKit/RFKit.h>
#import "RFSidePanel.h"
#import "RFTableViewPullToFetchPlugin.h"

@interface RFTableViewPullToFetchPluginDemoViewController : UIViewController <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet RFTableViewPullToFetchPlugin *pullToFetchControl;

@property (assign, nonatomic) int pageSize;
@property (assign, nonatomic) int currentPageIndex;
@end
