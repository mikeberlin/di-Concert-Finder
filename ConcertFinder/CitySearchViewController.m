//
//  CitySearchViewController.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "CitySearchViewController.h"
#import "BingAPIManager.h"
#import "ConcertSearchViewController.h"
#import "AppDelegate.h"

@interface CitySearchViewController ()

@end

@implementation CitySearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"City Search", @"City Search");
        self.tabBarItem.image = [UIImage imageNamed:@"somepngfile"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // using the numbers and puncuation since it has a built-in search/go button
    self.sbCitySearch.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCell = @"ZipCodeCell";
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:tableCell];

    if (tvCell == nil) tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableCell];
    tvCell.textLabel.text = @"Enter your zip code and tap Search.";
    if (cityToSearch != Nil) tvCell.textLabel.text = cityToSearch;
    
    return tvCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (cityToSearch == Nil) return;

    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:1];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];

    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color = [UIColor blackColor];
    activityView.center = self.view.center;
    [self.view addSubview:activityView];

    [activityView startAnimating];

    [self searchBingAPIWithZipCode:searchBar.text];
    
    [activityView stopAnimating];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBingAPIWithZipCode:(NSString *)zipCode
{
    cityToSearch = [BingAPIManager getCity:zipCode];
    [self.tvCities reloadData];
}

@end