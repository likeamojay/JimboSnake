//
//  ViewController.h
//  JimboSnake
//
//  Created by James Lane on 11/5/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBMan.h"
#import <AVFoundation/AVFoundation.h>



// position for snake
int xpos;
int ypos;

// position for food
int foodxpos;
int foodypos;


// Game Difficulty by speed of timer
float difficulty;
// Level 1 = 0.6
// Level 2 = 0.4
// Level 3 = 0.3

// Local variable for score that eventually gets stored in database
int theScore;
int lives =5;
int level =1;

// Control for available directions
BOOL movingLeftOrRight;


// Overridden Core Graphics Method

// For new blocks
BOOL snakeBlock6in;
BOOL snakeBlock7in;
BOOL snakeBlock8in;
BOOL snakeBlock9in;
BOOL snakeBlock10in;
BOOL snakeBlock11in;
BOOL snakeBlock12in;
BOOL snakeBlock13in;
BOOL snakeBlock14in;
BOOL snakeBlock15in;
BOOL snakeBlock16in;
BOOL snakeBlock17in;
BOOL snakeBlock18in;
BOOL snakeBlock19in;
BOOL snakeBlock20in;

@interface ViewController : UIViewController

//Sound effects
@property (strong, nonatomic) AVAudioPlayer *directionPressedPlayer;
@property (strong, nonatomic) AVAudioPlayer *gameOverSoundPlayer;
@property (strong, nonatomic) AVAudioPlayer *snakeCrashedPlayer;
@property (strong, nonatomic) AVAudioPlayer *snakeEatPlayer;


// labels for current score, lives, and level
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *livesLabel;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;

@property (strong, nonatomic) IBOutlet UIButton *gameOverButton;

- (IBAction)gameOverButtonPressed:(UIButton *)sender;
// left and right button actions
- (IBAction)leftButtonPressed:(UIButton *)sender;
- (IBAction)rightButtonPressed:(UIButton *)sender;
- (IBAction)upButtonPressed:(UIButton *)sender;
- (IBAction)downButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *tryAgainButton;
- (IBAction)tryAgainButtonPressed:(UIButton *)sender;

// single block for the snake
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock2;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock3;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock4;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock5;

@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock6;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock7;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock8;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock9;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock10;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock11;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock12;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock13;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock14;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock15;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock16;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock17;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock18;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock19;
@property (strong, nonatomic) IBOutlet UIImageView *snakeBlock20;


// Food
@property (strong, nonatomic) IBOutlet UIImageView *food;



//Timer for the snake
@property (strong,nonatomic) NSTimer *snakeTimer;


// Helpers
-(void)snakeIsMoving;
-(void)moveFood;
-(void)updateScore;
-(void)gameOver;

@end

