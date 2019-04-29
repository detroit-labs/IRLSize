//
//  NSMeasurement+Equality.m
//  IRLSizeExample
//
//  Created by Jeff Kelley on 8/13/16.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import "NSMeasurement+Equality.h"

@implementation NSMeasurement (Equality)

- (BOOL)irl_isEqualToMeasurement:(NSMeasurement *)measurement
                       withDelta:(double)allowedDelta
{
    if ([measurement canBeConvertedToUnit:self.unit] == NO) {
        return NO;
    }
    
    NSMeasurement *diff = [self measurementBySubtractingMeasurement:measurement];
    
    return fabs(diff.doubleValue) <= allowedDelta;
}

@end
