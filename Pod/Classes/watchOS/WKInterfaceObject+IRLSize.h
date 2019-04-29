//
//  WKInterfaceObject+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import <WatchKit/WatchKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKInterfaceObject (IRLSize)

/**
 Sets the physical width of the interface object on screen.

 @param width The physical width to set on the interface object.
 */
- (void)irl_setPhysicalWidth:(NSMeasurement<NSUnitLength *> *)width NS_SWIFT_NAME(setPhysicalWidth(_:)) IRL_WATCHOS_AVAILABLE(3.0);

/**
 Sets the physical height of the interface object on screen.
 
 @param height The physical height to set on the interface object.
 */
- (void)irl_setPhysicalHeight:(NSMeasurement<NSUnitLength *> *)height NS_SWIFT_NAME(setPhysicalHeight(_:)) IRL_WATCHOS_AVAILABLE(3.0);

/**
 Sets the physical width of the interface object on screen.

 @param width The physical width to set on the interface object as a raw value.
 */
- (void)irl_setRawPhysicalWidth:(IRLRawMillimeters)width NS_SWIFT_NAME(setRawPhysicalWidth(_:));

/**
 Sets the physical height of the interface object on screen.
 
 @param height The physical height to set on the interface object as a raw value.
 */
- (void)irl_setRawPhysicalHeight:(IRLRawMillimeters)height NS_SWIFT_NAME(setRawPhysicalHeight(_:));

@end

NS_ASSUME_NONNULL_END
