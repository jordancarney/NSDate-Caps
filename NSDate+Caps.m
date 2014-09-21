//
//  NSDate+Caps.m
//  Pedometer
//
//  Created by Jordan Carney on 9/21/14.
//  Copyright (c) 2014 Jordan Carney. All rights reserved.
//

#import "NSDate+Caps.h"

@implementation NSDate (Caps)

- (NSDate *)beginningOfDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:unit
                                               fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    
    NSDate *tomorrow = [calendar dateByAddingComponents:components
                                                 toDate:[self beginningOfDay]
                                                options:0];
    return [tomorrow dateByAddingTimeInterval:-1]; // subtract a second from tomorrow
}

@end
