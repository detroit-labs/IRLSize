//
//  WKInterfaceObject+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <WatchKit/WatchKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKInterfaceObject (IRLSize)

/**
 Sets the physical width of the interface object on screen.

 @param width The physical width to set on the interface object.
 */
- (void)irl_setPhysicalWidth:(NSMeasurement<NSUnitLength *> *)width NS_SWIFT_NAME(setPhysicalWidth(_:));

/**
 Sets the physical height of the interface object on screen.
 
 @param width The physical height to set on the interface object.
 */
- (void)irl_setPhysicalHeight:(NSMeasurement<NSUnitLength *> *)height NS_SWIFT_NAME(setPhysicalHeight(_:));

@end

NS_ASSUME_NONNULL_END
