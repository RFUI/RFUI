//
//  RFTableViewCellHeightDelegateDemoViewController.h
//  RFDemo
//
//  Created by BB9z on 4/14/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFTableViewCellHeightDelegate.h"

@interface RFTableViewCellHeightDelegateDemoViewController : UITableViewController <
    RFTableViewCellHeightDataSource
>
@property (strong, nonatomic) NSArray *tableData;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editItem;
- (IBAction)onEditItemTapped:(UIBarButtonItem *)sender;

@end


@interface RFTableViewCellHeightDelegateDemoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *muiltLineLabel;
@end

@interface RFTableViewCellHeightDelegateDemoLabel : UILabel
@end
