//
//  BooksViewController.h
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/5/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BooksViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property NSDictionary *bookArrayDict;
@property NSMutableArray *bookArray;

@end
