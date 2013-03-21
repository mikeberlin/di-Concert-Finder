//
//  BingAPIManager.h
//  ConcertFinder
//
//  Created by Mike Berlin on 3/18/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BingAPIManager : NSObject

+ (NSString *)getCity:(NSString *)zipCode;

@end