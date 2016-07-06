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
 *  Get the height of the device’s screen.
 *
 *  @return The height of the device screen. If the view is not on the main screen,
 *          returns @c nil .
 */
@property (nonatomic, readonly, getter=irl_physicalScreenHeight) NSMeasurement<NSUnitLength *> *physicalScreenHeight;

/**
 *  Get the width of the device’s screen.
 *
 *  @return The height of the device screen If the view is not on the main screen,
 *          returns @c nil .
 */
@property (nonatomic, readonly, getter=irl_physicalScreenWidth) NSMeasurement<NSUnitLength *> *physicalScreenWidth;

@end

NS_ASSUME_NONNULL_END
