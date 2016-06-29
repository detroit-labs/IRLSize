//
//  IRLSize.h
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//

#import <TargetConditionals.h>

#if TARGET_OS_IOS
    #import "UIDevice+IRLSize.h"
    #import "UIView+IRLSize.h"
#elif TARGET_OS_WATCH
    #import "WKInterfaceDevice+IRLSize.h"
    #import "WKInterfaceObject+IRLSize.h"
#endif
