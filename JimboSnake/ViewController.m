//
//  ViewController.m
//  JimboSnake
//
//  Created by James Lane on 11/5/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "ViewController.h"
#import "WallofFame.h"
#import "DBMan.h"

// Begin Main interface and implementation

@interface ViewController ()
@end

CGFloat initialSnakeX;
CGFloat initialSnakeY;
CGFloat initialExtraLifeX;
CGFloat initialExtraLifeY;


@implementation ViewController

- (void)viewDidLoad {
    
    //Initialize sound effects
    NSString *filePathCrashSound = [[NSBundle mainBundle] pathForResource:@"SOUND7"ofType:@"WAV"];
    NSURL *fileURLCrashSound = [NSURL fileURLWithPath:filePathCrashSound];
    self.snakeCrashedPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLCrashSound error:nil];
    [self.snakeCrashedPlayer prepareToPlay];
    
    NSString *filePathGameOverSound = [[NSBundle mainBundle] pathForResource:@"SOUND3"ofType:@"WAV"];
    NSURL *fileURLGameOverSound = [NSURL fileURLWithPath:filePathGameOverSound];
    self.gameOverSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLGameOverSound error:nil];
    [self.gameOverSoundPlayer prepareToPlay];
    
    NSString *filePathButtonPressedSound = [[NSBundle mainBundle] pathForResource:@"SOUND8"ofType:@"WAV"];
    NSURL *fileURLButtonPressedSound  = [NSURL fileURLWithPath:filePathButtonPressedSound ];
    self.directionPressedPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLButtonPressedSound  error:nil];
    [self.directionPressedPlayer prepareToPlay];
    
    NSString *fileSnakeEatSound = [[NSBundle mainBundle] pathForResource:@"chomp"ofType:@"mp3"];
    NSURL *fileURLSnakeEat  = [NSURL fileURLWithPath:fileSnakeEatSound];
    self.snakeEatPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLSnakeEat  error:nil];
    [self.snakeEatPlayer prepareToPlay];
    
    
    // load view and hide back button
    [super viewDidLoad];
    _tryAgainButton.hidden = YES;
    _gameOverButton.hidden = YES;
    
    // Hide extra lives
    _extraLife1.hidden = YES;
    
    
    // hide extra blocks
    _snakeBlock6.hidden = YES;
    _snakeBlock7.hidden = YES;
    _snakeBlock8.hidden = YES;
    _snakeBlock9.hidden = YES;
    _snakeBlock10.hidden = YES;
    _snakeBlock11.hidden = YES;
    _snakeBlock12.hidden = YES;
    _snakeBlock13.hidden = YES;
    _snakeBlock14.hidden = YES;
    _snakeBlock15.hidden = YES;
    _snakeBlock16.hidden = YES;
    _snakeBlock17.hidden = YES;
    _snakeBlock18.hidden = YES;
    _snakeBlock19.hidden = YES;
    _snakeBlock20.hidden = YES;
    
    // Not in game yet
    snakeBlock6in = NO;
    snakeBlock7in = NO;
    snakeBlock8in = NO;
    snakeBlock9in = NO;
    snakeBlock10in = NO;
    snakeBlock11in = NO;
    snakeBlock12in = NO;
    snakeBlock13in = NO;
    snakeBlock14in = NO;
    snakeBlock15in = NO;
    snakeBlock16in = NO;
    snakeBlock17in = NO;
    snakeBlock18in = NO;
    snakeBlock19in = NO;
    snakeBlock20in = NO;
    
    // Set up swipe listeners to call former buttonPressed methods
    _snakeSwipedLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector
                       (leftButtonPressed:)];
    [_snakeSwipedLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:_snakeSwipedLeft];
    
    _snakeSwipedRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightButtonPressed:)];
    [_snakeSwipedRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:_snakeSwipedRight];
    
    _snakeSwipedDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downButtonPressed:)];
    [_snakeSwipedDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:_snakeSwipedDown];
    

    _snakeSwipedUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upButtonPressed:)];
    [_snakeSwipedUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:_snakeSwipedUp];
    
    

    // Initialize score to 0
    theScore = 0;
    _scoreLabel.text = [NSString stringWithFormat:@"%2d",theScore];
    
    //Initialize level to 1
    level = 1;
    _levelLabel.text = [NSString stringWithFormat:@"%d",level];
    
    //Initialize lives
    _livesLabel.text = [NSString stringWithFormat:@"%d",lives];
    
    // intially disable left-right movement
    movingLeftOrRight = YES;
    
    // Set initial position change values of snake
    initialSnakeX = _snakeBlock.center.x;
    initialSnakeY = _snakeBlock.center.y;
    
    // set initial position of extra life off of the border
    initialExtraLifeX = _extraLife1.center.x;
    initialExtraLifeY = _extraLife1.center.y;
    
    // position incrrements
    xpos = 15;
    ypos = 0;

    // set difficulty to level 1 = 0.6s
    difficulty = 0.6;
    
    
    // Start Timer
    [self startTimer];

    
}

