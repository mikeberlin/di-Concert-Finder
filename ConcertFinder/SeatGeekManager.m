//
//  SeatGeekManager.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/19/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "SeatGeekManager.h"
#import "Concert.h"
#import "Venue.h"

static NSString *seatGeekBaseUrl = @"http://api.seatgeek.com/2/";

@implementation SeatGeekManager

+ (NSString *)makeRestCall:(NSString*)reqestUrl
{
    NSURLResponse *resp = nil;
    NSError *error = nil;

    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:reqestUrl]];
    NSData *response = [NSURLConnection sendSynchronousRequest:theRequest
                                             returningResponse:&resp
                                                         error:&error];

    return [[NSString alloc] initWithData:response
                                 encoding:NSUTF8StringEncoding];
}

+ (NSString *)urlEncodeCityName:(NSString *)cityName
{
    return [cityName stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}

+ (NSArray *)getConcerts:(NSString *)cityName
{
    NSError *jsonError = nil;
    NSString *responseStr = [self makeRestCall:[NSString stringWithFormat:@"%@events?venue.city=%@&q=concert&per_page=50", seatGeekBaseUrl, [self urlEncodeCityName:cityName]]];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:[responseStr dataUsingEncoding:NSUTF8StringEncoding]
                                                            options:NSJSONReadingMutableContainers
                                                              error:&jsonError];

    NSArray *jsonConcerts = [jsonObj objectForKey:@"events"];
    NSMutableArray *concerts = [[NSMutableArray alloc] init];
    
    for (id concert in jsonConcerts) {
        [concerts addObject:[self createConcertFromJsonResponseObj:concert]];
    }

    return concerts;
}

+ (NSArray *)getVenues:(NSString *)cityName
{
    NSError *jsonError = nil;
    NSString *responseStr = [self makeRestCall:[NSString stringWithFormat:@"%@venues?city=%@", seatGeekBaseUrl, [self urlEncodeCityName:cityName]]];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:[responseStr dataUsingEncoding:NSUTF8StringEncoding]
                                                            options:NSJSONReadingMutableContainers
                                                              error:&jsonError];

    NSArray *jsonVenues = [jsonObj objectForKey:@"venues"];
    NSMutableArray *venues = [[NSMutableArray alloc] init];

    for (id venue in jsonVenues) {
        [venues addObject:[self createVenueFromJsonResponseObj:venue]];
    }

    return venues;
}

+ (Venue *)createVenueFromJsonResponseObj:(id)venueJson
{
    Venue *venue = [[Venue alloc] init];
    venue.Id = (NSNumber *)[venueJson objectForKey:@"id"];
    venue.Name = (NSString *)[venueJson objectForKey:@"name"];
    venue.Address = (NSString *)[venueJson objectForKey:@"address"];
    venue.City = (NSString *)[venueJson objectForKey:@"city"];
    venue.State = (NSString *)[venueJson objectForKey:@"state"];
    venue.Url = (NSString *)[venueJson objectForKey:@"url"];

    id locationNode = [venueJson objectForKey:@"location"];
    venue.Latitude = (NSNumber *)[locationNode objectForKey:@"lat"];
    venue.Longitude = (NSNumber *)[locationNode objectForKey:@"lon"];

    return venue;
}

+ (Concert *)createConcertFromJsonResponseObj:(id)concertJson
{
    Concert *concert = [[Concert alloc] init];
    concert.Id = (NSNumber *)[concertJson objectForKey:@"id"];
    concert.Title = (NSString *)[concertJson objectForKey:@"title"];
    concert.LocalDateTime = [self createDateFromJsonResponseObj:[concertJson objectForKey:@"datetime_local"]];
    concert.Url = (NSString *)[concertJson objectForKey:@"url"];
    concert.Venue = [self createVenueFromJsonResponseObj:[concertJson objectForKey:@"venue"]];

    return concert;
}

+ (NSDate *)createDateFromJsonResponseObj:(NSString *)jsonDate
{
    // Seat Geek dates are returned in this format: 2013-03-01T21:35:43
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];

    return [dateFormatter dateFromString:jsonDate];
}

@end