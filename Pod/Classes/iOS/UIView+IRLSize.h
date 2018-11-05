//
//  UIView+IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRLSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (IRLSize)

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 The physical height of the view on the screen, or @c nil if the view is displayed
 on a secondary screen. If the view is not on any screen, returns measurements for
 the main screen.
 */
@property (nonatomic, readonly, nullable) NSMeasurement<NSUnitLength *> *irl_physicalHeight NS_SWIFT_NAME(physicalHeight) IRL_IOS_AVAILABLE(10.0);
#endif

/**
 The physical height of the view on the screen, or @c 0.0f if the view is displayed
 on a secondary screen. If the view is not on any screen, returns measurements for
 the main screen. Returned as a raw value in meters.
 */
@property (nonatomic, readonly) IRLRawLengthMeasurement irl_rawPhysicalHeight NS_SWIFT_NAME(rawPhysicalHeight);

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 The physical width of the view on the screen, or @c nil if the view is displayed
 on a secondary screen. If the view is not on any screen, returns measurements for
 the main screen.
 */
@property (nonatomic, readonly, nullable) NSMeasurement<NSUnitLength *> *irl_physicalWidth NS_SWIFT_NAME(physicalWidth) IRL_IOS_AVAILABLE(10.0);
#endif

/**
 The physical width of the view on the screen, or @c 0.0f if the view is displayed
 on a secondary screen. If the view is not on any screen, returns measurements for
 the main screen. Returned as a raw value in meters.
 */
@property (nonatomic, readonly) IRLRawLengthMeasurement irl_rawPhysicalWidth NS_SWIFT_NAME(rawPhysicalWidth);

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 Calculates a transform that, when applied to the view, will make it a given height
 on the screen.

 @param physicalHeight The desired physical height of the view on the screen.

 @return A @c CGAffineTransform that will achieve the desired height. If the view is
         displayed on a secondary screen, the return value will be the view’s
         current transform.
 */
- (CGAffineTransform)irl_transformForPhysicalHeight:(NSMeasurement<NSUnitLength *> *)physicalHeight NS_SWIFT_NAME(transform(forPhysicalHeight:)) IRL_IOS_AVAILABLE(10.0);
#endif

/**
 Calculates a transform that, when applied to the view, will make it a given height
 on the screen.
 
 @param rawPhysicalHeight The desired physical height of the view on the screen, as
                          a raw value.
 
 @return A @c CGAffineTransform that will achieve the desired height. If the view is
 displayed on a secondary screen, the return value will be the view’s
 current transform.
 */
- (CGAffineTransform)irl_transformForRawPhysicalHeight:(IRLRawLengthMeasurement)rawPhysicalHeight NS_SWIFT_NAME(transform(forRawPhysicalHeight:));

#if IRL_SUPPORTS_NSMEASUREMENT
/**
 Calculates a transform that, when applied to the view, will make it a given width
 on the screen.
 
 @param physicalWidth The desired physical width of the view on the screen.
 
 @return A @c CGAffineTransform that will achieve the desired width. If the view is
         displayed on a secondary screen, the return value will be the view’s
         current transform.
 */
- (CGAffineTransform)irl_transformForPhysicalWidth:(NSMeasurement<NSUnitLength *> *)physicalWidth NS_SWIFT_NAME(transform(forPhysicalWidth:)) IRL_IOS_AVAILABLE(10.0);
#endif

/**
 Calculates a transform that, when applied to the view, will make it a given width
 on the screen.
 
 @param rawPhysicalWidth The desired physical width of the view on the screen, as a
                         raw value.
 
 @return A @c CGAffineTransform that will achieve the desired width. If the view is
 displayed on a secondary screen, the return value will be the view’s
 current transform.
 */
- (CGAffineTransform)irl_transformForRawPhysicalWidth:(IRLRawLengthMeasurement)rawPhysicalWidth NS_SWIFT_NAME(transform(forRawPhysicalWidth:));

@end

NS_ASSUME_NONNULL_END
