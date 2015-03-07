//
//  BooksCollectionViewCell.h
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/6/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BooksCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UIImageView *ratings;

@end
