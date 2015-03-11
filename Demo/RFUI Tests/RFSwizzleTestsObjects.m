
#import "RFSwizzleTestsObjects.h"
#import <XCTest/XCTest.h>

NSInteger CalledFlagInA, CalledFlagInACategory, CalledFlagInB, CalledFlagInBCategory;

void CalledFlagsReset(void) {
    CalledFlagInA = 0;
    CalledFlagInACategory = 0;
    CalledFlagInB = 0;
    CalledFlagInBCategory = 0;
}

@implementation A

- (void)directMethod {
    CalledFlagInA++;
}

- (void)overwriteMethod {
    CalledFlagInA++;
}

- (void)methodOnlyInA {
    CalledFlagInA++;
}

@end


@implementation A (Swizzing)

- (void)swizzed_directMethodJustForA {
    CalledFlagInACategory++;
}

- (void)swizzed_overwriteMethodJustForA {
    [self swizzed_overwriteMethodJustForA];
    CalledFlagInACategory++;
}

@end


@implementation B

- (void)directMethod {
    CalledFlagInB++;
}

- (void)overwriteMethod {
    [super overwriteMethod];
    CalledFlagInB++;
}

@end

@implementation B (Swizzing)

- (void)swizzed_directMethod {
    CalledFlagInBCategory++;
}

- (void)swizzed_overwriteMethod {
    [self swizzed_overwriteMethod];
    CalledFlagInBCategory++;
}

- (void)swizzed_methodOnlyInAWithSuper {
    [self swizzed_methodOnlyInAWithSuper];
    CalledFlagInBCategory++;
}

- (void)swizzed_methodOnlyInAWithoutSuper {
    CalledFlagInBCategory++;
}

@end

