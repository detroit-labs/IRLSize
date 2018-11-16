//
//  WKInterfaceDevice+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import <WatchKit/WatchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKInterfaceDevice (IRLSize)

/**
 The physical height of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenHeight NS_SWIFT_NAME(physicalScreenHeight) IRL_WATCHOS_AVAILABLE(3.0);

/**
 The physical width of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenWidth NS_SWIFT_NAME(physicalScreenWidth) IRL_WATCHOS_AVAILABLE(3.0);

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
