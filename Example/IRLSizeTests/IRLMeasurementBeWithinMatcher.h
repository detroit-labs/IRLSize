//
//  IRLMeasurementBeWithinMatcher.h
//  IRLSizeExample
//
//  Created by Jeff Kelley on 8/13/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRLMeasurementBeWithinMatcher : KWMatcher

- (void)beWithin:(double)aDistance ofMeasurement:(NSMeasurement *)aValue;
- (void)equalMeasurement:(NSMeasurement *)aValue withDelta:(double)aDelta;

@end

NS_ASSUME_NONNULL_END
