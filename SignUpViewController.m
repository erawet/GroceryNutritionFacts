//
//  SignUpViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 2/20/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "SignUpViewController.h"
#import  <Parse/Parse.h>

@interface SignUpViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *pwd;
@property (strong, nonatomic) IBOutlet UITextField *confirmPwd;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

}

- (IBAction)onCancelPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onSignUpPress:(UIButton *)sender {
    
    PFUser *newUser=[PFUser user];
    newUser.username=self.name.text;
    newUser.email=self.email.text;
    
    if ([self.pwd.text isEqualToString:self.confirmPwd.text]) {
        newUser.password=self.confirmPwd.text;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
               // [self saveUserDataLocally];
                [self performSegueWithIdentifier:@"goToTabBar" sender:self];
            } else {
               
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
    } else{
       // [self alertMessage:@"Password does not match"];
    }
    
    
}

-(void)dismissKeyboard{
    
    [self.name resignFirstResponder];
    [self.email resignFirstResponder];
    [self.pwd resignFirstResponder];
    [self.confirmPwd resignFirstResponder];
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}



@end
