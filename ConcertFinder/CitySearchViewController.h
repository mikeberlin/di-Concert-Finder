//
//  CitySearchViewController.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitySearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tvCities;
@property (weak, nonatomic) IBOutlet UISearchBar *sbCitySearch;

@end