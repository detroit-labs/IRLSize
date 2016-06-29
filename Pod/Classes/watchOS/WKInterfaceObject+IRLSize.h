//
//  WKInterfaceObject+IRLSize.h
//  Pods
//
//  Created by Jeff Kelley on 6/29/16.
//
//

#import <WatchKit/WatchKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKInterfaceObject (IRLSize)

- (void)irl_setPhysicalWidth:(NSMeasurement<NSUnitLength *> *)width NS_SWIFT_NAME(setPhysicalWidth(_:));

- (void)irl_setPhysicalHeight:(NSMeasurement<NSUnitLength *> *)height NS_SWIFT_NAME(setPhysicalHeight(_:));

@end

NS_ASSUME_NONNULL_END
