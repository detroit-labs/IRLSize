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

- (float)irl_deviceHeight;	// meters
- (float)irl_deviceWidth;	// meters

- (IRLSize)irl_dimensionsOfView:(UIView *)view;

@end

IRL_ASSUME_NONNULL_END
