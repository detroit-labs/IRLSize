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
 The physical height of the view on the screen, or @c nil if the view is not visible
 on the main screen.
 */
@property (nonatomic, readonly, nullable) NSMeasurement<NSUnitLength *> *irl_physicalHeight NS_SWIFT_NAME(physicalHeight);

/**
 The physical width of the view on the screen, or @c nil if the view is not visible
 on the main screen.
 */
@property (nonatomic, readonly, nullable) NSMeasurement<NSUnitLength *> *irl_physicalWidth NS_SWIFT_NAME(physicalWidth);

/**
 Calculates a transform that, when applied to a view, will make it a given height on
 the screen.

 @param physicalHeight The desired physical height of the view on the screen.

 @return A @c CGAffineTransform that will achieve the desired height. If the view is
         not currently visible on the main screen, the return value will be the
         view’s current transform.
 */
- (CGAffineTransform)irl_transformForPhysicalHeight:(NSMeasurement<NSUnitLength *> *)physicalHeight NS_SWIFT_NAME(transform(forPhysicalHeight:));

/**
 Calculates a transform that, when applied to a view, will make it a given width on
 the screen.
 
 @param physicalWidth The desired physical width of the view on the screen.
 
 @return A @c CGAffineTransform that will achieve the desired width. If the view is
         not currently visible on the main screen, the return value will be the
         view’s current transform.
 */
- (CGAffineTransform)irl_transformForPhysicalWidth:(NSMeasurement<NSUnitLength *> *)physicalWidth NS_SWIFT_NAME(transform(forPhysicalWidth:));

@end

NS_ASSUME_NONNULL_END
