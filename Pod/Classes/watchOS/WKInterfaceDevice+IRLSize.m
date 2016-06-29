//
//  WKInterfaceDevice+IRLSize.m
//  Pods
//
//  Created by Jeff Kelley on 6/29/16.
//
//


#import "WKInterfaceDevice+IRLSize.h"

#import <SDVersion/SDVersion.h>

#import "IRLSizePrivate.h"

// https://www.sven.de/dpi/ is a good resource for determining screen sizes.
static const float kAppleWatch38mmScreenWidth = 0.0212f;
static const float kAppleWatch38mmScreenHeight = 0.0265f;
static const float kAppleWatch42mmScreenWidth = 0.0243f;
static const float kAppleWatch42mmScreenHeight = 0.0304f;

static const NSUInteger kAppleWatch38mmHeightPoints = 170;
static const NSUInteger kAppleWatch42mmHeightPoints = 195;

@implementation WKInterfaceDevice (IRLSize)

- (RawSize)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    RawSize estimatedDimensions = { 0.0f, 0.0f };
    
    NSUInteger heightPoints = round(CGRectGetHeight(self.screenBounds));
    
    switch (heightPoints) {
        case kAppleWatch38mmHeightPoints:
            estimatedDimensions.width = kAppleWatch38mmScreenWidth;
            estimatedDimensions.height = kAppleWatch38mmScreenHeight;
            break;
            
        case kAppleWatch42mmHeightPoints:
            estimatedDimensions.width = kAppleWatch42mmScreenWidth;
            estimatedDimensions.height = kAppleWatch42mmScreenHeight;
            break;
    }
    
    return estimatedDimensions;
}

- (RawSize)irl_rawPhysicalScreenSize
{
    // TODO: Integrate with SDwatchOSVersion when merged
    RawSize size = [self irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight];

    return size;
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenHeight
{
    RawSize deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.height
                                                 unit:[NSUnitLength meters]];
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    RawSize deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.width
                                                 unit:[NSUnitLength meters]];
}

@end
