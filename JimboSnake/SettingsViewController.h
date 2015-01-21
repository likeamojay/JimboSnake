//
//  SettingsViewController.h
//  JimboSnake
//
//  Created by James Lane on 1/20/15.
//  Copyright (c) 2015 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController



- (IBAction)saveButtonPressed:(UIButton *)sender;
- (IBAction)musicSwitch:(UISwitch *)sender;
@property (strong, nonatomic) IBOutlet UISwitch *musicSwitchOutlet;


@property (strong, nonatomic) IBOutlet UIPickerView *colorPicker;

@end
