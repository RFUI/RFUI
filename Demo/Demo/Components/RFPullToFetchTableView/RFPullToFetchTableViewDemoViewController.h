//
//  RFPullToFetchTableViewDemoViewController.h
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "RFUI.h"
#import "RFSidePanel.h"
#import "RFPullToFetchTableView.h"

@interface RFPullToFetchTableViewDemoViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet RFPullToFetchTableView *tableView;

@property (assign, nonatomic) int pageSize;
@property (assign, nonatomic) int currentPageIndex;
@end
