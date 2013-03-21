//
//  ConcertDetailViewController.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/19/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "ConcertDetailViewController.h"

@interface ConcertDetailViewController ()

@end

@implementation ConcertDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"M-d-yyyy"];

    self.lblConcertDate.text = [dateFormat stringFromDate:self.ConcertToDisplay.LocalDateTime];
    self.lblConcertDate.numberOfLines = 0;
    self.lblConcertDate.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.lblConcertTitle.text = self.ConcertToDisplay.Title;
    self.lblConcertTitle.numberOfLines = 0;
    self.lblConcertTitle.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}

@end