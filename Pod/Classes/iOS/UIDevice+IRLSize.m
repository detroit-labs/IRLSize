//
//  UIDevice+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import "IRLSize.h"

#import <SDVersion/SDVersion.h>

#import "UIView+IRLSizePrivate.h"
#import "iOSDeviceConstants.h"

#if IRLSIZE_DEBUG
#define DEBUG_LOG(x) NSLog(x)
#else
#define DEBUG_LOG(x)
#endif

void IRLRawDimensionsSwap(IRLRawDimensions *dimensions) {
    IRLRawMillimeters temp = dimensions->width;
    dimensions->width = dimensions->height;
    dimensions->height = temp;
}

@implementation UIDevice (IRLSizePrivate)

- (IRLRawDimensions)irl_rawPhysicalSizeOfView:(UIView *)view
{
    IRLRawDimensions dimensions = { 0.0f, 0.0f };
    
    // If the view’s window is nil, we’ll just assume that it will be going onto
    // the main screen. This is what happens if you use this code during
    // -[UIViewController viewWillAppear:], which is the most logical place to
    // be doing this anyway.
    if (view.window == nil || view.irl_isOnMainScreen) {
        UIApplication *application = UIApplication.sharedApplication;
        
        // Convert the view into the window coordinate space. Takes care of any
        // weird custom rotation stuff going on. You may get interesting results
        // from rotated views.
        UIWindow *window = view.window ?: application.keyWindow;
        
        CGRect convertedFrame = [window convertRect:view.frame
                                           fromView:view.superview];
        
        if (window == nil) {
            convertedFrame = view.frame;
        }
        
        CGSize windowSize = window.screen.bounds.size;
        
        IRLRawDimensions rawPhysicalScreenSize = [self irl_rawPhysicalScreenSize];
        
        if (window == nil) {
            windowSize = UIScreen.mainScreen.fixedCoordinateSpace.bounds.size;
        }
        else if (UIInterfaceOrientationIsLandscape(application.statusBarOrientation)) {
            IRLRawDimensionsSwap(&rawPhysicalScreenSize);
        }
        
        dimensions.width = ((CGRectGetWidth(convertedFrame) / windowSize.width) *
                            rawPhysicalScreenSize.width);
        
        dimensions.height = ((CGRectGetHeight(convertedFrame) / windowSize.height) *
                             rawPhysicalScreenSize.height);
    }
    
    return dimensions;
}

#define IRL_ESTIMATED_DIMENSIONS(variable, deviceType, size) \
    case k##deviceType##size##InchHeightPoints: { \
        DEBUG_LOG(@"Estimating height of " #deviceType " at " #size " inches."); \
        variable.height = k##deviceType##size##InchScreenHeight; \
        variable.width = k##deviceType##size##InchScreenWidth; \
    } \
    break;

- (IRLRawDimensions)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    IRLRawDimensions estimatedDimensions = { 0.0f, 0.0f };
    
    UIScreen *mainScreen = UIScreen.mainScreen;
    CGRect portraitBounds = mainScreen.fixedCoordinateSpace.bounds;
    
    NSUInteger heightPoints = round(CGRectGetHeight(portraitBounds));
    NSUInteger scale = mainScreen.scale;
    
    switch (heightPoints) {
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 3_5)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 4_0)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 4_7)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 5_5)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 5_8)
            
        case kiPhone6_1InchHeightPoints:
            if (scale == 3) {
                estimatedDimensions.height = kiPhone6_5InchScreenHeight;
                estimatedDimensions.width = kiPhone6_5InchScreenWidth;
            }
            else {
                estimatedDimensions.height = kiPhone6_1InchScreenHeight;
                estimatedDimensions.width = kiPhone6_1InchScreenWidth;
            }
            break;
            
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 9_7)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 10_5)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 11_0)
            IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 12_9)
    }
    
    return estimatedDimensions;
}

#define IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(modelEnum, sizeEnumPrefix)\
    case modelEnum: { \
        DEBUG_LOG(@"Local device matches " #modelEnum "."); \
        size.height = k##sizeEnumPrefix##ScreenHeight; \
        size.width = k##sizeEnumPrefix##ScreenWidth; \
    } \
    break;

#define IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(enum) \
    IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(enum, enum)

- (IRLRawDimensions)irl_rawPhysicalScreenSize
{
    IRLRawDimensions size = { 0.0f, 0.0f };
    
    switch ([SDiOSVersion deviceVersion]) {
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone5)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPhone5S, iPhone5s)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPhone5C, iPhone5c)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhoneSE)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone6)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone6Plus)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPhone6S, iPhone6s)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPhone6SPlus, iPhone6sPlus)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone7)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone7Plus)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone8)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhone8Plus)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPhoneX)
            
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPad4)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPadMini)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPadAir)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPadMini2)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPadMini3)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPadAir2)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPadMini4)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPadPro9Dot7Inch, iPadPro9_7Inch)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPadPro12Dot9Inch, iPadPro12_9Inch)
            IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(iPad5)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPadPro10Dot5Inch, iPadPro10_5Inch)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPadPro12Dot9Inch2Gen, iPadPro12_9Inch2)
            
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPodTouch5Gen, iPodTouch5)
            IRL_KNOWN_DEVICE_DIMENSIONS_UNMATCHING(iPodTouch6Gen, iPodTouch6)

        default:
            size = [self irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight];
            break;
    }
    
    return size;
}

@end

@implementation UIDevice (IRLSize)

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenHeight
{
    return IRL_MM(self.irl_rawPhysicalScreenSize.height);
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    return IRL_MM(self.irl_rawPhysicalScreenSize.width);
}

- (IRLRawMillimeters)irl_rawPhysicalScreenHeight
{
    return self.irl_rawPhysicalScreenSize.height;
}

- (IRLRawMillimeters)irl_rawPhysicalScreenWidth
{
    return self.irl_rawPhysicalScreenSize.width;
}

@end
