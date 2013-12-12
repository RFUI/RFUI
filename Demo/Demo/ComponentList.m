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
    _douto(self.tableData);
}

#pragma mark - DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *info = [self.tableData objectAtIndex:indexPath.row];
    ComponentListCell *cell = [tableView dequeueReusableCellWithClass:[ComponentListCell class]];
    cell.componentInfo = info;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *info = [self.tableData objectAtIndex:indexPath.row];
    return [ComponentListCell cellHeightForInfo:info tableWidth:tableView.bounds.size.width];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *stroyboardName = [(ComponentListCell *)[tableView cellForRowAtIndexPath:indexPath] stroyboardName];
    if (stroyboardName) {
        UIViewController *vc = [[UIStoryboard storyboardWithName:stroyboardName bundle:nil] instantiateInitialViewController];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

static NSString *const TDkName     = @"Name";
static NSString *const TDkStatus   = @"Status";
static NSString *const TDkDetail   = @"Detail";
static NSString *const TDkHasDemo  = @"Has Demo";

@implementation ComponentListCell

+ (CGFloat)cellHeightForInfo:(NSDictionary *)componentInfo tableWidth:(CGFloat)tableWidth {
    CGFloat labelWidth = tableWidth - 11 - 7;
    CGSize labelSize = [componentInfo[TDkDetail] sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(labelWidth, CGFLOAT_MAX)];
    _dout_size(labelSize)
    return labelSize.height + 32 + 7;
}

- (void)setComponentInfo:(NSDictionary *)componentInfo {
    if (_componentInfo != componentInfo) {
        [self willChangeValueForKey:@keypath(self, componentInfo)];
        _componentInfo = componentInfo;
        
        BOOL hasDemo = [componentInfo boolForKey:TDkHasDemo];
        self.nameLabel.text = componentInfo[TDkName];
        self.statusLabel.text = componentInfo[TDkStatus];
        self.detialLabel.text = componentInfo[TDkDetail];
        self.accessoryType = (hasDemo)? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        self.selectionStyle = (hasDemo)? UITableViewCellSelectionStyleBlue : UITableViewCellSelectionStyleNone;
        
        [self didChangeValueForKey:@keypath(self, componentInfo)];
    }
}

- (NSString *)stroyboardName {
    if ([self.componentInfo boolForKey:TDkHasDemo]) {
        return self.componentInfo[TDkName];
    }
    return nil;
}

@end
