//
//  LauncherViewController.m
//  JimboSnake
//
//  Created by James Lane on 11/8/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "LauncherViewController.h"
#import "DBMan.h"

@interface LauncherViewController ()

@end

@implementation LauncherViewController

- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    
    [[DBMan getSharedInstance]createDB];
    
    // load highest score and place it on the screen
   _highestScoreLabel.text = [[DBMan getSharedInstance]getHighestScore];
    
   
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