-(void)startTimer{
    // start the timer to animate the snake
    _snakeTimer = [NSTimer scheduledTimerWithTimeInterval:difficulty target:self selector:@selector(snakeIsMoving) userInfo:nil repeats:YES];
}

-(void)snakeIsMoving;
{
    // change x and y coordinates based on value of xpos and ypos
    _snakeBlock20.center = CGPointMake(_snakeBlock19.center.x, _snakeBlock19.center.y);
    _snakeBlock19.center = CGPointMake(_snakeBlock18.center.x, _snakeBlock18.center.y);
    _snakeBlock18.center = CGPointMake(_snakeBlock17.center.x, _snakeBlock17.center.y);
    _snakeBlock17.center = CGPointMake(_snakeBlock16.center.x, _snakeBlock16.center.y);
    _snakeBlock16.center = CGPointMake(_snakeBlock15.center.x, _snakeBlock15.center.y);
    _snakeBlock15.center = CGPointMake(_snakeBlock14.center.x,_snakeBlock14.center.y);
    _snakeBlock14.center = CGPointMake(_snakeBlock13.center.x, _snakeBlock13.center.y);
    _snakeBlock13.center = CGPointMake(_snakeBlock12.center.x, _snakeBlock12.center.y);
    _snakeBlock12.center = CGPointMake(_snakeBlock11.center.x, _snakeBlock11.center.y);
    _snakeBlock11.center = CGPointMake(_snakeBlock10.center.x, _snakeBlock10.center.y);
    _snakeBlock10.center = CGPointMake(_snakeBlock9.center.x, _snakeBlock9.center.y);
    _snakeBlock9.center = CGPointMake(_snakeBlock8.center.x, _snakeBlock8.center.y);
    _snakeBlock8.center = CGPointMake(_snakeBlock7.center.x, _snakeBlock7.center.y);
    _snakeBlock7.center = CGPointMake(_snakeBlock6.center.x, _snakeBlock6.center.y);
    _snakeBlock6.center = CGPointMake(_snakeBlock5.center.x, _snakeBlock5.center.y);
    
    
    _snakeBlock5.center = CGPointMake(_snakeBlock4.center.x, _snakeBlock4.center.y);
   _snakeBlock4.center = CGPointMake(_snakeBlock3.center.x, _snakeBlock3.center.y);
  _snakeBlock3.center = CGPointMake(_snakeBlock2.center.x, _snakeBlock2.center.y);
   _snakeBlock2.center = CGPointMake(_snakeBlock.center.x, _snakeBlock.center.y);
    _snakeBlock.center = CGPointMake(_snakeBlock.center.x + xpos, _snakeBlock.center.y + ypos);
    
    
    // if snake eats the food
    if(CGRectIntersectsRect(_snakeBlock.frame, _food.frame))
    {
        // play sound
        self.snakeEatPlayer.currentTime = 0;
        [self.snakeEatPlayer play];
        
        [self moveFood];
        [self updateScore];
        
    //If score greater then advance to next level
    if(theScore == 5)
    {
        level++;
        _levelLabel.text = [NSString stringWithFormat:@"%d",level];
        [_snakeTimer invalidate];
         difficulty = 0.4;
        [self startTimer];
    }
        
        if(theScore == 10)
        {
            level++;
            _levelLabel.text = [NSString stringWithFormat:@"%d",level];
            [_snakeTimer invalidate];
            difficulty = 0.3;
             [self startTimer];
                 [self moveExtraLife];
            _extraLife1.hidden = NO;
        }
        
        if(theScore == 15)
        {
            level++;
            _levelLabel.text = [NSString stringWithFormat:@"%d",level];
            [_snakeTimer invalidate];
            difficulty = 0.2;
            [self startTimer];
            [self moveExtraLife];
            _extraLife1.hidden = NO;
            
        }
        
        if(theScore == 20)
        {
            level++;
            _levelLabel.text = [NSString stringWithFormat:@"%d",level];
            [_snakeTimer invalidate];
            difficulty = 0.1;
            [self startTimer];
                 [self moveExtraLife];
            _extraLife1.hidden = NO;
            
        }
        if(theScore == 25)
        {
            // win an extra life
            [self moveExtraLife];
            _extraLife1.hidden = NO;
        }
        if(theScore == 30)
        {
            // win an extra life
            [self moveExtraLife];
            _extraLife1.hidden = NO;
        }
        if(theScore == 35)
        {
            // win an extra life
            [self moveExtraLife];
            _extraLife1.hidden = NO;
            
        }
    }
 
    //if snake eats an extra life
    if(CGRectIntersectsRect(_snakeBlock.frame, _extraLife1.frame))
    {
        lives++;
        _livesLabel.text = [NSString stringWithFormat:@"%d",lives];
        
        // hide and reposition
        _extraLife1.hidden = YES;
        _extraLife1.center = CGPointMake(initialExtraLifeX, initialExtraLifeY);
        
        // play sound
        self.snakeEatPlayer.currentTime = 0;
        [self.snakeEatPlayer play];
        
      
        
    }
  
    
  // if snake crashes into itself
    // I know this is really inefficient and could've used NSArrays but it's simple
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock3.frame))
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock4.frame))
    {
       [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock5.frame))
    {
      [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock6.frame) && snakeBlock6in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock7.frame) && snakeBlock7in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock8.frame) && snakeBlock8in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock9.frame) && snakeBlock9in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock10.frame) && snakeBlock10in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock11.frame) && snakeBlock11in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock12.frame) && snakeBlock12in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock13.frame) && snakeBlock13in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock14.frame) && snakeBlock14in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock15.frame) && snakeBlock15in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock16.frame) && snakeBlock16in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock17.frame) && snakeBlock17in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock18.frame) && snakeBlock18in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock19.frame) && snakeBlock19in == YES)
    {
        [self loser];
    }
    if(CGRectIntersectsRect(_snakeBlock.frame, _snakeBlock20.frame) && snakeBlock20in == YES)
    {
        [self loser];
    }
    
    // If snake crashes into the left or right side of border
    if(_snakeBlock.center.x >= 315 || _snakeBlock.center.x <=10)
    {
        [self loser];
    }
    // If snake crashes into up or down side of border
    if(_snakeBlock.center.y >= 545 || _snakeBlock.center.y <= 50)
    {
        [self loser];
    }

}

