//
//  UIView+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "UIView+IRLSize.h"

#import "UIDevice+IRLSizePrivate.h"

@implementation UIView (IRLSize)

- (RawSize)irl_rawPhysicalSize
{
    return [[UIDevice currentDevice] irl_rawPhysicalSizeOfView:self];
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalWidth
{
    return [[NSMeasurement alloc] initWithDoubleValue:[self irl_rawPhysicalSize].width
                                                 unit:[NSUnitLength meters]];
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalHeight
{
    return [[NSMeasurement alloc] initWithDoubleValue:[self irl_rawPhysicalSize].height
                                                 unit:[NSUnitLength meters]];
}

- (CGAffineTransform)irl_transformForPhysicalWidth:(NSMeasurement<NSUnitLength *> *)physicalWidth
{
    NSMeasurement<NSUnitLength *> *currentPhysicalWidth = self.physicalWidth;
    
    if (currentPhysicalWidth == nil || [self irl_isOnSecondaryScreen]) {
        return self.transform;
    }
    
    return [self irl_scaleTransformForTargetMeasurement:physicalWidth
                                     currentMeasurement:currentPhysicalWidth];
}

- (CGAffineTransform)irl_transformForPhysicalHeight:(NSMeasurement<NSUnitLength *> *)physicalHeight
{
    NSMeasurement<NSUnitLength *> *currentPhysicalHeight = self.physicalHeight;
    
    if (currentPhysicalHeight == nil || [self irl_isOnSecondaryScreen]) {
        return self.transform;
    }
    
    return [self irl_scaleTransformForTargetMeasurement:physicalHeight
                                     currentMeasurement:currentPhysicalHeight];
}

- (CGAffineTransform)irl_scaleTransformForTargetMeasurement:(NSMeasurement *)target
                                         currentMeasurement:(NSMeasurement *)current
{
    if ([target canBeConvertedToUnit:current.unit]) {
        NSMeasurement *convertedTarget =
        [target measurementByConvertingToUnit:current.unit];
        
        double ratio = convertedTarget.doubleValue / current.doubleValue;
        
        return CGAffineTransformScale(self.transform, ratio, ratio);
    }
    else {
        return self.transform;
    }
}

- (BOOL)irl_isOnMainScreen
{
    return (self.window.screen == [UIScreen mainScreen]);
}

- (BOOL)irl_isOnSecondaryScreen
{
    return (self.window != nil && ![self irl_isOnMainScreen]);
}

@end
