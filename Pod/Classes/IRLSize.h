//
//  IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <TargetConditionals.h>

#define IRL_SUPPORTS_NSMEASUREMENT (__IPHONE_10_0 > 0 && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0)

#if TARGET_OS_IOS
    #define IRL_IOS_AVAILABLE(v) __attribute__((availability(ios,introduced=v)))
#elif TARGET_OS_WATCH
    #define IRL_WATCHOS_AVAILABLE(v) __attribute__((availability(watchos,introduced=v)))
#endif

typedef float IRLRawLengthMeasurement; // meters

typedef struct {
    IRLRawLengthMeasurement width;
    IRLRawLengthMeasurement height;
} IRLRawSize;

#define IRL_RAW_SIZE_UNIT NSUnitLength.meters

#if TARGET_OS_IOS
    #import "UIDevice+IRLSize.h"
    #import "UIView+IRLSize.h"
#elif TARGET_OS_WATCH
    #import "WKInterfaceDevice+IRLSize.h"
    #import "WKInterfaceObject+IRLSize.h"
#endif