-(void)moveFood
{
    // Constraints:
    // LeftX : 268, RightX = 48
    // downY: 445, upY = 58
    
    // pick a random number between the constraints of the rectangle drawn in BorderMan.m
    foodxpos = arc4random() %220;
    foodxpos = foodxpos + 48;
    foodypos = arc4random() %387;
    foodypos = foodypos + 58;
    
    // move it based on random values
    _food.center = CGPointMake(foodxpos, foodypos);
}

-(void)moveExtraLife
{
    // Constraints:
    // LeftX : 268, RightX = 48
    // downY: 445, upY = 58
    
    // pick a random number between the constraints of the rectangle drawn in BorderMan.m
    extraLifexpos = arc4random() %220;
    extraLifexpos = foodxpos + 48;
     extraLifeypos = arc4random() %387;
    extraLifeypos = foodypos + 58;
    
    // move it based on random values
    _extraLife1.center = CGPointMake(extraLifexpos, extraLifeypos);
}




-(void)loser{
    // lose a life
    lives--;
    _livesLabel.text = [NSString stringWithFormat:@"%d",lives];
    
    // if still have more lives then have another go at it.
    if(lives > 0)
    {
        //crash sound
        self.snakeCrashedPlayer.currentTime = 0;
        [self.snakeCrashedPlayer play];
        [_snakeTimer invalidate];
        
        // show try again button
        _tryAgainButton.hidden = NO;
    }
    else{
    // if no more lives then game is over
        [self gameOver];
    }
    
}


