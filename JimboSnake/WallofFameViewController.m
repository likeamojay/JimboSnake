//
//  WallofFameViewController.m
//  JimboSnake
//
//  Created by James Lane on 12/2/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "WallofFameViewController.h"
//#import "ViewController.h"


//sharing instance
static WallofFameViewController *sharedInstance = nil;
NSArray *list_array;
NSString *data;

// Callback function
CFSocketNativeHandle sock;
UInt8 buffer[1024];

void ConnectCallBack(
                     CFSocketRef socket,
                     CFSocketCallBackType type,
                     CFDataRef address,
                     const void *data,
                     void *info)
{
    sock = CFSocketGetNative(socket);
    char *msg = info;
    NSLog(@"%s\n", msg);
    send(sock, msg, strlen(msg) +1, 0);
    NSLog(@"Sent\n");
    recv(sock, buffer, sizeof(buffer), 0);// if wanted to write could use
    NSLog(@"Got: %s \n", buffer);
    CFRunLoopStop(CFRunLoopGetCurrent());
    return;
}

@interface WallofFameViewController()

@end

@implementation WallofFameViewController

@synthesize scoreArray,DBview;

//So the database can be accessed by other ViewControllers
+(WallofFameViewController*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
    }
    return sharedInstance;
}


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
    
    // update table
    data = [[NSString alloc] initWithCString:
                      (char*)buffer encoding: NSASCIIStringEncoding];
     list_array= [data componentsSeparatedByString:@":"];
    
    // update table view
    self.scoreArray = list_array;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)sendAndReceiveThenUpdateTable:(NSMutableString*)scoreAndName
{
    //[[ViewController getSharedInstance]dismissAlert];
     
     // read into character array
    const char* utf8String = [scoreAndName UTF8String];
    size_t len = strlen(utf8String) + 1;
    char msg[len];
    memcpy(msg, utf8String, len);
    
    /* Build our socket context; this ties the joke to the socket */
    CFSocketContext context = { 0, msg, NULL, NULL, NULL };
    
    
    CFSocketRef client = CFSocketCreate(NULL, PF_INET, SOCK_STREAM, IPPROTO_TCP,
                                        kCFSocketConnectCallBack, (CFSocketCallBack)ConnectCallBack, &context);

    
    struct sockaddr_in theName;
    struct hostent *hp;
    CFDataRef addressData;
    
    theName.sin_port = htons(7890);
    theName.sin_family = AF_INET;
    
    hp = gethostbyname("localhost");
    if( hp == NULL ) {
        NSLog(@"Could not get host");
        return NO;
    }
    
    memcpy( &theName.sin_addr.s_addr, hp-> h_addr_list[0], hp-> h_length );
    addressData = CFDataCreate( NULL, (UInt8 *)&theName, (CFIndex)sizeof( struct sockaddr_in ) );
    
    CFSocketConnectToAddress(client, addressData, 1); // 1 second timeout
    CFRunLoopSourceRef sourceRef =
    CFSocketCreateRunLoopSource(kCFAllocatorDefault, client, 0);
    CFRunLoopAddSource(CFRunLoopGetCurrent(), sourceRef, kCFRunLoopCommonModes);
    CFRelease(sourceRef);
    CFRunLoopRun();
    
    
    NSLog(@"Got Back: %s\n\n", buffer);
    NSString *data = [[NSString alloc] initWithCString:
                      (char*)buffer encoding: NSASCIIStringEncoding];
    
    
    NSArray *list_array = [data componentsSeparatedByString:@":"];
    
    
    
    // update table view
    self.scoreArray = list_array;
    return YES;

}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger) section
{
    return [self.scoreArray count];
}

/*
 Delegate method is a callback used to fill in table cells. Notice to save
 memory we only instiate cells which will be scene, but then we cache
 them when they become invisible
 */
-(UITableViewCell *)tableView: (UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";

UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier: SimpleTableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = self.scoreArray[row];
       return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [_music stop];
}

@end
