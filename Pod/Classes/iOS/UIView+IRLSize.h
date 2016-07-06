//
//  UIView+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (IRLSize)

/**
 *  Calculates the real-life height of the view on screen.
 *
 *  @return The height.
 */
@property (nonatomic, readonly, nullable, getter=irl_physicalHeight) NSMeasurement<NSUnitLength *> *physicalHeight;

/**
 *  Calculates the real-life width of the view on screen.
 *
 *  @return The width.
 */
@property (nonatomic, readonly, nullable, getter=irl_physicalWidth) NSMeasurement<NSUnitLength *> *physicalWidth;

/**
 *  Calculates a transform that, when applied to a view, will make it a given height
 *  on screen.
 *
 *  @param height The desired height of the view.
 *
 *  @return A transform that will make the view the desired height.
 */
- (CGAffineTransform)irl_transformForPhysicalHeight:(NSMeasurement<NSUnitLength *> *)physicalHeight NS_SWIFT_NAME(transform(forPhysicalHeight:));

/**
 *  Calculates a transform that, when applied to a view, will make it a given width
 *  on screen.
 *
 *  @param width The desired width of the view.
 *
 *  @return A transform that will make the view the desired width.
 */
- (CGAffineTransform)irl_transformForPhysicalWidth:(NSMeasurement<NSUnitLength *> *)physicalWidth NS_SWIFT_NAME(transform(forPhysicalWidth:));

@end

NS_ASSUME_NONNULL_END
