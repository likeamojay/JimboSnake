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


// position for food
int extraLifexpos;
int extraLifeypos;

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
@property (strong, nonatomic) AVAudioPlayer *musicPlayer;



// labels for current score, lives, and level
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *livesLabel;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;


// Manager for user settings
@property (strong,nonatomic) NSUserDefaults *settings;


// Listeners for swipe
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *snakeSwipedDown;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *snakeSwipedUp;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *snakeSwipedRight;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *snakeSwipedLeft;


// Button handlers
- (IBAction)gameOverButtonPressed:(UISwipeGestureRecognizer *)sender;
- (IBAction)leftButtonPressed:(UISwipeGestureRecognizer *)sender;
- (IBAction)rightButtonPressed:(UISwipeGestureRecognizer *)sender;
- (IBAction)upButtonPressed:(UISwipeGestureRecognizer*)sender;
- (IBAction)downButtonPressed:(UISwipeGestureRecognizer *)sender;

// Try again button and listener, game over button
@property (strong, nonatomic) IBOutlet UIButton *tryAgainButton;
@property (strong, nonatomic) IBOutlet UIButton *gameOverButton;
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

// extra life
@property (strong, nonatomic) IBOutlet UIImageView *extraLife1;

// name text field
@property (strong,nonatomic) UIAlertView *HighScoreNote;
@property (strong,nonatomic) UITextField *nameTextField;

// Food
@property (strong, nonatomic) IBOutlet UIImageView *food;


//Timer for the snake
@property (strong,nonatomic) NSTimer *snakeTimer;


// Helpers
-(void)snakeIsMoving;
-(void)moveFood;
-(void)updateScore;
-(void)gameOver;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
- (void)dismissAlert;
@end

