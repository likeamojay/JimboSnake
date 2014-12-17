//
//  ViewControllerTest.m
//  JimboSnake
//
//  Created by James Lane on 12/10/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTest : XCTestCase

@property (strong,nonatomic) ViewController *test;
@end

@implementation ViewControllerTest

- (void)setUp {
    [super setUp];
    
    _test = [[ViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.test = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    
    // Test that view loads normally
    XCTAssertNoThrow([_test viewDidLoad]);
    
    // test snake moving
    XCTAssertNoThrow([_test snakeIsMoving]);
    
    // test game over method
     XCTAssertNoThrow([_test gameOver]);
    
    // test food mover
     XCTAssertNoThrow([_test moveFood]);
    
    // test score updater
     XCTAssertNoThrow([_test updateScore]);
    
    
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
