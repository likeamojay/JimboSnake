//
//  WallofFameViewController.m
//  JimboSnake
//
//  Created by James Lane on 12/2/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "WallofFameViewController.h"
#import "DBMan.h"


@interface WallofFameViewController()

@end

@implementation WallofFameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // Load background music
    NSString *filePathMusic= [[NSBundle mainBundle] pathForResource:@"PINBALL"ofType:@"mp3"];
    NSURL *fileURLmusic= [NSURL fileURLWithPath:filePathMusic];
    self.music = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLmusic error:nil];
    [self.music prepareToPlay];
    
    // play music
    self.music.currentTime = 1.5;
    [self.music play];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // stop music
    [self.music stop];
}


@end
