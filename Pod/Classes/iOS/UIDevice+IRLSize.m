//
//  UIDevice+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import "IRLSize.h"

#import <Orchard/Orchard.h>

#import "IRLSizeMacros.h"
#import "UIView+IRLSizePrivate.h"
#import "iOSDeviceConstants.h"

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

- (IRLRawDimensions)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    IRLRawDimensions estimatedDimensions = { 0.0f, 0.0f };
    
    UIScreen *mainScreen = UIScreen.mainScreen;
    CGRect portraitBounds = mainScreen.fixedCoordinateSpace.bounds;
    
    NSUInteger heightPoints = round(CGRectGetHeight(portraitBounds));
    NSUInteger scale = mainScreen.scale;
    
    switch (heightPoints) {
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 3_5Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 4_0Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 4_7Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 5_5Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 5_8Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 6_1Inch2)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPhone, 6_7Inch)
            
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
            
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 9_7Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 10_2Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 10_5Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 11Inch)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, iPad, 12_9Inch)
    }
    
    return estimatedDimensions;
}

- (IRLRawDimensions)irl_rawPhysicalScreenSize
{
    IRLRawDimensions size = { 0.0f, 0.0f };
    
    switch ([UIDevice.currentDevice orchardiOSDevice]) {
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone14ProMax)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone14Pro)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone14Plus)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone14)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone13ProMax)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone13Pro)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone13Mini)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone13)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone12ProMax)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone12Pro)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone12)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone12Mini)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhoneSE2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone11ProMax)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone11Pro)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone11)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhoneXSMax)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhoneXS)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhoneXR)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhoneX)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone8Plus)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone8)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone7Plus)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone7)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone6sPlus)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone6s)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone6Plus)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone6)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhoneSE)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone5s)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone5c)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPhone5)

        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro11Inch3)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro12_9Inch5)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPad9)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadMini6)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadAir4)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro12_9Inch4)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro11Inch2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPad8)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPad7)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadAir3)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadMini5)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro12_9Inch3)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro11Inch)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro12_9Inch2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro10_5Inch)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPad6)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPad5)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro9_7Inch)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadPro12_9Inch)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadMini4)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadAir2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadMini3)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadMini2)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadAir)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPadMini)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPad4)

        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPodTouch7)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPodTouch6)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardiOSDevice, iPodTouch5)
        
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
