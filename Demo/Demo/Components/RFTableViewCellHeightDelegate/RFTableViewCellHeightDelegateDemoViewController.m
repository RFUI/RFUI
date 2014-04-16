//
//  RFTableViewCellHeightDelegateDemoViewController.m
//  RFDemo
//
//  Created by BB9z on 4/14/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "RFTableViewCellHeightDelegateDemoViewController.h"
#import "dout.h"
#import "UITableView+RFKit.h"

@interface RFTableViewCellHeightDelegateDemoViewController ()
@property (strong, nonatomic) NSArray *tableData;
@end

@implementation RFTableViewCellHeightDelegateDemoViewController

- (void)awakeFromNib {
    [super awakeFromNib];

    self.tableData = @[
        @"ABC",
        @"ABC",
        @"123",
        @"123",
        @"1\n2\n3",
        @"1\n2\n3",
        @"[tableView dequeueReusableCellWithIdentifier:@\"RFTableViewCellHeightDelegateDemoCell\" forIndexPath:indexPath]",
        @"[tableView dequeueReusableCellWithIdentifier:@\"RFTableViewCellHeightDelegateDemoCell\" forIndexPath:indexPath]",
        @"[self tableView:tableView configCell:cell atIndexPath:indexPath]\nreturn cell;",
        @"[self tableView:tableView configCell:cell atIndexPath:indexPath]\nreturn cell;",
        @"- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {\n     return self.tableData.count;\n        }",
        @"- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {\n     return self.tableData.count;\n        }",
        @"@interface RFTableViewCellHeightDelegateDemoCell : UITableViewCell\n        @property (weak, nonatomic) IBOutlet UILabel *muiltLineLabel;\n        @end",
        @"@interface RFTableViewCellHeightDelegateDemoCell : UITableViewCell\n        @property (weak, nonatomic) IBOutlet UILabel *muiltLineLabel;\n        @end",
        @"RFTableViewCellHeightDelegateDemoViewController",
        @"RFTableViewCellHeightDelegateDemoViewController"
    ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self tableView:tableView cellReuseIdentifierForRowAtIndexPath:indexPath]];
    [self tableView:tableView configureCell:cell forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (void)tableView:(UITableView *)tableView configureCell:(id)cell forIndexPath:(NSIndexPath *)indexPath {
    RFTableViewCellHeightDelegateDemoCell *aCell = cell;
    aCell.muiltLineLabel.text = self.tableData[indexPath.row];
}

- (NSString *)tableView:(UITableView *)tableView cellReuseIdentifierForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row % 2)? @"Cell1": @"Cell2";
}

#pragma mark - Editing

- (IBAction)onEditItemTapped:(UIBarButtonItem *)sender {
    self.tableView.editing = !self.tableView.editing;
    self.editItem.title = self.tableView.editing? @"Done" : @"Edit";
}

@end

#import "RFPerformance.h"

@implementation RFTableViewCellHeightDelegateDemoCell
RFAlloctionLog

@end

@implementation RFTableViewCellHeightDelegateDemoLabel

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    self.preferredMaxLayoutWidth = bounds.size.width;
}

@end
