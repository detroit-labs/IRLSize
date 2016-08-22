//
//  NSMeasurement+Equality.h
//  IRLSizeExample
//
//  Created by Jeff Kelley on 8/13/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMeasurement (Equality)

/**
 Determines if the given measurement is close enough to the current measurement.

 @param measurement  The measurement to compare with the receiver.
 @param allowedDelta The allowable difference, in the receiver’s unit, between them.

 @return @c YES if the difference between measurements is less than or equal to the
         @c allowedDelta value. @c NO if the difference is too high or if
         @c measurement cannot be converted to the receiver’s unit.
 */
- (BOOL)irl_isEqualToMeasurement:(NSMeasurement *)measurement
                       withDelta:(double)allowedDelta;

@end
