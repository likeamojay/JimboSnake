//
//  WallOfFameVIewControllerTest.m
//  JimboSnake
//
//  Created by James Lane on 12/10/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "WallofFameViewController.h"

@interface WallOfFameVIewControllerTest : XCTestCase
@property (strong,nonatomic) WallofFameViewController *test;

@end

@implementation WallOfFameVIewControllerTest

- (void)setUp {
    [super setUp];
    
    _test = [[WallofFameViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.test = nil;
}

- (void)testExample {
    
    
    // Test that view loads normally
    XCTAssertNoThrow([_test viewDidLoad]);
    
    // Test server client mechanism for sending name and score to server and then getting back timestamp
    XCTAssert([_test sendAndReceiveThenUpdateTable:@"20 James Lane"]);
    

    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
