//
//  HomeViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 2/17/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+MJAlertView.h"
#import "BooksViewController.h"

@interface HomeViewController ()

@property NSMutableArray *bookArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *url=[NSURL URLWithString:@"http://api.walmartlabs.com/v1/search?query=nutrition+books&format=json&apiKey=5bgvmzuvq3jxzgemg9dv6dkh"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               
                               NSDictionary *booksDict =[NSDictionary new];
                               booksDict=[NSJSONSerialization JSONObjectWithData:data
                                                                         options:NSJSONReadingAllowFragments
                                                                           error:&connectionError];
                               
                               self.bookArray=[NSMutableArray array];
                               self.bookArray = [booksDict objectForKey:@"items"];
                               
                               NSLog(@"Books %@", self.bookArray);
                           }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)onHistoryPress:(id)sender {
    [UIView addMJNotifierWithText:@"Feature available in PRO($2.99) Version" dismissAutomatically:YES ];
    
}

- (IBAction)onRecipesPress:(id)sender {
    [UIView addMJNotifierWithText:@"Feature available in PRO($2.99) Version" dismissAutomatically:YES ];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"goToBooks"]) {
        BooksViewController *bVC=[segue destinationViewController];
        bVC.bookArray=self.bookArray;
    }
    
    
}

@end
