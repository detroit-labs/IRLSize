//
//  IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import <TargetConditionals.h>

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
