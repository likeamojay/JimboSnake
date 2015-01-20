//
//  WallofFame.h
//  JimboSnake
//
//  Created by James Lane on 1/19/15.
//  Copyright (c) 2015 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>



@interface WallofFame : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) AVAudioPlayer *music;

@property (strong, nonatomic) IBOutlet UITableView *scoreTable;
@property (strong,nonatomic) NSMutableArray *scoreArray;



// Share instance of WallofFame
+(WallofFame*)getSharedInstance;

// helpers
-(void)newScore:(NSMutableString*)theNewScore;

@end
