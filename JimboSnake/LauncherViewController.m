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
    
    
    //Get the file path to the sound
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SOUND136"
                                                         ofType:@"WAV"];
    
    // Convert the file path to a URL object.
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    //Initialize the AVAudioPlayer.
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:fileURL error:nil];
    
    // Preloads the buffer and prepares the audio for playing.
    [self.audioPlayer prepareToPlay];
    
    
    NSString *fileClearButtonPlayer = [[NSBundle mainBundle] pathForResource:@"SOUND9"ofType:@"WAV"];
    NSURL *fileURLClearButtonPlayer   = [NSURL fileURLWithPath:fileClearButtonPlayer];
    self.clearButtonPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLClearButtonPlayer   error:nil];
    [self.clearButtonPlayer  prepareToPlay];
   
 
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



-(void)Boom
{
    _highestScoreLabel.hidden = NO;
    _bomb.hidden = YES;
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
    
}
@end
