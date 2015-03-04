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
//Daily Value for iron is 14 mg
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

@property (strong, nonatomic) IBOutlet UILabel *nf_serving_size_qty;
@property (strong, nonatomic) IBOutlet UILabel *nf_servings_per_container;

@property (strong, nonatomic) IBOutlet UILabel *nf_calories;
@property (strong, nonatomic) IBOutlet UILabel *nf_calories_from_fat;

@property (strong, nonatomic) IBOutlet UILabel *nf_total_fat;
@property (strong, nonatomic) IBOutlet UILabel *nf_total_fatDV;

@property (strong, nonatomic) IBOutlet UILabel *nf_saturated_fat;
@property (strong, nonatomic) IBOutlet UILabel *nf_saturated_fatDV;

@property (strong, nonatomic) IBOutlet UILabel *nf_trans_fatty_acid;

@property (strong, nonatomic) IBOutlet UILabel *nf_cholesterol;
@property (strong, nonatomic) IBOutlet UILabel *nf_cholesterolDV;

@property (strong, nonatomic) IBOutlet UILabel *nf_sodium;
@property (strong, nonatomic) IBOutlet UILabel *nf_sodiumDV;

@property (strong, nonatomic) IBOutlet UILabel *nf_total_carbohydrate;
@property (strong, nonatomic) IBOutlet UILabel *nf_total_carbohydrateDV;

@property (strong, nonatomic) IBOutlet UILabel *nf_dietary_fiber;
@property (strong, nonatomic) IBOutlet UILabel *nf_dietary_fiberDV;

@property (strong, nonatomic) IBOutlet UILabel *nf_sugars;
@property (strong, nonatomic) IBOutlet UILabel *nf_protein;

@property (strong, nonatomic) IBOutlet UILabel *nf_vitamin_a_dv;
@property (strong, nonatomic) IBOutlet UILabel *nf_vitamin_c_dv;
@property (strong, nonatomic) IBOutlet UILabel *nf_calcium_dv;
@property (strong, nonatomic) IBOutlet UILabel *nf_iron_dv;

@property (strong, nonatomic) IBOutlet UILabel *nf_ingredient_statement;

@end

@implementation ResultViewController{
    
    int dvFat;
    int saturated_and_trans_fats;
    int cholesterol;
    int sodium;
    int carbohydrate;
    int fibre;
    
    int vitaminA;
    int vitaminC;
    int calcium;
    int iron;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     dvFat=65;
     saturated_and_trans_fats=20;
     cholesterol=300;
     sodium=2400;
     carbohydrate =300;
     fibre=25;
     vitaminA =1000;
     vitaminC=60;
     calcium =1100;
     iron=14;
    
   // self.resultLabel.text=self.barcodeValue;
    NSDictionary *jsonDictionary = [Utility callNutritionixWithUPC:self.barcodeValue];
    NSLog(@"%@",jsonDictionary);
    
    self.nf_serving_size_qty.text=[NSString stringWithFormat:@"%@",[jsonDictionary objectForKey:@"nf_serving_size_qty"] ];
    self.nf_servings_per_container.text=[NSString stringWithFormat:@"%@",[jsonDictionary objectForKey:@"nf_servings_per_container"]];
    
    self.nf_calories.text=[NSString stringWithFormat:@"%@",[jsonDictionary objectForKey:@"nf_calories"] ];
    self.nf_calories_from_fat.text=[NSString stringWithFormat:@"%@",[jsonDictionary objectForKey:@"nf_calories_from_fat"]];
    self.nf_total_fat.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_total_fat"]];
    self.nf_saturated_fat.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_saturated_fat"]];
    self.nf_trans_fatty_acid.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_trans_fatty_acid"]];
    self.nf_cholesterol.text=[NSString stringWithFormat:@"%@ mg",[jsonDictionary objectForKey:@"nf_cholesterol"]];
    self.nf_sodium.text=[NSString stringWithFormat:@"%@ mg",[jsonDictionary objectForKey:@"nf_sodium"]];
    
    self.nf_total_carbohydrate.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_total_carbohydrate"]];
    self.nf_dietary_fiber.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_dietary_fiber"]];
    self.nf_sugars.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_sugars"]];
    
    self.nf_protein.text=[NSString stringWithFormat:@"%@ g",[jsonDictionary objectForKey:@"nf_protein"]];
    self.nf_ingredient_statement.text=[NSString stringWithFormat:@"%@",[jsonDictionary objectForKey:@"nf_ingredient_statement"]];
  //  self.nf_sugars=[jsonDictionary objectForKey:@"nf_sugars"];
  //  self.nf_sugars=[jsonDictionary objectForKey:@"nf_sugars"];
    
   
    
    
}
- (IBAction)onCancelPress:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)onAddItemPress:(id)sender {
    
}


@end
