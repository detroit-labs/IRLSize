//
//  UIDevice+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (IRLSize)

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
