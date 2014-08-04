//
//  ComponentList.m
//  Demo
//
//  Created by BB9z on 13-7-10.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "ComponentList.h"
#import "RFUI.h"

@implementation ComponentList

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ComponentList" ofType:@"plist"];
    self.tableData = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
}

#pragma mark - DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:[self tableView:tableView cellReuseIdentifierForRowAtIndexPath:indexPath]];
    [self tableView:tableView configureCell:cell forIndexPath:indexPath offscreenRendering:NO];
    return cell;
}

#pragma mark - Delegate
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

#pragma mark - RFTableViewCellHeightDelegate

- (NSString *)tableView:(UITableView *)tableView cellReuseIdentifierForRowAtIndexPath:(NSIndexPath *)indexPath {
    return NSStringFromClass([ComponentListCell class]);
}

- (void)tableView:(UITableView *)tableView configureCell:(id)cell forIndexPath:(NSIndexPath *)indexPath offscreenRendering:(BOOL)isOffscreenRendering {
    [(ComponentListCell *)cell setComponentInfo:self.tableData[indexPath.row]];
}

@end

static NSString *const TDkName     = @"Name";
static NSString *const TDkStatus   = @"Status";
static NSString *const TDkDetail   = @"Detail";
static NSString *const TDkHasDemo  = @"Has Demo";

@implementation ComponentListCell

- (void)setComponentInfo:(NSDictionary *)componentInfo {
    if (_componentInfo != componentInfo) {
        _componentInfo = componentInfo;
        
        BOOL hasDemo = [componentInfo boolForKey:TDkHasDemo];
        self.nameLabel.text = componentInfo[TDkName];
        self.statusLabel.text = componentInfo[TDkStatus];
        self.detialLabel.text = componentInfo[TDkDetail];
        self.accessoryType = (hasDemo)? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        self.selectionStyle = (hasDemo)? UITableViewCellSelectionStyleBlue : UITableViewCellSelectionStyleNone;
    }
}

- (NSString *)stroyboardName {
    if ([self.componentInfo boolForKey:TDkHasDemo]) {
        return self.componentInfo[TDkName];
    }
    return nil;
}

@end
