//
//  RFTableViewCellHeightDelegateAsynchronousDemoViewController.m
//  RFDemo
//
//  Created by BB9z on 7/7/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "RFTableViewCellHeightDelegateAsynchronousDemoViewController.h"
#import <RFKit/UIView+RFKit.h>

@interface RFTableViewCellHeightDelegateAsynchronousDemoViewController ()
@property (strong, nonatomic) NSArray *tableData;
@end

@implementation RFTableViewCellHeightDelegateAsynchronousDemoViewController
@dynamic tableData;

- (void)awakeFromNib {
    [super awakeFromNib];

    self.cellHeightManager = [[RFTableViewCellHeightDelegate alloc] init];

//    return;
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:20];
    for (int i = 1; i <= 20; i++) {
        NSMutableString *item = [NSMutableString new];
        for (int j = i; j > 0; j--) {
            [item appendFormat:@"%d<br>", j];
        }
        [data addObject:item];
    }
    self.tableData = data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellHeightManager.delegate = (id)self.tableView.delegate;
    self.tableView.delegate = self.cellHeightManager;
}

- (void)tableView:(UITableView *)tableView configureCell:(id)aCell forIndexPath:(NSIndexPath *)indexPath offscreenRendering:(BOOL)isOffscreenRendering {
    if (isOffscreenRendering) return;

    RDCHWebCell *cell = aCell;
    NSString *content = self.tableData[indexPath.row];
    NSString *html = [NSString stringWithFormat:@"<div style=\"line-height:1.5;color:#555\">%@</div>", content];
    cell.debugContent = content;
    [cell.webView loadHTMLString:html baseURL:nil];
}

- (NSString *)tableView:(UITableView *)tableView cellReuseIdentifierForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"WebCell";
}

- (IBAction)reloadTable:(id)sender {
//    [self.cellHeightManager invalidateCanonicalCellHeight];
    [self.cellHeightManager invalidateCellHeightCache];
    [self.tableView reloadData];
}

@end

#import "UIWebView+RFKit.h"

@implementation RDCHWebCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.webView.scrollView.bounces = NO;
    [self.webView clearBackgroundImages];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    _doutwork()
    self.heightLayoutConstraint.constant = webView.scrollView.contentSize.height;

    UITableView *tableView = (id)[self superviewOfClass:[UITableView class]];
    if (!tableView) return;
    NSIndexPath *indexPath = [tableView indexPathForCell:self];
    if (!indexPath) return;

    RFTableViewCellHeightDelegate *ch = [(RFTableViewCellHeightDelegateAsynchronousDemoViewController *)self.viewController cellHeightManager];
    if (![ch.canonicalCellHeight objectForKey:indexPath]) {
        CGFloat height = [ch calculateCellHeightWithCell:self tableView:tableView atIndexPath:indexPath];
        dout_float(height)
        [ch setCanonicalHeight:height atIndexPath:indexPath];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end
