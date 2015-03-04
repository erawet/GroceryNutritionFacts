//
//  SettingsViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/2/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "SettingsViewController.h"
#import <Parse/Parse.h>

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogoutPress:(UIButton *)sender {
    
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
