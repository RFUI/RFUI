//
//  ComponentList.m
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "ComponentList.h"
#import "RFUI.h"

@interface ComponentList ()
@property(strong, nonatomic) NSArray<NSDictionary *> *tableData;
@end

@implementation ComponentList

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSString *plistPath = [NSBundle.mainBundle pathForResource:@"ComponentList" ofType:@"plist"];
    self.tableData = [NSArray.alloc initWithContentsOfFile:plistPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ComponentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.item = self.tableData[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *stroyboardName = [(ComponentListCell *)[tableView cellForRowAtIndexPath:indexPath] stroyboardName];
    if (stroyboardName) {
        UIViewController *vc = [[UIStoryboard storyboardWithName:stroyboardName bundle:nil] instantiateInitialViewController];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            [self presentViewController:vc animated:YES completion:nil];
        }
        else {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

static NSString *const TDkName     = @"Name";
static NSString *const TDkStatus   = @"Status";
static NSString *const TDkDetail   = @"Detail";
static NSString *const TDkHasDemo  = @"Has Demo";

@implementation ComponentListCell

- (void)setItem:(NSDictionary *)item {
    _item = item;
    
    BOOL hasDemo = [item boolForKey:TDkHasDemo];
    self.nameLabel.text = item[TDkName];
    self.statusLabel.text = item[TDkStatus];
    self.detialLabel.text = item[TDkDetail];
    self.accessoryType = (hasDemo)? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    self.selectionStyle = (hasDemo)? UITableViewCellSelectionStyleBlue : UITableViewCellSelectionStyleNone;
}

- (NSString *)stroyboardName {
    if ([self.item boolForKey:TDkHasDemo]) {
        return self.item[TDkName];
    }
    return nil;
}

@end