-(void)gameOver
{
    // stop snake from moving
    [_snakeTimer invalidate];
    _snakeTimer = nil;

    // Game Over label
    _gameOverButton.hidden = NO;
    
    // game over sound
    self.gameOverSoundPlayer.currentTime = 0;
    [self.gameOverSoundPlayer play];
    
    // current high score
    int currentHighScore = (int)[[DBMan getSharedInstance]getHighestScore].integerValue;
    
    // Save Score in database
    [[DBMan getSharedInstance]saveData:[NSString stringWithFormat:@"%2d",theScore]];
    
    // if latest high score in database is less than this one
    if(currentHighScore < theScore)
    {
        // alert for new score
        _HighScoreNote = [[UIAlertView alloc] initWithTitle:@"You made a new high score!" message:@"Enter your name to be in the Wall of Fame" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
        _HighScoreNote.alertViewStyle = UIAlertViewStylePlainTextInput;
        [[_HighScoreNote textFieldAtIndex:0] setPlaceholder:@"Your Name Here"];
        [_HighScoreNote show];
       
    }
    
}

// close alert if save button is pressed
- (void)dismissAlert
{
    [self.HighScoreNote dismissWithClickedButtonIndex:0 animated:YES];
}

//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSMutableString *theNameAndScore = [NSMutableString stringWithFormat:@"%2d",theScore];
    
    if (buttonIndex == 1) {
         NSLog(@"Save button pressed");
        
        // Get the player's name
        _nameTextField = [alertView textFieldAtIndex:0];
        [theNameAndScore appendString:@" "];
        [theNameAndScore appendString:_nameTextField.text];
        NSLog(@"%@",theNameAndScore);
   
        // Send players name over to WallofFameViewController to be put in the table
        [[WallofFame getSharedInstance] newScore:(theNameAndScore)];
      
    }
    // Reset lives back to 5
    lives = 5;
    // Reset level back to 1
    level = 1;
    // Reset score to 0
    theScore = 0;
}


