//
//  Concert.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/19/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venue.h"

@interface Concert : NSObject

@property NSNumber *Id;
@property NSString *Title;
@property NSDate *LocalDateTime;
@property NSString *Url;
@property Venue *Venue;

@end