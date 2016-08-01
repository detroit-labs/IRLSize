//
//  WKInterfaceDevice+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <WatchKit/WatchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKInterfaceDevice (IRLSize)

/**
 The physical height of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenHeight NS_SWIFT_NAME(physicalScreenHeight);

/**
 The physical width of the device’s screen.
 */
@property (nonatomic, readonly) NSMeasurement<NSUnitLength *> *irl_physicalScreenWidth NS_SWIFT_NAME(physicalScreenWidth);

@end

NS_ASSUME_NONNULL_END
