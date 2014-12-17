//
//  LauncherViewControllerTest.m
//  JimboSnake
//
//  Created by James Lane on 12/10/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LauncherViewController.h"

@interface LauncherViewControllerTest : XCTestCase
@property (strong,nonatomic) LauncherViewController *test;
@end

@implementation LauncherViewControllerTest

- (void)setUp {
    [super setUp];
    
     self.test = [[LauncherViewController alloc] init];
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

    // test sound
    XCTAssert([_test clearButtonPlayer]);
    
    
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
