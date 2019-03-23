//
//  UIDevice+IRLSizePrivate.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRLSize.h"

#if TARGET_OS_IOS
@interface UIDevice (IRLSizePrivate)

- (IRLRawDimensions)irl_rawPhysicalSizeOfView:(nonnull UIView *)view;

@end
#endif
