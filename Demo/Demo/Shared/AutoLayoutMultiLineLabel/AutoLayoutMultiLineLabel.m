//
//  AutoLayoutMultiLineLabel.m
//  RFDemo
//
//  Created by BB9z on 5/30/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import "AutoLayoutMultiLineLabel.h"

@implementation AutoLayoutMultiLineLabel

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    self.preferredMaxLayoutWidth = bounds.size.width;
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    if (size.width == 0) {
        size.width = self.preferredMaxLayoutWidth;
    }

    if (size.height < 22) {
        size.height = 22;
    }
    return size;
}

@end
