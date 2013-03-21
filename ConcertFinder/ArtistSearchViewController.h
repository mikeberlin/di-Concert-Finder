//
//  ArtistSearchViewController.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblArtistToSearch;
@property (weak, nonatomic) IBOutlet UITableView *tvArtists;

@end