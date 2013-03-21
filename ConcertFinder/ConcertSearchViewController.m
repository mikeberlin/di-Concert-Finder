//
//  ConcertSearchViewController.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "ConcertSearchViewController.h"
#import "AppDelegate.h"
#import "SeatGeekManager.h"
#import "Concert.h"
#import "ConcertDetailViewController.h"

@interface ConcertSearchViewController ()

@property (strong, nonatomic) NSArray *concerts;

@end

@implementation ConcertSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Concerts", @"Concerts");
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
    self.concerts = [SeatGeekManager getConcerts:cityToSearch];

    [self.tvConcerts reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.concerts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCell = @"ConcertCell";
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:tableCell];

    if (tvCell == nil) tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableCell];

    if (cityToSearch != Nil)
    {
        Concert *currentConcert = (Concert *)[self.concerts objectAtIndex:indexPath.row];
        tvCell.textLabel.text = currentConcert.Title;
    }

    return tvCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Concert *selectedConcert = (Concert *)[self.concerts objectAtIndex:indexPath.row];

    ConcertDetailViewController *vcConcertDetail = [[ConcertDetailViewController alloc] init];
    vcConcertDetail.ConcertToDisplay = selectedConcert;

    [self presentViewController:vcConcertDetail animated:YES completion:Nil];
}

@end