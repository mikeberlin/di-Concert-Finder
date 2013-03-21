//
//  BingAPIManager.m
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "BingAPIManager.h"

static NSString *bingBaseUrl = @"http://dev.virtualearth.net/REST/v1/";
static NSString *bingApiKey = @"AptJri0D1ouACEBZGLOQv7yiqZ613r_gm1DVLxrYUNFNqZmQpbQiAN52MqbTSrrI";

@implementation BingAPIManager

+ (NSString *)makeRestCall:(NSString*)reqestUrl
{
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:reqestUrl]];
    NSData *response = [NSURLConnection sendSynchronousRequest: theRequest
                                             returningResponse: &resp
                                                         error: &error];

    return [[NSString alloc] initWithData:response
                                 encoding:NSUTF8StringEncoding];
}

+ (NSString *)getCity:(NSString *)zipCode
{
    NSError *jsonError = nil;
    NSString *responseStr = [self makeRestCall:[NSString stringWithFormat:@"%@Locations?postalcode=%@&key=%@", bingBaseUrl, zipCode, bingApiKey]];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:[responseStr dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];

    id resourceSets = [jsonObj objectForKey:@"resourceSets"];
    id resources = [[resourceSets objectAtIndex:0] objectForKey:@"resources"];
    id address = [[resources objectAtIndex:0] objectForKey:@"address"];
    id locality = [address objectForKey:@"locality"];

    return [NSString stringWithFormat:@"%@", locality];
}

@end