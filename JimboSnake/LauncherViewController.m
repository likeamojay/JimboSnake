//
//  LauncherViewController.m
//  JimboSnake
//
//  Created by James Lane on 11/8/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "LauncherViewController.h"
#import "DBMan.h"
#import <AVFoundation/AVFoundation.h>

@interface LauncherViewController ()
@end

@implementation LauncherViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[DBMan getSharedInstance]createDB];
    
    // hide bomb icon
    _bomb.hidden = YES;
    
    // load highest score and place it on the screen
   _highestScoreLabel.text = [[DBMan getSharedInstance]getHighestScore];
    
    // start sound
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"start"ofType:@"WAV"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:fileURL error:nil];
    [self.audioPlayer prepareToPlay];

    // clear sound
    NSString *fileClearButtonPlayer = [[NSBundle mainBundle] pathForResource:@"bomb"ofType:@"mp3"];
    NSURL *fileURLClearButtonPlayer   = [NSURL fileURLWithPath:fileClearButtonPlayer];
    self.clearButtonPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLClearButtonPlayer   error:nil];
    [self.clearButtonPlayer  prepareToPlay];
    
    NSString *filePeekButtonPlayer = [[NSBundle mainBundle] pathForResource:@"peek"ofType:@"mp3"];
    NSURL *fileURLPeekButtonPlayer   = [NSURL fileURLWithPath:filePeekButtonPlayer];
    self.peekButtonPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLPeekButtonPlayer   error:nil];
    [self.peekButtonPlayer  prepareToPlay];
    
    
   
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startButtonPressed:(UIButton *)sender {
    
    // play sound
    self.audioPlayer.currentTime = 0;
    [self.audioPlayer play];
}


// boom sound when clearing scores
-(void)Boom
{
    _highestScoreLabel.hidden = NO;
    _bomb.hidden = YES;
}


- (IBAction)settingsButtonPressed:(UIButton *)sender {
    
    [self.peekButtonPlayer setCurrentTime:(0.4)];
    [self.peekButtonPlayer play];
}

- (IBAction)howtoPlayButtonPressed:(UIButton *)sender {
    [self.peekButtonPlayer setCurrentTime:(0.4)];
     [self.peekButtonPlayer play];
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    

    _highestScoreLabel.hidden = YES;
    _bomb.hidden = NO;
    
    
    self.clearButtonPlayer.currentTime = 0;
    [self.clearButtonPlayer play];
    
    // drop table from database
    [[DBMan getSharedInstance]clearScores];
    

    // Show the bomb for 1 second
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Boom) userInfo:nil repeats:NO];
    
    //Recreate empty table
    [[DBMan getSharedInstance]createDB];
    
    // load highest score and place it on the screen
    _highestScoreLabel.text = [[DBMan getSharedInstance]getHighestScore];

    
    
}
@end
