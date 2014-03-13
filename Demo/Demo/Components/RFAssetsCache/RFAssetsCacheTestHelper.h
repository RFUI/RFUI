//
//  RFAssetsCacheTestHelper.h
//  RFDemo
//
//  Created by BB9z on 12/16/13.
//  Copyright (c) 2013 RFUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RFAssetsCacheTestHelper : NSObject
+ (instancetype)sharedInstance;

+ (NSData *)dataFromString:(NSString *)string;
+ (NSString *)stringFromData:(NSData *)data;

@end
