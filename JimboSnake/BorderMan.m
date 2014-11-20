//
//  GameMan.m
//  JimboSnake
//
//  Created by James Lane on 11/15/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

// Custom UIView subclass for managing game graphics

#import "BorderMan.h"


@implementation BorderMan

CGRect rectangle;

// draw the game border
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // thickness of line
    CGContextSetLineWidth(context, 1.0);
    // make it black
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // set coordinates and dimensions
    rectangle = CGRectMake(35, 50, 250, 420);
    
    // put in on the screen
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);

}


@end
