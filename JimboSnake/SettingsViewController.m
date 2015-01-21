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
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:<#(id)#> forKey:<#(NSString *)#>]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonPressed:(UIButton *)sender {
}

- (IBAction)musicSwitch:(UISwitch *)sender {
    
    
    
}
@end
