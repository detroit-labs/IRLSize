//
//  UIDevice+IRLSize.h
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//


#import <UIKit/UIKit.h>

#import "IRLSize.h"


IRL_ASSUME_NONNULL_BEGIN

@interface UIDevice (IRLSize)

/**
 *  Get the height of the device’s screen.
 *
 *  @return The height of the device screen, in meters.
 */
- (float)irl_deviceHeight;

/**
 *  Get the width of the device’s screen.
 *
 *  @return The height of the device screen, in meters.
 */
- (float)irl_deviceWidth;

/**
 *  Computes the real-world size of a view as projected on the device’s screen.
 *
 *  @param view The view to measure. Assumed not to be @c nil.
 *
 *  @return The physical size of the view.
 */
- (IRLSize)irl_dimensionsOfView:(UIView *)view;

@end

IRL_ASSUME_NONNULL_END
