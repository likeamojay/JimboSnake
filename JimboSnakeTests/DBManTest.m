//
//  DBManTest.m
//  JimboSnake
//
//  Created by James Lane on 12/10/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//
// Test case for the SQLite Score Database Manager

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DBMan.h"

@interface DBManTest : XCTestCase

@property (strong,nonatomic) DBMan *testDBMan;

@end

@implementation DBManTest

- (void)setUp {
    [super setUp];
    self.testDBMan = [[DBMan alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.testDBMan = nil;
}

- (void)testExample {
    
    
    // test instantiation of object
    XCTAssertNotNil(_testDBMan);
    XCTAssert(YES, @"Pass");
    
    // Test Creating the DB
    BOOL testCreate = [_testDBMan createDB];
    XCTAssertTrue(testCreate);
    
    
    // Test Saving a score
    BOOL testSave = [_testDBMan saveData:@"20"];
    XCTAssertTrue(testSave);
    
    // Test Loading highest Score
    XCTAssertEqual(@"20", [_testDBMan getHighestScore]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
