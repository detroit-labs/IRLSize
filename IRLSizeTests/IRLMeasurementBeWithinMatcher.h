//
//  IRLMeasurementBeWithinMatcher.h
//  IRLSizeExample
//
//  Created by Jeff Kelley on 8/13/2016.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import <IRLSize/IRLSize.h>
#import <Kiwi/Kiwi.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRLMeasurementBeWithinMatcher : KWMatcher

- (void)beWithin:(double)aDistance ofMeasurement:(NSMeasurement *)aValue IRL_IOS_AVAILABLE(10.0);
- (void)equalMeasurement:(NSMeasurement *)aValue withDelta:(double)aDelta IRL_IOS_AVAILABLE(10.0);

@end

NS_ASSUME_NONNULL_END
