//
//  RFPullToFetchTableViewDemoViewController.m
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "RFTableViewPullToFetchPluginDemoViewController.h"
#import "RFPullToFetchTableViewConfigViewController.h"
#import "UIView+RFAnimate.h"

static NSTimeInterval DebugFetchDelay = 1;
static int DebugMaxItemCount = 20;

@interface RFTableViewPullToFetchPluginDemoViewController ()
// For convenience, we don not use real data here.
@property (assign, nonatomic) int cellCount;
@end

@implementation RFTableViewPullToFetchPluginDemoViewController
RFUIInterfaceOrientationSupportAll

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupPanel];
    [self setupPullToFetchDisplay];
    [self setupPullToFetchData];
    
    self.pageSize = 3;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dispatch_after_seconds(1, ^{
        [self.pullToFetchControl triggerHeaderProcess];
    });
}

- (void)setupPanel {
    RFSidePanel *sp = [[RFSidePanel alloc] initWithNibName:@"RFSidePanel" bundle:nil];
    sp.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    CGRect frame = self.view.bounds;
    frame.size.width = 200;
    sp.view.frame = frame;
    [self addChildViewController:sp intoView:self.view];
    [sp hide:NO];
    
    RFPullToFetchTableViewConfigViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifierUsingClass:[RFPullToFetchTableViewConfigViewController class]];
    cvc.master = self;
    sp.rootViewController = cvc;
}

- (void)setupPullToFetchDisplay {
    RFTableViewPullToFetchPlugin *control = self.pullToFetchControl;
    UITableView *tableView = self.tableView;

    control.headerContainer = tableView.tableHeaderView;
    tableView.tableHeaderView = nil;

    control.footerContainer = tableView.tableFooterView;
    tableView.tableFooterView = nil;

    [control setHeaderStatusChangeBlock:^(RFTableViewPullToFetchPlugin *control, id indicatorView, RFPullToFetchIndicatorStatus status, CGFloat visibleHeight, UITableView *tableView) {
        UILabel *label = indicatorView;
        switch (status) {
            case RFPullToFetchIndicatorStatusProcessing:
                label.text = @"Refreshing...";
                return;

            case RFPullToFetchIndicatorStatusDragging: {
                BOOL isCompleteVisible = !!(visibleHeight >= label.height);
                label.text = isCompleteVisible? @"Release to refresh." : @"Pull to refresh.";
                return;
            }
            case RFPullToFetchIndicatorStatusDecelerating:
                label.text = @"Pull to refresh.";
                return;

            default:
                break;
        }
    }];

    [control setFooterStatusChangeBlock:^(RFTableViewPullToFetchPlugin *control, id indicatorView, RFPullToFetchIndicatorStatus status, CGFloat visibleHeight, UITableView *tableView) {
        UILabel *label = indicatorView;
        switch (status) {
            case RFPullToFetchIndicatorStatusFrozen:
                label.text = @"No more";
                return;

            case RFPullToFetchIndicatorStatusProcessing:
                label.text = @"Loading...";
                return;

            case RFPullToFetchIndicatorStatusDragging: {
                BOOL isCompleteVisible = !!(visibleHeight >= label.height);
                label.text = isCompleteVisible? @"Release to load more." : @"Pull to load more.";
                return;
            }
            case RFPullToFetchIndicatorStatusDecelerating:
                label.text = @"Pull to load more.";
                return;
                
            case RFPullToFetchIndicatorStatusWaiting:
                break;
        }
    }];
}

- (void)setupPullToFetchData {
    @weakify(self);
    [self.pullToFetchControl setHeaderProcessBlock:^{
        @strongify(self);
        self.cellCount = 0;

        dispatch_after_seconds(DebugFetchDelay, ^{
            self.cellCount = self.pageSize;
            [self.pullToFetchControl markProcessFinshed];
        });
    }];
    
    [self.pullToFetchControl setFooterProcessBlock:^{
        @strongify(self);

        dispatch_after_seconds(DebugFetchDelay, ^{
            self.cellCount += self.pageSize;
            [self.pullToFetchControl markProcessFinshed];
        });
    }];
}

#pragma mark - TableView data
- (void)setCellCount:(int)cellCount {
    if (DebugMaxItemCount && cellCount > DebugMaxItemCount) {
        self.pullToFetchControl.footerReachEnd = YES;
        cellCount = DebugMaxItemCount;
    }
    
    if (_cellCount != cellCount) {
        int orgCount = _cellCount;
        _dout_int(_cellCount)
        _dout_int(cellCount)
        
        _cellCount = cellCount;
        
        if (cellCount > orgCount) {
            [self.tableView insertRowsAtIndexPaths:[self indexPathsForRange:(NSRange){orgCount, fabs(cellCount-orgCount)}] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        else {
            [self.tableView deleteRowsAtIndexPaths:[self indexPathsForRange:(NSRange){fminf(orgCount, cellCount), fabs(cellCount-orgCount)}] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}

- (NSArray *)indexPathsForRange:(NSRange)range {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:range.length];
    for (NSUInteger i = 0; i < range.length; i++) {
        [array addObject:[NSIndexPath indexPathForRow:range.location+i inSection:0]];
    }
    return array;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}

@end
