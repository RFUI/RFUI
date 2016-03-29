//
//  RFDTestEntity.h
//  RFDemo
//
//  Created by BB9z on 3/29/16.
//  Copyright © 2016 RFUI. All rights reserved.
//

#import "JSONModel.h"

@interface RFDTestEntity : JSONModel
@property (assign, nonatomic) int uid;
@property (strong, nonatomic) NSString *name;
@end

@protocol RFDTestEntity <NSObject>
@end
