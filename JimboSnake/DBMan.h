//
//  DBMan.h
//  JimboSnake
//
//  Created by James Lane on 11/15/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBMan : NSObject
{
    NSString *dbPath;
}


// Share instance of DBMan
+(DBMan*)getSharedInstance;

// Methods to interface program with database
-(BOOL)createDB;
-(BOOL) saveData:(NSString*)score;
-(NSString*)getHighestScore;

@end
