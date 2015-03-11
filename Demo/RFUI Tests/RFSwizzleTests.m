//
//  RFUI_Tests.m
//  RFUI Tests
//
//  Created by BB9z on 3/11/15.
//  Copyright (c) 2015 RFUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RFSwizzle.h"
#import "RFSwizzleTestsObjects.h"
#import "metamacros.h"

@interface RFSwizzleTests : XCTestCase
@end

@implementation RFSwizzleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)exceptCalledFlagInA:(NSInteger)flagInA flagInACategory:(NSInteger)flagInACategory flagInB:(NSInteger)flagInB flagInBCategory:(NSInteger)flagInBCategory {
    NSString *exceptFlagString = [NSString stringWithFormat:@"%@, %@, %@, %@", @(flagInA), @(flagInACategory) , @(flagInB), @(flagInBCategory)];
    NSString *currentFlagString = [NSString stringWithFormat:@"%@, %@, %@, %@", @(CalledFlagInA), @(CalledFlagInACategory) , @(CalledFlagInB), @(CalledFlagInBCategory)];
    XCTAssert([exceptFlagString isEqualToString:currentFlagString], @"Except flag %@ not math current %@", exceptFlagString, currentFlagString);
}

- (void)testCallFlag {
    A *a = [A new];
    B *b = [B new];

    CalledFlagsReset();
    [a directMethod];
    [self exceptCalledFlagInA:1 flagInACategory:0 flagInB:0 flagInBCategory:0];

    CalledFlagsReset();
    [b directMethod];
    [self exceptCalledFlagInA:0 flagInACategory:0 flagInB:1 flagInBCategory:0];
}

- (void)testDirectMethod {
    A *a = [A new];
    B *b = [B new];

    RFSwizzleInstanceMethod(b.class, @selector(directMethod), @selector(swizzed_directMethod));

    CalledFlagsReset();
    [a directMethod];
    [self exceptCalledFlagInA:1 flagInACategory:0 flagInB:0 flagInBCategory:0];

    CalledFlagsReset();
    [b directMethod];
    [self exceptCalledFlagInA:0 flagInACategory:0 flagInB:0 flagInBCategory:1];
}

- (void)testOverwriteMethod {
    A *a = [A new];
    B *b = [B new];

    CalledFlagsReset();
    [b overwriteMethod];
    [self exceptCalledFlagInA:1 flagInACategory:0 flagInB:1 flagInBCategory:0];

    RFSwizzleInstanceMethod(b.class, @selector(overwriteMethod), @selector(swizzed_overwriteMethod));

    CalledFlagsReset();
    [b overwriteMethod];
    [self exceptCalledFlagInA:1 flagInACategory:0 flagInB:1 flagInBCategory:1];
}

- (void)testSwizzeMethodOnlyInAWithSuper {
    B *b = [B new];

    RFSwizzleInstanceMethod(b.class, @selector(methodOnlyInA), @selector(swizzed_methodOnlyInAWithSuper));
    CalledFlagsReset();
    [b methodOnlyInA];
    [self exceptCalledFlagInA:1 flagInACategory:0 flagInB:0 flagInBCategory:1];
}

- (void)testSwizzeMethodOnlyInAWithoutSuper {
    B *b = [B new];

    RFSwizzleInstanceMethod(b.class, @selector(methodOnlyInA), @selector(swizzed_methodOnlyInAWithoutSuper));
    CalledFlagsReset();
    [b methodOnlyInA];
    [self exceptCalledFlagInA:0 flagInACategory:0 flagInB:0 flagInBCategory:1];
}

- (void)testTwiceSwizzeBThenA {
    RFSwizzleInstanceMethod(B.class, @selector(directMethod), @selector(swizzed_directMethod));
    RFSwizzleInstanceMethod(A.class, @selector(directMethod), @selector(swizzed_directMethodJustForA));

    B *b = [B new];

    CalledFlagsReset();
    [b directMethod];

    // NS 0 0 0 1
    // JR 0 0 0 1
    [self exceptCalledFlagInA:0 flagInACategory:0 flagInB:0 flagInBCategory:1];

    RFSwizzleInstanceMethod(B.class, @selector(overwriteMethod), @selector(swizzed_overwriteMethod));
    RFSwizzleInstanceMethod(A.class, @selector(overwriteMethod), @selector(swizzed_overwriteMethodJustForA));

    CalledFlagsReset();
    [b overwriteMethod];

    // NS 1 1 1 1
    // JR 1 1 1 1
    [self exceptCalledFlagInA:1 flagInACategory:1 flagInB:1 flagInBCategory:1];
}

- (void)testTwiceSwizzeAThenB {
    RFSwizzleInstanceMethod(A.class, @selector(directMethod), @selector(swizzed_directMethodJustForA));
    RFSwizzleInstanceMethod(B.class, @selector(directMethod), @selector(swizzed_directMethod));

    B *b = [B new];

    CalledFlagsReset();
    [b directMethod];

    // NS 0 0 0 1
    // JR 0 0 0 1
    [self exceptCalledFlagInA:0 flagInACategory:0 flagInB:0 flagInBCategory:1];

    RFSwizzleInstanceMethod(A.class, @selector(overwriteMethod), @selector(swizzed_overwriteMethodJustForA));
    RFSwizzleInstanceMethod(B.class, @selector(overwriteMethod), @selector(swizzed_overwriteMethod));

    CalledFlagsReset();
    [b overwriteMethod];

    // NS 1 1 1 1
    // JR 1 1 1 1
    [self exceptCalledFlagInA:1 flagInACategory:1 flagInB:1 flagInBCategory:1];
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
