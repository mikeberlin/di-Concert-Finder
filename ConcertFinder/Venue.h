//
//  Venue.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/19/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property NSNumber *Id;
@property NSString *Name;
@property NSString *Address;
@property NSString *City;
@property NSString *State;
@property NSString *Url;
@property NSNumber *Latitude;
@property NSNumber *Longitude;

@end