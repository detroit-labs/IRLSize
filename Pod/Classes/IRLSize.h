//
//  IRLSize.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <TargetConditionals.h>

#if TARGET_OS_IOS
    #import "UIDevice+IRLSize.h"
    #import "UIView+IRLSize.h"
#elif TARGET_OS_WATCH
    #import "WKInterfaceDevice+IRLSize.h"
    #import "WKInterfaceObject+IRLSize.h"
#endif
