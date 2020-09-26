
#import "RFAssetsCacheTestHelper.h"

@interface RFAssetsCacheTestHelper ()

@end

@implementation RFAssetsCacheTestHelper
+ (instancetype)sharedInstance {
	static RFAssetsCacheTestHelper *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = self.new;
    });
	return sharedInstance;
}

+ (NSData *)dataFromString:(NSString *)string {
    return [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
}

+ (NSString *)stringFromData:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
