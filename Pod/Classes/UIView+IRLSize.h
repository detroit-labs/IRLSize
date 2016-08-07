//
//  UIView+IRLSize.h
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//


#import <UIKit/UIKit.h>

#import "IRLSize.h"


@interface UIView (IRLSize)

/**
 *  Calculates the real-life size of the view on screen.
 *
 *  @return The size of the view in real life.
 */
- (IRLSize)irl_dimensions;

/**
 *  Calculates the real-life height of the view on screen.
 *
 *  @return The height in meters.
 */
- (float)irl_height;

/**
 *  Calculates the real-life width of the view on screen.
 *
 *  @return The width in meters.
 */
- (float)irl_width;

/**
 *  Calculates a transform that, when applied to a view, will make it a given height
 *  on screen.
 *
 *  @param height The desired height of the view, in meters.
 *
 *  @return A transform that will make the view the desired height.
 */
- (CGAffineTransform)irl_transformForHeight:(float)height;

/**
 *  Calculates a transform that, when applied to a view, will make it a given width
 *  on screen.
 *
 *  @param width The desired width of the view, in meters.
 *
 *  @return A transform that will make the view the desired width.
 */
- (CGAffineTransform)irl_transformForWidth:(float)width;

/**
 *  Determines if the view is displayed on the device’s main screen.
 *
 *  @return @c YES if the view is on the device’s main screen. @c NO if the view is
 *  not on any screen or if it’s on a secondary screen.
 */
- (BOOL)irl_isOnMainScreen;

/**
 *  Determines if the view is displayed on a secondary screen (e.g. using AirPlay).
 *
 *  @return @c YES if the view is on a screen other than the device’s main screen.
 *          @c NO if the view is not on any screen or if it’s on the primary screen.
 */
- (BOOL)irl_isOnSecondaryScreen;

@end
