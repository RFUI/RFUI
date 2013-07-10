//
//  ComponentList.h
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComponentList : UITableViewController
@property(strong, nonatomic) NSMutableArray *tableData;

@end


@interface ComponentListCell : UITableViewCell
@property(weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet UILabel *statusLabel;
@property(weak, nonatomic) IBOutlet UILabel *detialLabel;

@property(strong, nonatomic) NSDictionary *componentInfo;

+ (CGFloat)cellHeightForInfo:(NSDictionary *)componentInfo tableWidth:(CGFloat)tableWidth;
- (NSString *)stroyboardName;

@end
