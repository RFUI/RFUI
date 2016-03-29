
#import "RFDTestEntity.h"
#import "RFUI.h"

@implementation RFDTestEntity

+ (JSONKeyMapper *)keyMapper {
    RFDTestEntity *this;
    return [[JSONKeyMapper alloc] initWithDictionary:@{
        @"id": @keypath(this, uid),
    }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
