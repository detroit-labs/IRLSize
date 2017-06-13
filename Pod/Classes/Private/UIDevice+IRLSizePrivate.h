//
//  UIDevice+IRLSizePrivate.h
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2017 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRLSize.h"

#if TARGET_OS_IOS
@interface UIDevice (IRLSizePrivate)

- (IRLRawSize)irl_rawPhysicalSizeOfView:(nonnull UIView *)view;

@end
#endif
