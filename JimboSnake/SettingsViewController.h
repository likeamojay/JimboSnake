//
//  SettingsViewController.h
//  JimboSnake
//
//  Created by James Lane on 1/20/15.
//  Copyright (c) 2015 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>



- (IBAction)saveButtonPressed:(UIButton *)sender;
- (void)stateChanged:(UISwitch *)switchState;

@property (strong,nonatomic) NSUserDefaults *settings;
@property (strong, nonatomic) IBOutlet UISwitch *musicSwitchOutlet;
@property (strong, nonatomic) IBOutlet UIPickerView *colorPicker;
@property (strong, nonatomic) NSArray *colorPickerData;

@end
