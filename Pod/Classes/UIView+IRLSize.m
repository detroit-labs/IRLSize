//
//  UIView+IRLSize.m
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//

#import "UIView+IRLSize.h"

#import "UIDevice+IRLSize.h"


@implementation UIView (IRLSize)

- (IRLSize)irl_dimensions
{
    return [[UIDevice currentDevice] irl_dimensionsOfView:self];
}

- (float)irl_height
{
    return [self irl_dimensions].height;
}

- (float)irl_width
{
    return [self irl_dimensions].width;
}

- (CGAffineTransform)irl_scaleTransformForRatio:(float)ratio
{
    return CGAffineTransformMakeScale(ratio, ratio);
}

- (CGAffineTransform)irl_transformForHeight:(float)height
{
    if ([self irl_isOnSecondaryScreen]) {
        return self.transform;
    }
        
    return [self irl_scaleTransformForRatio:height / [self irl_height]];
}

- (CGAffineTransform)irl_transformForWidth:(float)width
{
    if ([self irl_isOnSecondaryScreen]) {
        return self.transform;
    }
    
    return [self irl_scaleTransformForRatio:width / [self irl_width]];
}

- (BOOL)irl_isOnMainScreen
{
    return (self.window.screen == [UIScreen mainScreen]);
}

- (BOOL)irl_isOnSecondaryScreen
{
    return (self.window != nil && ![self irl_isOnMainScreen]);
}

@end
