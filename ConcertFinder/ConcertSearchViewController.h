//
//  ConcertSearchViewController.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConcertSearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *lblCityToSearch;
@property (weak, nonatomic) IBOutlet UITableView *tvConcerts;

@end