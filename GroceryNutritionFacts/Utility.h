//
//  Utility.h
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/2/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

#import "Constants.h"

#import "Nutritionix_iOS_Library.h"


@interface Utility : NSObject


+ (NSDictionary *) callNutritionixWithUPC :(NSString *) upc;


+ (void) playSound:(NSString *) soundFile;

+ (void) alertError:(NSString *) message;

+ (NSString *) intToString:(int) intValue;


@end
