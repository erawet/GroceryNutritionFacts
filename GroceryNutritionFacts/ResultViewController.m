//
//  ResultViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 2/27/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "ResultViewController.h"
#import "Utility.h"

//Daily Values
// (3 mg ÷ 14 mg) × 100 = 21% DV.
//
//Fat	65 g
//Saturated and trans fats	20 g
//Cholesterol	300 mg
//Sodium	2400 mg
//Carbohydrate	300 g
//Fibre	25 g
//Sugars	no DV
//Protein	no DV
//Vitamin A	1000 RE
//Vitamin C	60 mg
//Calcium	1100 mg
//Iron	14 mg



@interface ResultViewController ()
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.resultLabel.text=self.barcodeValue;
    NSDictionary *jsonDictionary = [Utility callNutritionixWithUPC:self.barcodeValue];
    NSLog(@"%@",jsonDictionary);
}


@end
