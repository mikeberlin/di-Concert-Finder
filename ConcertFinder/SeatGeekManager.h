//
//  SeatGeekManager.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/19/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeatGeekManager : NSObject

+ (NSArray *)getConcerts:(NSString *)cityName;
+ (NSArray *)getVenues:(NSString *)cityName;

@end