//
//  WKInterfaceDevice+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2017 Detroit Labs. All rights reserved.
//

#import <WatchKit/WatchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKInterfaceDevice (IRLSize)

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 The physical height of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenHeight NS_SWIFT_NAME(physicalScreenHeight) IRL_WATCHOS_AVAILABLE(3.0);
#endif

/**
 The physical height of the device’s screen as a raw value.
 */
@property (nonatomic, readonly) IRLRawLengthMeasurement irl_rawPhysicalScreenHeight NS_SWIFT_NAME(rawPhysicalScreenHeight);

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 The physical width of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenWidth NS_SWIFT_NAME(physicalScreenWidth) IRL_WATCHOS_AVAILABLE(3.0);
#endif

/**
 The physical width of the device’s screen as a raw value.
 */
@property (nonatomic, readonly) IRLRawLengthMeasurement irl_rawPhysicalScreenWidth NS_SWIFT_NAME(rawPhysicalScreenWidth);

@end

NS_ASSUME_NONNULL_END
