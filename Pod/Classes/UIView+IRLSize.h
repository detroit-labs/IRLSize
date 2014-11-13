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

- (IRLSize)irl_dimensions;
- (float)irl_height;	// in meters
- (float)irl_width; 	// in meters

- (CGAffineTransform)irl_transformForHeight:(float)height;	// in meters
- (CGAffineTransform)irl_transformForWidth:(float)width;	// in meters

@end
