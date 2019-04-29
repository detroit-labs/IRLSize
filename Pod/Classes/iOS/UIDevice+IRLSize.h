//
//  UIDevice+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (IRLSize)

/**
 The physical height of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenHeight NS_SWIFT_NAME(physicalScreenHeight) IRL_IOS_AVAILABLE(10.0);

/**
 The physical width of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenWidth NS_SWIFT_NAME(physicalScreenWidth) IRL_IOS_AVAILABLE(10.0);

/**
 The physical height of the device’s screen as a raw value.
 */
@property (nonatomic, readonly) IRLRawMillimeters irl_rawPhysicalScreenHeight NS_SWIFT_NAME(rawPhysicalScreenHeight);

/**
 The physical width of the device’s screen as a raw value.
 */
@property (nonatomic, readonly) IRLRawMillimeters irl_rawPhysicalScreenWidth NS_SWIFT_NAME(rawPhysicalScreenWidth);

@end

NS_ASSUME_NONNULL_END
