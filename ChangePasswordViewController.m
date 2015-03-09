//
//  ChangePasswordViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/9/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "UIView+MJAlertView.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onCancelPress:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)onChangePress:(id)sender {
    [UIView addMJNotifierWithText:@"Feature available in PRO($2.99) Version" dismissAutomatically:YES ];
}


@end
