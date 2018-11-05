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
        
        if (window == nil) {
            windowSize = UIScreen.mainScreen.fixedCoordinateSpace.bounds.size;
        }
        else if (UIInterfaceOrientationIsLandscape(application.statusBarOrientation)) {
            CGSize windowSizeSwap = CGSizeMake(windowSize.height,
                                               windowSize.width);
            windowSize = windowSizeSwap;
        }
        
        IRLRawDimensions rawPhysicalScreenSize = [self irl_rawPhysicalScreenSize];
        
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
        case kiPhone3_5InchHeightPoints:
            estimatedDimensions.height = kiPhone3_5InchScreenHeight;
            estimatedDimensions.width = kiPhone3_5InchScreenWidth;
            break;

        case kiPhone4_0InchHeightPoints:
            estimatedDimensions.height = kiPhone4_0InchScreenHeight;
            estimatedDimensions.width = kiPhone4_0InchScreenWidth;
            break;

        case kiPhone4_7InchHeightPoints:
            estimatedDimensions.height = kiPhone4_7InchScreenHeight;
            estimatedDimensions.width = kiPhone4_7InchScreenWidth;
            break;

        case kiPhone5_5InchHeightPoints:
            estimatedDimensions.height = kiPhone5_5InchScreenHeight;
            estimatedDimensions.width = kiPhone5_5InchScreenWidth;
            break;

        case kiPhone5_8InchHeightPoints:
            estimatedDimensions.height = kiPhone5_8InchScreenHeight;
            estimatedDimensions.width = kiPhone5_8InchScreenWidth;
            break;

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

        case kiPadHeightPoints:
            estimatedDimensions.height = kiPad9_7InchScreenHeight;
            estimatedDimensions.width = kiPad9_7InchScreenWidth;
            break;

        case kiPadPro10Dot5InchHeightPoints:
            estimatedDimensions.height = kiPad10_5InchScreenHeight;
            estimatedDimensions.width = kiPad10_5InchScreenWidth;
            break;

        case kiPadPro12Dot9InchHeightPoints:
            estimatedDimensions.height = kiPad12_9InchScreenHeight;
            estimatedDimensions.width = kiPad12_9InchScreenWidth;
            break;
    }
    
    return estimatedDimensions;
}

- (IRLRawDimensions)irl_rawPhysicalScreenSize
{
    IRLRawDimensions size = { 0.0f, 0.0f };
    
    switch ([SDiOSVersion deviceVersion]) {
        case iPhone5:
            size.height = kiPhone5ScreenHeight;
            size.width = kiPhone5ScreenWidth;
            break;

        case iPhone5S:
            size.height = kiPhone5sScreenHeight;
            size.width = kiPhone5sScreenWidth;
            break;

        case iPhone5C:
            size.height = kiPhone5cScreenHeight;
            size.width = kiPhone5cScreenWidth;
            break;

        case iPhoneSE:
            size.height = kiPhoneSEScreenHeight;
            size.width = kiPhoneSEScreenWidth;
            break;

        case iPodTouch5Gen:
            size.height = kiPodTouch5ScreenHeight;
            size.width = kiPodTouch5ScreenWidth;
            break;

        case iPodTouch6Gen:
            size.height = kiPodTouch6ScreenHeight;
            size.width = kiPodTouch6ScreenWidth;
            break;

        case iPhone6:
            size.height = kiPhone6ScreenHeight;
            size.width = kiPhone6ScreenWidth;
            break;

        case iPhone6S:
            size.height = kiPhone6sScreenHeight;
            size.width = kiPhone6sScreenWidth;
            break;

        case iPhone7:
            size.height = kiPhone7ScreenHeight;
            size.width = kiPhone7ScreenWidth;
            break;

        case iPhone8:
            size.height = kiPhone8ScreenHeight;
            size.width = kiPhone8ScreenWidth;
            break;

        case iPhone6Plus:
            size.height = kiPhone6PlusScreenHeight;
            size.width = kiPhone6PlusScreenWidth;
            break;

        case iPhone6SPlus:
            size.height = kiPhone6sPlusScreenHeight;
            size.width = kiPhone6sPlusScreenWidth;
            break;

        case iPhone7Plus:
            size.height = kiPhone7PlusScreenHeight;
            size.width = kiPhone7PlusScreenWidth;
            break;

        case iPhone8Plus:
            size.height = kiPhone8PlusScreenHeight;
            size.width = kiPhone8PlusScreenWidth;
            break;

        case iPhoneX:
            size.height = kiPhoneXScreenHeight;
            size.width = kiPhoneXScreenWidth;
            break;

        case iPad4:
            size.height = kiPad4ScreenHeight;
            size.width = kiPad4ScreenWidth;
            break;

        case iPadAir:
            size.height = kiPadAirScreenHeight;
            size.width = kiPadAirScreenWidth;
            break;

        case iPadAir2:
            size.height = kiPadAir2ScreenHeight;
            size.width = kiPadAir2ScreenWidth;
            break;

        case iPadPro9Dot7Inch:
            size.height = kiPadPro9_7InchScreenHeight;
            size.width = kiPadPro9_7InchScreenWidth;
            break;

        case iPad5:
            size.height = kiPad5ScreenHeight;
            size.width = kiPad5ScreenWidth;
            break;

        case iPadMini:
            size.height = kiPadMiniScreenHeight;
            size.width = kiPadMiniScreenWidth;
            break;

        case iPadMini2:
            size.height = kiPadMini2ScreenHeight;
            size.width = kiPadMini2ScreenWidth;
            break;

        case iPadMini3:
            size.height = kiPadMini3ScreenHeight;
            size.width = kiPadMini3ScreenWidth;
            break;

        case iPadMini4:
            size.height = kiPadMini4ScreenHeight;
            size.width = kiPadMini4ScreenWidth;
            break;

        case iPadPro10Dot5Inch:
            size.height = kiPad10_5InchScreenHeight;
            size.width = kiPad10_5InchScreenWidth;
            break;

        case iPadPro12Dot9Inch:
            size.height = kiPadPro12_9InchScreenHeight;
            size.width = kiPadPro12_9InchScreenWidth;
            break;

        case iPadPro12Dot9Inch2Gen:
            size.height = kiPadPro12_9Inch2ScreenHeight;
            size.width = kiPadPro12_9Inch2ScreenWidth;
            break;

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
    IRLRawDimensions deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.height
                                                 unit:IRL_SIZE_UNIT];
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    IRLRawDimensions deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.width
                                                 unit:IRL_SIZE_UNIT];
}

- (IRLRawMillimeters)irl_rawPhysicalScreenHeight
{
    return [self irl_rawPhysicalScreenSize].height;
}

- (IRLRawMillimeters)irl_rawPhysicalScreenWidth
{
    return [self irl_rawPhysicalScreenSize].width;
}

@end
