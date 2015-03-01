//
//  ResultViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 2/27/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "ResultViewController.h"
//#import "Utility.h"


@interface ResultViewController ()
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultLabel.text=self.barcodeValue;
  //  NSDictionary *jsonDictionary = [Utility callNutritionixWithUPC:self.resultLabel.text];
}


@end
