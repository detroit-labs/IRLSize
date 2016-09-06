//
//  UIDevice+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/14.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "UIDevice+IRLSize.h"

#import <SDVersion/SDVersion.h>

#import "UIDevice+IRLSizePrivate.h"
#import "UIView+IRLSize.h"
#import "UIView+IRLSizePrivate.h"

// https://www.sven.de/dpi/ is a good resource for determining screen sizes.
static const float kiPhone4_0InchScreenHeight = 0.0885f;
static const float kiPhone4_0InchScreenWidth = 0.0499f;
static const float kiPhone4_7InchScreenHeight = 0.1041f;
static const float kiPhone4_7InchScreenWidth = 0.0585f;
static const float kiPhone5_5InchScreenHeight = 0.1218f;
static const float kiPhone5_5InchScreenWidth = 0.0685f;

static const float kiPad7_9InchScreenHeight = 0.1605f;
static const float kiPad7_9InchScreenWidth = 0.1204f;
static const float kiPad9_7InchScreenHeight = 0.1971f;
static const float kiPad9_7InchScreenWidth = 0.1478f;
static const float kiPad12_9InchScreenHeight = 0.2622f;
static const float kiPad12_9InchScreenWidth = 0.1965f;

static const NSUInteger kiPhone4_0InchHeightPoints = 568;
static const NSUInteger kiPhone4_7InchHeightPoints = 667;
static const NSUInteger kiPhone5_5InchHeightPoints = 736;

static const NSUInteger kiPadHeightPoints = 1024;
static const NSUInteger kiPadPro12Dot9InchHeightPoints = 1366;


@implementation UIDevice (IRLSizePrivate)

- (RawSize)irl_rawPhysicalSizeOfView:(UIView *)view
{
    RawSize dimensions = { 0.0f, 0.0f };
    
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
        
        RawSize rawPhysicalScreenSize = [self irl_rawPhysicalScreenSize];
        
        dimensions.width = ((CGRectGetWidth(convertedFrame) / windowSize.width) *
                            rawPhysicalScreenSize.width);
        
        dimensions.height = ((CGRectGetHeight(convertedFrame) / windowSize.height) *
                             rawPhysicalScreenSize.height);
    }
    
    return dimensions;
}

- (RawSize)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    RawSize estimatedDimensions = { 0.0f, 0.0f };
    
    CGRect portraitBounds = UIScreen.mainScreen.fixedCoordinateSpace.bounds;
    
    NSUInteger heightPoints = round(CGRectGetHeight(portraitBounds));
    
    switch (heightPoints) {
        case kiPhone4_0InchHeightPoints:
            estimatedDimensions.width = kiPhone4_0InchScreenWidth;
            estimatedDimensions.height = kiPhone4_0InchScreenHeight;
            break;
            
        case kiPhone4_7InchHeightPoints:
            estimatedDimensions.width = kiPhone4_7InchScreenWidth;
            estimatedDimensions.height = kiPhone4_7InchScreenHeight;
            break;
            
        case kiPhone5_5InchHeightPoints:
            estimatedDimensions.width = kiPhone5_5InchScreenWidth;
            estimatedDimensions.height = kiPhone5_5InchScreenHeight;
            break;
            
        case kiPadHeightPoints:
            estimatedDimensions.width = kiPad9_7InchScreenWidth;
            estimatedDimensions.height = kiPad9_7InchScreenHeight;
            break;
            
        case kiPadPro12Dot9InchHeightPoints:
            estimatedDimensions.width = kiPad12_9InchScreenWidth;
            estimatedDimensions.height = kiPad12_9InchScreenHeight;
            break;
    }
    
    return estimatedDimensions;
}

- (RawSize)irl_rawPhysicalScreenSize
{
    RawSize size = { 0.0f, 0.0f };
    
    switch ([SDiOSVersion deviceVersion]) {
        case iPad4:
        case iPadAir:
        case iPadAir2:
        case iPadPro9Dot7Inch:
            size.width = kiPad9_7InchScreenWidth;
            size.height = kiPad9_7InchScreenHeight;
            break;
            
        case iPadMini2:
        case iPadMini3:
        case iPadMini4:
            size.width = kiPad7_9InchScreenWidth;
            size.height = kiPad7_9InchScreenHeight;
            break;
            
        case iPadPro12Dot9Inch:
            size.width = kiPad12_9InchScreenWidth;
            size.height = kiPad12_9InchScreenHeight;
            break;
            
        case iPodTouch6Gen:
        case iPhone5:
        case iPhone5S:
        case iPhone5C:
        case iPhoneSE:
            size.width = kiPhone4_0InchScreenWidth;
            size.height = kiPhone4_0InchScreenHeight;
            break;
            
        case iPhone6:
        case iPhone6S:
            size.width = kiPhone4_7InchScreenWidth;
            size.height = kiPhone4_7InchScreenHeight;
            break;
            
        case iPhone6Plus:
        case iPhone6SPlus:
            size.width = kiPhone5_5InchScreenWidth;
            size.height = kiPhone5_5InchScreenHeight;
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
    RawSize deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.height
                                                 unit:RAW_SIZE_UNIT];
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    RawSize deviceDimensions = [self irl_rawPhysicalScreenSize];
    
    return [[NSMeasurement alloc] initWithDoubleValue:deviceDimensions.width
                                                 unit:RAW_SIZE_UNIT];
}

@end
