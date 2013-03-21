//
//  VenueSearchViewController.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "VenueSearchViewController.h"
#import "AppDelegate.h"
#import "SeatGeekManager.h"
#import "Venue.h"

@interface VenueSearchViewController ()

@property (strong, nonatomic) NSArray *venues;

@end

@implementation VenueSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Venues", @"Venues");
        self.tabBarItem.image = [UIImage imageNamed:@"somepngfile"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.venues = [SeatGeekManager getVenues:cityToSearch];

    [self.tvVenues reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.venues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCell = @"VenueCell";
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:tableCell];
    
    if (tvCell == nil) tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:tableCell];

    if (cityToSearch != Nil)
    {
        Venue *currentVenue = (Venue *)[self.venues objectAtIndex:indexPath.row];
        tvCell.textLabel.text = currentVenue.Name;
    }

    return tvCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Venue *selectedVenue = (Venue *)[self.venues objectAtIndex:indexPath.row];
    NSLog(@"Selected Venue:\n%@", selectedVenue);
    NSLog(@"Venue Id: '%@'", selectedVenue.Id);
}

@end