-(void)updateScore
{
    // Update local score
    theScore++;
    
    // Update label on screen
    _scoreLabel.text = [NSString stringWithFormat:@"%2d",theScore];
    
    // add to length of snake
    switch(theScore){
        case 1:
            _snakeBlock6.hidden = NO;
            snakeBlock6in = YES;
            break;
        case 2:
            _snakeBlock7.hidden = NO;
            snakeBlock7in = YES;
            break;
        case 3:
            _snakeBlock8.hidden = NO;
            snakeBlock8in = YES;
            break;
        case 4:
            _snakeBlock9.hidden = NO;
            snakeBlock9in = YES;
            break;
        case 5:
            _snakeBlock10.hidden = NO;
            snakeBlock10in = YES;
            break;
        case 6:
            _snakeBlock11.hidden = NO;
            snakeBlock11in = YES;
            break;
        case 7:
            _snakeBlock12.hidden = NO;
            snakeBlock12in = YES;
            break;
        case 8:
            _snakeBlock13.hidden = NO;
            snakeBlock13in = YES;
            break;
        case 9:
            _snakeBlock14.hidden = NO;
            snakeBlock14in = YES;
            break;
        case 10:
            _snakeBlock15.hidden = NO;
            snakeBlock15in = YES;
            break;
        case 11:
            _snakeBlock16.hidden = NO;
            snakeBlock16in = YES;
            break;
        case 12:
            _snakeBlock17.hidden = NO;
            snakeBlock17in = YES;
            break;
        case 13:
            _snakeBlock18.hidden = NO;
            snakeBlock18in = YES;
            break;
        case 14:
            _snakeBlock19.hidden = NO;
            snakeBlock19in = YES;
            break;
        case 15:
            _snakeBlock20.hidden = NO;
            snakeBlock20in = YES;
            break;
        default:
            break;
       }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftButtonPressed:(UISwipeGestureRecognizer *)sender {
    
    if(movingLeftOrRight == NO)
    {
        xpos = -15;
        ypos = 0;
        movingLeftOrRight = YES;
    }
    
    // play sound
    self.directionPressedPlayer.currentTime = 0;
    [self.directionPressedPlayer play];
}

- (IBAction)rightButtonPressed:(UISwipeGestureRecognizer *)sender {
    if(movingLeftOrRight == NO)
    {
        xpos = 15;
        ypos = 0;
        movingLeftOrRight = YES;
    }
    
    // play sound
    self.directionPressedPlayer.currentTime = 0;
    [self.directionPressedPlayer play];
}

- (IBAction)upButtonPressed:(UISwipeGestureRecognizer *)sender {
    if(movingLeftOrRight == YES)
    {
        xpos = 0;
        ypos = -15;
        movingLeftOrRight = NO;
        
    }
    // play sound
    self.directionPressedPlayer.currentTime = 0;
    [self.directionPressedPlayer play];
}

- (IBAction)downButtonPressed:(UISwipeGestureRecognizer *)sender {
    if(movingLeftOrRight == YES)
    {
        xpos = 0;
        ypos = 15;
        movingLeftOrRight = NO;
    }
    // play sound
    self.directionPressedPlayer.currentTime = 0;
    [self.directionPressedPlayer play];

}


- (IBAction)tryAgainButtonTapped:(UITapGestureRecognizer *)sender {
    
    // reposition snake back to intial point
    _snakeBlock.center = CGPointMake(initialSnakeX, initialSnakeY);
       _snakeBlock2.center = CGPointMake(_snakeBlock.center.x, _snakeBlock.center.y);
      _snakeBlock3.center = CGPointMake(_snakeBlock2.center.x, _snakeBlock2.center.y);
     _snakeBlock4.center = CGPointMake(_snakeBlock3.center.x, _snakeBlock3.center.y);
    _snakeBlock5.center = CGPointMake(_snakeBlock4.center.x, _snakeBlock4.center.y);
     _snakeBlock6.center = CGPointMake(_snakeBlock5.center.x, _snakeBlock5.center.y);
    _snakeBlock7.center = CGPointMake(_snakeBlock6.center.x, _snakeBlock6.center.y);
       _snakeBlock8.center = CGPointMake(_snakeBlock7.center.x, _snakeBlock7.center.y);
    _snakeBlock9.center = CGPointMake(_snakeBlock8.center.x, _snakeBlock8.center.y);
      _snakeBlock10.center = CGPointMake(_snakeBlock9.center.x, _snakeBlock9.center.y);
    _snakeBlock11.center = CGPointMake(_snakeBlock10.center.x, _snakeBlock10.center.y);
 _snakeBlock12.center = CGPointMake(_snakeBlock11.center.x, _snakeBlock11.center.y);
     _snakeBlock13.center = CGPointMake(_snakeBlock12.center.x, _snakeBlock12.center.y);
        _snakeBlock14.center = CGPointMake(_snakeBlock13.center.x, _snakeBlock13.center.y);
     _snakeBlock15.center = CGPointMake(_snakeBlock14.center.x,_snakeBlock14.center.y);
      _snakeBlock16.center = CGPointMake(_snakeBlock15.center.x, _snakeBlock15.center.y);
        _snakeBlock17.center = CGPointMake(_snakeBlock16.center.x, _snakeBlock16.center.y);
        _snakeBlock18.center = CGPointMake(_snakeBlock17.center.x, _snakeBlock17.center.y);
        _snakeBlock19.center = CGPointMake(_snakeBlock18.center.x, _snakeBlock18.center.y);
        _snakeBlock20.center = CGPointMake(_snakeBlock19.center.x, _snakeBlock19.center.y);
    
    
    // restart timer
    [self startTimer];
    _tryAgainButton.hidden = YES;
    

}
- (IBAction)gameOverButtonPressed:(UIButton *)sender {
    // play sound
    self.directionPressedPlayer.currentTime = 0;
    [self.directionPressedPlayer play];

}


@end

