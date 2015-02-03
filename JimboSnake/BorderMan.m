//
//  GameMan.m
//  JimboSnake
//
//  Created by James Lane on 11/15/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

// Custom UIView class for managing game graphics
#import "BorderMan.h"
@implementation BorderMan

CGRect rectangle;

// draw the game border
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // thickness of line
    CGContextSetLineWidth(context, 1.5);
    
    // make it black
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // set coordinates and dimensions
    rectangle = CGRectMake(10, 50, 300, 500);
    
    // put in on the screen
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    
    // Check constrains
    NSLog(@"rectangle.origin.y: %f",rectangle.origin.y);
    NSLog(@"rectangle.size.height: %f",rectangle.size.height);
    NSLog(@"CGRectGetMinY(rectangle): %f",CGRectGetMinY(rectangle));
    NSLog(@"CGRectGetMaxY(rectangle): %f",CGRectGetMaxY(rectangle));

}


@end
