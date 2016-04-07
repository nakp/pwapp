//
//  APSFormatter.m
//  Phun App
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import "APSFormatter.h"

@implementation APSFormatter

+ (NSDateFormatter *)localDateFormater
{
    static NSDateFormatter *localDateFormatter;

    if (!localDateFormatter) {
        localDateFormatter = [NSDateFormatter new];
        localDateFormatter.dateFormat = @"MMM d, yyyy 'at' h:mmaa";
        localDateFormatter.AMSymbol = @"am";
        localDateFormatter.PMSymbol = @"pm";
    }

    return localDateFormatter;
}

@end
