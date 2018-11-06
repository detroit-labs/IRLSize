//
//  IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import <TargetConditionals.h>

typedef double IRLRawMillimeters;

typedef struct {
    IRLRawMillimeters width;
    IRLRawMillimeters height;
} IRLRawDimensions;

#define IRL_SIZE_UNIT NSUnitLength.millimeters
#define IRL_MM(x) [[NSMeasurement alloc] initWithDoubleValue:(x) unit: IRL_SIZE_UNIT]

#if TARGET_OS_IOS
    #import "UIDevice+IRLSize.h"
    #import "UIView+IRLSize.h"
#elif TARGET_OS_WATCH
    #import "WKInterfaceDevice+IRLSize.h"
    #import "WKInterfaceObject+IRLSize.h"
#endif
