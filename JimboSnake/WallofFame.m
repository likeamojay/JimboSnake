//
//  WallofFame.m
//  JimboSnake
//
//  Created by James Lane on 1/19/15.
//  Copyright (c) 2015 James Lane. All rights reserved.
//

#import "WallofFame.h"

@interface WallofFame ()

@end

@implementation WallofFame


//So the database can be accessed by other ViewControllers
static WallofFame *sharedInstance;

+(WallofFame*)getSharedInstance{
    
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
    }
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Load and play background music
    NSString *filePathSong = [[NSBundle mainBundle] pathForResource:@"song"ofType:@"mp3"];
    NSURL *fileURLSong = [NSURL fileURLWithPath:filePathSong];
    self.music = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLSong error:nil];
    [self.music prepareToPlay];
    [_music play];
    
    [_scoreArray addObject:@""];
}


//add new score data to arraylist
-(void)newScore:(NSMutableString*)theNewScore
{
    [_scoreArray addObject:theNewScore];
}

/*Delegate method tableView*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_scoreArray count];
}

/*TableView delegate method*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [_scoreArray objectAtIndex:indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // tell the music to STFU
    [_music stop];
}

@end
