//
//  WallofFameViewController.h
//  JimboSnake
//
//  Created by James Lane on 12/2/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

@interface WallofFameViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

// for playing background Music
@property (strong, nonatomic) AVAudioPlayer *music;

// Data management
@property (weak, nonatomic) IBOutlet UITableView *DBview;
@property  (nonatomic, copy) NSArray *scoreArray;
-(BOOL)sendAndReceiveThenUpdateTable:(NSString*)scoreAndName;

// Share instance of this ViewController
+(WallofFameViewController*)getSharedInstance;



@end
