//
//  SettingsViewController.m
//  JimboSnake
//
//  Created by James Lane on 1/20/15.
//  Copyright (c) 2015 James Lane. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // sound effects
    NSString *filePathSqueeze = [[NSBundle mainBundle] pathForResource:@"slip"ofType:@"mp3"];
    NSURL *fileURLSqueeze = [NSURL fileURLWithPath:filePathSqueeze ];
    self.squeezeButtonPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLSqueeze  error:nil];
    [self.squeezeButtonPlayer prepareToPlay];
    
    NSString *filePathPeek = [[NSBundle mainBundle] pathForResource:@"peek"ofType:@"mp3"];
    NSURL *fileURLPeek = [NSURL fileURLWithPath:filePathPeek ];
    self.peekButtonPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURLPeek  error:nil];
    [self.peekButtonPlayer prepareToPlay];
    
    // set background
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"san_francisco_4_inch.png"]]];
    
    // NSUserDefaults settings
    _settings = [NSUserDefaults standardUserDefaults];
    
    //prepare music switch
    [self.musicSwitchOutlet setOn:[[_settings objectForKey:(@"music")] boolValue] animated:(YES)];
    [self.musicSwitchOutlet addTarget:self action:@selector(stateChanged:) forControlEvents:(UIControlEventValueChanged)];
    
    //prepare picker
    _colorPickerData = @[@"Bright Green",@"Blue",@"Retro Green (Default)",@"Red",@"Yellow",@"Orange"];
    self.colorPicker.dataSource = self;
    self.colorPicker.delegate = self;
    
    
    // set default to retro greeen
    [_settings setObject:@"retroGreen" forKey:@"background"];
    [_colorPicker selectRow:2 inComponent:0 animated:YES];
    
}
    
    
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _colorPickerData.count;
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    if(row == 0)
    { [_settings setObject:@"green"forKey:@"background"]; }
    if(row == 1)
    { [_settings setObject:@"blue"forKey:@"background"]; }
    if(row == 2)
    { [_settings setObject:@"retroGreen"forKey:@"background"]; }
    if(row == 3)
    { [_settings setObject:@"red"forKey:@"background"]; }
    if(row == 4)
    { [_settings setObject:@"yellow"forKey:@"background"]; }
    if(row == 5)
    { [_settings setObject:@"orange"forKey:@"background"]; }
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _colorPickerData[row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// save data and exit
- (IBAction)saveButtonPressed:(UIButton *)sender {
    
    [self.peekButtonPlayer setCurrentTime:0.4];
    [self.peekButtonPlayer play];
    [_settings synchronize];
}


// switch state changed
- (void)stateChanged:(UISwitch *)switchState{
        
    if([switchState isOn])
    {
    [_settings setObject:[NSNumber numberWithBool:(YES)]forKey:@"music"];
    }
    else
    {
    [_settings setObject:[NSNumber numberWithBool:(NO)] forKey:@"music"];
    }
    
    [self.squeezeButtonPlayer play];
    
}



@end
