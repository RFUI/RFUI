//
//  ComponentList.h
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComponentList : UITableViewController
@end


@interface ComponentListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *detialLabel;

@property (nonatomic) NSDictionary *item;

- (NSString *)stroyboardName;

@end
