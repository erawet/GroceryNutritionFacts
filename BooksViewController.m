//
//  BooksViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 3/5/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "BooksViewController.h"
#import "BooksCollectionViewCell.h"

@interface BooksViewController ()

@property NSMutableArray *bookArray;
@property NSDictionary *bookArrayDict;
@property (strong, nonatomic) IBOutlet UICollectionView *bookCollectionView;



@end

@implementation BooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.bookArray =[NSArray new];
    
    [[self bookCollectionView]setDataSource:self];
    [[self bookCollectionView]setDelegate:self];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    NSURL *url=[NSURL URLWithString:@"http://api.walmartlabs.com/v1/search?query=nutrition+books&format=json&apiKey=5bgvmzuvq3jxzgemg9dv6dkh"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               
                               self.bookArrayDict=[NSJSONSerialization JSONObjectWithData:data
                                                                              options:NSJSONReadingAllowFragments
                                                                                error:&connectionError];
                               
                            
                               self.bookArray=[NSMutableArray array];
                               self.bookArray = [self.bookArrayDict objectForKey:@"items"];

                               
                               
                               NSLog(@"Books %@", self.bookArray);
                               [self.bookCollectionView reloadData];
                           }];
    

    
    
    // Do any additional setup after loading the view.
}
- (IBAction)onCancelButtonPress:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSLog(@"Array %lu",(unsigned long)[self.bookArray count]);
    
    return [self.bookArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifire=@"cell";
    BooksCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire forIndexPath:indexPath];
    NSDictionary *bookDict=[self.bookArray objectAtIndex:indexPath.row];
    float price=[[bookDict objectForKey:@"salePrice"] floatValue];
    
    NSURL *url=[NSURL URLWithString:[bookDict objectForKey:@"thumbnailImage"]];
    cell.price.text=[ NSString stringWithFormat:@"$%.02f",price];
    [[cell imageView] setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
    
    NSURL *ratingUrl=[NSURL URLWithString:[bookDict objectForKey:@"customerRatingImage"]];
    [[cell ratings] setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:ratingUrl]]];
    
    // Configure the cell
    return cell;
}

@end
