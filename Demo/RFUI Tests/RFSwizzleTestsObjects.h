//
//  RFSwizzleTestsObjects.h
//  RFDemo
//
//  Created by BB9z on 3/11/15.
//  Copyright (c) 2015 RFUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface A : NSObject

- (void)directMethod;
- (void)overwriteMethod NS_REQUIRES_SUPER;
- (void)methodOnlyInA;

@end

@interface A (Swizzing)

- (void)swizzed_directMethodJustForA;
- (void)swizzed_overwriteMethodJustForA;

@end

@interface B : A

@end

@interface B (Swizzing)

- (void)swizzed_directMethod;
- (void)swizzed_overwriteMethod;

- (void)swizzed_methodOnlyInAWithSuper;
- (void)swizzed_methodOnlyInAWithoutSuper;

@end

NSInteger CalledFlagInA, CalledFlagInACategory, CalledFlagInB, CalledFlagInBCategory;

extern void CalledFlagsReset(void);
