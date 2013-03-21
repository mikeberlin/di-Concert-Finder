//
//  ArtistSearchViewController.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "ArtistSearchViewController.h"
#import "AppDelegate.h"

@interface ArtistSearchViewController ()

@end

@implementation ArtistSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Artists", @"Artists");
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
    self.lblArtistToSearch.text = [NSString stringWithFormat:@"Searching city: %@", cityToSearch];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end