//
//  UIDevice+IRLSizePrivate.h
//  Pods
//
//  Created by Jeff Kelley on 6/29/16.
//
//

#import <UIKit/UIKit.h>

#import "IRLSizePrivate.h"

#ifndef UIDevice_IRLSizePrivate_h
#define UIDevice_IRLSizePrivate_h

#if TARGET_OS_IOS
@interface UIDevice (IRLSizePrivate)

- (RawSize)irl_rawPhysicalSizeOfView:(nonnull UIView *)view NS_SWIFT_NAME(rawPhysicalSize(of:));

@end
#endif

#endif /* UIDevice_IRLSizePrivate_h */
