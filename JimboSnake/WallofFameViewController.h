//
//  WallofFameViewController.h
//  JimboSnake
//
//  Created by James Lane on 12/2/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WallofFameViewController : UIViewController

// for playing background Music
@property (strong, nonatomic) AVAudioPlayer *music;

// Data management
@property (strong, nonatomic) IBOutlet UITableView *DBview;
@property (strong,nonatomic) IBOutlet NSMutableArray *scoreArray;


@end
