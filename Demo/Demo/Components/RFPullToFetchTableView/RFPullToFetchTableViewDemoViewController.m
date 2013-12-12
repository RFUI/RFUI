//
//  RFPullToFetchTableViewDemoViewController.m
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "RFPullToFetchTableViewDemoViewController.h"
#import "RFPullToFetchTableViewConfigViewController.h"

static NSTimeInterval DebugFetchDelay = 1;
static int DebugMaxItemCount = 20;

@interface RFPullToFetchTableViewDemoViewController ()
// For convenience, we don not use real data here.
@property (assign, nonatomic) int cellCount;

@property (strong, nonatomic) UILabel *headerView;
@property (strong, nonatomic) UILabel *footerView;
@end

@implementation RFPullToFetchTableViewDemoViewController
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
        [self.tableView triggerHeaderProccess];
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
    RFPullToFetchTableView *tableView = self.tableView;
    self.headerView = (UILabel *)tableView.tableHeaderView;
    tableView.tableHeaderView = nil;
    
    tableView.headerContainer = self.headerView;
    [tableView addSubview:self.headerView];
    
    @weakify(self);
    [tableView setHeaderVisibleChangeBlock:^(BOOL isVisible, CGFloat visibleHeight, BOOL isCompleteVisible, BOOL isProccessing) {
        dout(@"header visible = %@", @(isVisible))
        @strongify(self);
        
        if (isProccessing) {
            self.headerView.text = @"Refreshing...";
            return;
        }
        
        if (isCompleteVisible) {
            self.headerView.text = @"Release to refresh.";
            return;
        }
        
        if (isVisible) {
            self.headerView.text = @"Pull to refresh.";
        }
    }];
    
    
    self.footerView = (UILabel *)tableView.tableFooterView;
    tableView.tableFooterView = nil;
    
    tableView.footerContainer = self.footerView;
    [tableView addSubview:self.footerView];
    
    [tableView setFooterVisibleChangeBlock:^(BOOL isVisible, CGFloat visibleHeight, BOOL isCompleteVisible, BOOL isProccessing, BOOL reachEnd) {
        dout(@"footer visible = %@", @(isVisible))
        
        @strongify(self);
        if (reachEnd) {
            self.footerView.text = @"No more";
            return;
        }
        
        if (isProccessing) {
            self.footerView.text = @"Loading...";
            return;
        }
        
        if (isCompleteVisible) {
            self.footerView.text = @"Release to load more.";
            return;
        }
        
        if (isVisible) {
            self.footerView.text = @"Pull to load more.";
        }
    }];
}

- (void)setupPullToFetchData {
    [self.tableView setHeaderProccessBlock:^{
        self.cellCount = 0;
        
        dispatch_after_seconds(DebugFetchDelay, ^{
            self.cellCount = self.pageSize;
            [self.tableView headerProccessFinshed];
        });
    }];
    
    [self.tableView setFooterProccessBlock:^{
        dispatch_after_seconds(DebugFetchDelay, ^{
            self.cellCount += self.pageSize;
            [self.tableView footerProccessFinshed];
        });
    }];
}

#pragma mark - TableView data
- (void)setCellCount:(int)cellCount {
    if (DebugMaxItemCount && cellCount > DebugMaxItemCount) {
        self.tableView.footerReachEnd = YES;
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
