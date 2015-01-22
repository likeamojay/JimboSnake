//
//  LauncherViewController.h
//  JimboSnake
//
//  Created by James Lane on 11/8/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LauncherViewController : UIViewController

// label for showing highest score from last game
@property (strong, nonatomic) IBOutlet UILabel *highestScoreLabel;

// for playing pinball sound when start button is pressed
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
- (IBAction)startButtonPressed:(UIButton *)sender;

// for playing clear button sound
@property (strong, nonatomic) AVAudioPlayer *clearButtonPlayer;

// peek button sound
@property (strong, nonatomic) AVAudioPlayer *peekButtonPlayer;

// bomb icon
@property (strong, nonatomic) IBOutlet UIImageView *bomb;

- (IBAction)clearButtonPressed:(UIButton *)sender;

@end
