//
//  ConcertDetailViewController.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/19/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Concert.h"

@interface ConcertDetailViewController : UIViewController

- (IBAction)btnDone:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblConcertTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblConcertDate;

@property Concert *ConcertToDisplay;

@end