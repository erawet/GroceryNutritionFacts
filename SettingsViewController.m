//
//  SettingsViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/2/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "SettingsViewController.h"
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "UIView+MJAlertView.h"

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
- (IBAction)onChangePasswordPress:(id)sender {
    
}

- (IBAction)onFeedbackPress:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mail = [MFMailComposeViewController new];
        mail.mailComposeDelegate = self;
        [mail setToRecipients:@[@"erawet@gmail.com"]];
        [mail setSubject:@"Nutrition Facts Feedback"];
        [mail setMessageBody:[self feedbackFooterText] isHTML:NO];
        [self presentViewController:mail animated:YES completion:nil];
        return;
    }
    
    
//    [[[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"No email accounts on device.", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
    
    [UIView addMJNotifierWithText:@"No email accounts on device." dismissAutomatically:YES];
    
}

-(NSString*) feedbackFooterText {
    NSMutableString* mutable = [NSMutableString string];
    [mutable appendString:@"\n\n\n ---- Log Information ----\n"];
    
    UIDevice* device = [UIDevice currentDevice];
   // [mutable appendFormat:@"Device Model: %@\n", device.machineName];
    [mutable appendFormat:@"iOS Version: %@ %@\n", device.systemName, device.systemVersion];
    
    
    return mutable;
}


@end
