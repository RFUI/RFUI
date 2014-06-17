//
//  SimpleLogger.h
//  PropertyTest
//
//  Created by BB9z on 6/8/14.
//
//

#import <Foundation/Foundation.h>

@protocol SimpleLoggerDelegate;

@interface SimpleLogger : NSObject
+ (instancetype)sharedInstance;

@property (weak, nonatomic) id<SimpleLoggerDelegate> delegate;
@property (readonly, atomic) NSMutableString *buffer;

- (void)log:(NSString *)string;
- (void)clear;
@end

@protocol SimpleLoggerDelegate <NSObject>
@optional
- (void)logger:(SimpleLogger *)logger bufferChanged:(NSString *)newString;

@end
