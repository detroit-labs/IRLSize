//
//  WKInterfaceDevice+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import "IRLSize.h"

#import <SDVersion/SDVersion.h>

#import "IRLSizeMacros.h"
#import "watchOSDeviceConstants.h"

@implementation WKInterfaceDevice (IRLSizePrivate)

- (IRLRawDimensions)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    IRLRawDimensions estimatedDimensions = { 0.0f, 0.0f };
    
    NSUInteger heightPoints = round(CGRectGetHeight(self.screenBounds));
    
    switch (heightPoints) {
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 38mm)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 40mm)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 42mm)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 44mm)
    }
    
    return estimatedDimensions;
}

- (IRLRawDimensions)irl_rawPhysicalScreenSize
{
    IRLRawDimensions size = { 0.0f, 0.0f };
    
    switch ([SDwatchOSVersion deviceVersion]) {
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch38mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch42mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch38mmSeries1)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch42mmSeries1)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch38mmSeries2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch42mmSeries2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch38mmSeries3)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(AppleWatch42mmSeries3)

        default:
            size = [self irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight];
    }

    return size;
}

@end

@implementation WKInterfaceDevice (IRLSize)

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenHeight
{
    return IRL_MM(self.irl_rawPhysicalScreenSize.height);
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    return IRL_MM(self.irl_rawPhysicalScreenSize.width);
}

- (IRLRawMillimeters)irl_rawPhysicalScreenHeight
{
    return self.irl_rawPhysicalScreenSize.height;
}

- (IRLRawMillimeters)irl_rawPhysicalScreenWidth
{
    return self.irl_rawPhysicalScreenSize.width;
}

@end
