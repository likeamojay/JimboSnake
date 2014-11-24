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
   
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startButtonPressed:(UIButton *)sender {
    
    // Make sure the audio is at the start of the stream.
    self.audioPlayer.currentTime = 0;
    [self.audioPlayer play];
}
@end
