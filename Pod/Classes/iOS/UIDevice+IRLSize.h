//
//  UIDevice+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (IRLSize)

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 The physical height of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenHeight NS_SWIFT_NAME(physicalScreenHeight) IRL_IOS_AVAILABLE(10.0);
#endif

/**
 The physical height of the device’s screen as a raw value.
 */
@property (nonatomic, readonly) IRLRawLengthMeasurement irl_rawPhysicalScreenHeight NS_SWIFT_NAME(rawPhysicalScreenHeight);

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 The physical width of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenWidth NS_SWIFT_NAME(physicalScreenWidth) IRL_IOS_AVAILABLE(10.0);
#endif

/**
 The physical width of the device’s screen as a raw value.
 */
@property (nonatomic, readonly) IRLRawLengthMeasurement irl_rawPhysicalScreenWidth NS_SWIFT_NAME(rawPhysicalScreenWidth);

@end

NS_ASSUME_NONNULL_END
