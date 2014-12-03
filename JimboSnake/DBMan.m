//
//  DBMan.m
//  JimboSnake
//
//  Created by James Lane on 11/15/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "DBMan.h"
#import <sqlite3.h>


static sqlite3 *scoreDB = nil;
static sqlite3_stmt *command = nil;
static DBMan *sharedInstance = nil;


@implementation DBMan

//So the database can be accessed by other ViewControllers
+(DBMan*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}


// Method returns YES if database is opened and created successfully
-(BOOL)createDB{
    
    NSString *docsDir;
    NSArray *dirPaths;
    BOOL isSuccess;
    
    // Get the file directory
    dirPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    dbPath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"scoreDB.db"]];
    isSuccess = YES;
    
    NSFileManager *fileman = [NSFileManager defaultManager];
    if ([fileman fileExistsAtPath: dbPath ] == NO)
    {
    const char *dbPathChar = [dbPath UTF8String];
    if (sqlite3_open(dbPathChar, &scoreDB) == SQLITE_OK)
    {
        NSLog(@"Database created");
    char *errMsg;
    const char *createTableCommand = "CREATE TABLE IF NOT EXISTS scoreDB (ID INTEGER PRIMARY KEY, HIGH_SCORE INTEGER)";
        if (sqlite3_exec(scoreDB,createTableCommand, NULL, &command, &errMsg) !=SQLITE_OK)
        {
        isSuccess = NO;
        NSLog(@"Prepare-error #%s: %s", errMsg, sqlite3_errmsg(scoreDB));
        
        }
         NSLog(@"table created");
    sqlite3_close(scoreDB);
    return isSuccess;
    }
    else
    {
        isSuccess = NO;
        NSLog(@"Failed to open/create database from CreateDB");
    
    }
    }
    return isSuccess;
}

// Method returns YES if score is saved successfully
- (BOOL)saveData:(NSString*)newScore
{
    const char *dbPathChar = [dbPath UTF8String];
    if (sqlite3_open(dbPathChar, &scoreDB) == SQLITE_OK)
    {
        NSString *insertSQL =
        [NSString stringWithFormat:@"INSERT INTO scoreDB (HIGH_SCORE) VALUES(\"%ld\")",(long)[newScore integerValue]];
        const char *insert_stmt = [insertSQL UTF8String];
        // prepare the save command
        int result = sqlite3_prepare_v2(scoreDB, insert_stmt,-1, &command, NULL);
        if( result!= SQLITE_OK);
        {
        NSLog(@"Prepare-error #%i: %s", result, sqlite3_errmsg(scoreDB));
        }
        result = sqlite3_step(command);
        // save command
        if (result == SQLITE_DONE)
        {
            sqlite3_reset(command);
            return YES;
        }
        else
        {
            NSLog(@"Step-error #%i for '%@': %s", result, insertSQL, sqlite3_errmsg(scoreDB));
        return NO;
        }
    }
    return NO;
    
    
}

// opens the database and checks for highest score, then returns a string with it
-(NSString*)getHighestScore
{
    NSString *highestScore = nil;
    const char *dbPathChar = [dbPath UTF8String];
    if (sqlite3_open(dbPathChar, &scoreDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT MAX(HIGH_SCORE) FROM scoreDB"];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(scoreDB, query_stmt, -1, &command, NULL) == SQLITE_OK)
        {
             if (sqlite3_step(command) == SQLITE_ROW)
             {
            //Get highest score and put in a string
            highestScore = [NSString stringWithFormat:@"%2d",sqlite3_column_int(command, 0)];
             }
        }
        sqlite3_reset(command);
        return highestScore;

    }
    
    else{
    NSLog(@"Could not open database from getHighestScore");
    }
    return nil;
}


-(NSMutableArray*)getAllScores
{
    NSMutableArray *highestScores;
    const char *dbPathChar = [dbPath UTF8String];
    if (sqlite3_open(dbPathChar, &scoreDB) == SQLITE_OK)
    {
       const char *selectAllSQL = "SELECT * FROM  HIGH_SCORE";
                         
       if(sqlite3_prepare(scoreDB, selectAllSQL, -1, &command, NULL) != SQLITE_OK)
       {
          NSLog(@"Problem with prepare statement:  %@", sqlite3_errmsg(scoreDB));
                             
       }
       else{
                             
                             
                             
                             while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
                                 
                                 Author * author = [[Author alloc] init];
                                 
                                 author.name = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
                                 
                                 author.title = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,2)];
                                 
                                 author.genre = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
                                 
                                 [theauthors addObject:author];
                                 
                             }
                             
                         }
                         
                         }
                         
                         @catch (NSException *exception) {
                             
                             NSLog(@"Problem with prepare statement:  %@", sqlite3_errmsg(db));
                             
                         }
                         
                         @finally {
                             
                             sqlite3_finalize(sqlStatement);
                             
                             sqlite3_close(db);
                             
                             
                             return theauthors;
                             
                         }
        
        
    }
    
    else
    {
        NSLog(@"Could not open database from getAllScores");
    }
    
}

-(BOOL)clearScores
{
    
    NSString *docsDir;
    NSArray *dirPaths;
    BOOL isSuccess;
      NSError *error;
    
    // Get the file directory
    dirPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    dbPath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"scoreDB.db"]];
    isSuccess = YES;
    
    // remove database
    NSFileManager *fileman = [NSFileManager defaultManager];
    if ([fileman fileExistsAtPath: dbPath ] == YES)
    {
        [fileman removeItemAtPath:dbPath error:&error];
        
    }

    return YES;
  
}


@end
