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

    
    // border  based on screen size
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480) // iPhone (3.5 inch)
        {
   
        }
        else if(result.height == 568) // iPhone (4 inch)
        {
        rectangle = CGRectMake(10, 50, 300, 500);
        }
        else if(result.height == 667) // iPhone (4.7 inch)
        {
        rectangle = CGRectMake(10, 50, 355, 600);
        }
        else if(result.height == 736) // iPhone (5.5 inch)
        {
         rectangle = CGRectMake(10, 50, 400, 600);
        }
    }
   // otherwise if it's an iPad run in scaled mode
    
    
 
    
    // put in on the screen
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    
    
    // Check dimensions of border drawn
    NSLog(@"rectangle.origin.y: %f",rectangle.origin.y);
    NSLog(@"rectangle.size.height: %f",rectangle.size.height);
    NSLog(@"CGRectGetMinY(rectangle): %f",CGRectGetMinY(rectangle));
    NSLog(@"CGRectGetMaxY(rectangle): %f",CGRectGetMaxY(rectangle));

}


@end
