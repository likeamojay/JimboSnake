//
//  GameMan.h
//  JimboSnake
//
//  Created by James Lane on 11/15/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//
// Custom UIView class for managing game graphics


#import <UIKit/UIKit.h>

CGRect rectangle;

// Border constraints offset for different screen sizes
float BORDER_VERT_OFFSET;
float BORDER_HORIZ_OFFSET;


@interface BorderMan : UIView

// draw border
- (void)drawRect:(CGRect)rect;

@end
