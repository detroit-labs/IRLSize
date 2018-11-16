//
//  IRLMeasurementBeWithinMatcher.m
//  IRLSizeExample
//
//  Created by Jeff Kelley on 8/13/2016.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import "IRLMeasurementBeWithinMatcher.h"

#import "KWFormatter.h"
#import "KWObjCUtilities.h"
#import "KWValue.h"

#import "NSMeasurement+Equality.h"

IRL_IOS_AVAILABLE(10.0)
@interface IRLMeasurementBeWithinMatcher()

@property (nonatomic, readwrite) double distance;
@property (nonnull, nonatomic, readwrite, strong) NSMeasurement *otherValue;

@end

@implementation IRLMeasurementBeWithinMatcher

#pragma mark - Getting Matcher Strings

+ (NSArray *)matcherStrings
{
    return @[
             @"beWithin:ofMeasurement:",
             @"equalMeasurement:withDelta:",
             ];
}

#pragma mark - Matching

- (BOOL)evaluate
{
    if (@available(iOS 10.0, *)) {
        NSMeasurement *subject = self.subject;
        
        NSAssert([subject isKindOfClass:[NSMeasurement class]],
                 @"This matcher can only be used on NSMeasurement instances.");
        
        return [subject irl_isEqualToMeasurement:self.otherValue
                                       withDelta:self.distance];
    }
    else {
        NSAssert(false, @"This matcher requires iOS 10 or later.");
        return false;
    }
}

#pragma mark - Getting Failure Messages

- (NSString *)failureMessageForShould
{
    return [NSString stringWithFormat:
            @"expected subject to be within %f of %@, got %@",
            self.distance,
            [KWFormatter formatObject:self.otherValue],
            [KWFormatter formatObject:self.subject]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"be within %f of %@",
            self.distance,
            self.otherValue];
}

#pragma mark - Configuring Matchers

- (void)beWithin:(double)aDistance ofMeasurement:(nonnull NSMeasurement *)aValue
{
    self.distance = aDistance;
    self.otherValue = aValue;
}

- (void)equalMeasurement:(nonnull NSMeasurement *)aValue withDelta:(double)aDelta
{
    [self beWithin:aDelta ofMeasurement:aValue];
}

@end
