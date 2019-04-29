//
//  IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import <TargetConditionals.h>

#if TARGET_OS_IOS
    #define IRL_IOS_AVAILABLE(v) __attribute__((availability(ios,introduced=v)))
#elif TARGET_OS_WATCH
    #define IRL_WATCHOS_AVAILABLE(v) __attribute__((availability(watchos,introduced=v)))
#endif

typedef double IRLRawMillimeters;

typedef struct {
    IRLRawMillimeters width;
    IRLRawMillimeters height;
} IRLRawDimensions;

#define IRL_SIZE_UNIT NSUnitLength.millimeters

#if TARGET_OS_IOS
    #import "UIDevice+IRLSize.h"
    #import "UIView+IRLSize.h"
#elif TARGET_OS_WATCH
    #import "WKInterfaceDevice+IRLSize.h"
    #import "WKInterfaceObject+IRLSize.h"
#endif
