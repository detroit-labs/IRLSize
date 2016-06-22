//
//  UIDevice+IRLSize.m
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//


#import "UIDevice+IRLSize.h"

#import "SDVersion.h"

#import "UIView+IRLSize.h"


// https://www.sven.de/dpi/ is a good resource for determining screen sizes.
static const float kiPhone3_5InchScreenHeight = 0.0740f;
static const float kiPhone3_5InchScreenWidth = 0.0493f;
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

static const NSUInteger kiPhone3_5InchHeightPoints = 480;
static const NSUInteger kiPhone4_0InchHeightPoints = 568;
static const NSUInteger kiPhone4_7InchHeightPoints = 667;
static const NSUInteger kiPhone5_5InchHeightPoints = 736;

static const NSUInteger kiPadHeightPoints = 1024;
static const NSUInteger kiPadProHeightPoints = 1366;


@implementation UIDevice (IRLSize)

- (IRLSize)irl_dimensionsOfView:(UIView *)view
{
    IRLSize dimensions = { 0.0f, 0.0f };
    
    // If the view’s window is nil, we’ll just assume that it will be going onto
    // the main screen. This is what happens if you use this code during
    // -[UIViewController viewWillAppear:], which is the most logical place to
    // be doing this anyway.
    if (view.window == nil || [view irl_isOnMainScreen]) {
        // Convert the view into the window coordinate space. Takes care of any
        // weird custom rotation stuff going on. You may get interesting results
        // from rotated views.
        UIWindow *window = view.window ?: [UIApplication sharedApplication].keyWindow;
        CGRect convertedFrame = [window convertRect:view.frame
                                           fromView:view.superview];
        
        if (window == nil) {
            convertedFrame = view.frame;
        }
        
        CGSize windowSize = window.screen.bounds.size;
        
        if (window == nil) {
            if ([[UIScreen mainScreen] respondsToSelector:@selector(fixedCoordinateSpace)]) {
                windowSize = [UIScreen mainScreen].fixedCoordinateSpace.bounds.size; // iOS 8 +
            }
            else {
                windowSize = [UIScreen mainScreen].bounds.size; // iOS 7
            }
        }
        else if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
            CGSize windowSizeSwap = CGSizeMake(windowSize.height,
                                               windowSize.width);
            windowSize = windowSizeSwap;
        }
        
        dimensions.width = (CGRectGetWidth(convertedFrame) / windowSize.width) * [self irl_deviceWidth];
        dimensions.height = (CGRectGetHeight(convertedFrame) / windowSize.height) * [self irl_deviceHeight];
        
    }
    
    return dimensions;
}

- (IRLSize)irl_estimatedDeviceSizeFromScreenDimensions
{
    IRLSize estimatedDimensions = { 0.0f, 0.0f };
    
    CGRect portraitBounds;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(fixedCoordinateSpace)]) {
        portraitBounds = [UIScreen mainScreen].fixedCoordinateSpace.bounds; // iOS 8
    }
    else {
        // Prior to iOS 8, a screen’s bounds rectangle always reflected the
        // screen dimensions relative to a portrait-up orientation.
        portraitBounds = [UIScreen mainScreen].bounds;  // iOS 7 and below
    }
    
    NSUInteger heightPoints = round(CGRectGetHeight(portraitBounds));
    
    switch (heightPoints) {
        case kiPhone3_5InchHeightPoints:
            estimatedDimensions.width = kiPhone3_5InchScreenWidth;
            estimatedDimensions.height = kiPhone3_5InchScreenHeight;
            break;
            
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
            
        case kiPadProHeightPoints:
            estimatedDimensions.width = kiPad12_9InchScreenWidth;
            estimatedDimensions.height = kiPad12_9InchScreenHeight;
            break;
    }
    
    return estimatedDimensions;
}

- (float)irl_estimatedDeviceHeightFromScreenDimensions
{
    return [self irl_estimatedDeviceSizeFromScreenDimensions].height;
}

- (float)irl_estimatedDeviceWidthFromScreenDimensions
{
    return [self irl_estimatedDeviceSizeFromScreenDimensions].width;
}

- (float)irl_deviceHeight
{
    float height = 0.0f;
    
    switch ([SDiOSVersion deviceVersion]) {
        case iPad1:
        case iPad2:
        case iPad3:
        case iPad4:
        case iPadAir:
        case iPadAir2:
        case iPadPro9Dot7Inch:
            height = kiPad9_7InchScreenHeight;
            break;
            
        case iPadMini:
        case iPadMini2:
        case iPadMini3:
        case iPadMini4:
            height = kiPad7_9InchScreenHeight;
            break;
            
        case iPadPro12Dot9Inch:
            height = kiPad12_9InchScreenHeight;
            break;
            
        case iPhone4:
        case iPhone4S:
            height = kiPhone3_5InchScreenHeight;
            break;
            
        case iPhone5:
        case iPhone5S:
        case iPhone5C:
            height = kiPhone4_0InchScreenHeight;
            break;
            
        case iPhone6:
        case iPhone6S:
            height = kiPhone4_7InchScreenHeight;
            break;
            
        case iPhone6Plus:
        case iPhone6SPlus:
            height = kiPhone5_5InchScreenHeight;
            break;
            
        default:
            height = [self irl_estimatedDeviceHeightFromScreenDimensions];
            break;
    }
    
    return height;
}

- (float)irl_deviceWidth
{
    float width = 0.0f;
    
    switch ([SDiOSVersion deviceVersion]) {
        case iPad1:
        case iPad2:
        case iPad3:
        case iPad4:
        case iPadAir:
        case iPadAir2:
        case iPadPro9Dot7Inch:
            width = kiPad9_7InchScreenWidth;
            break;
            
        case iPadMini:
        case iPadMini2:
        case iPadMini3:
        case iPadMini4:
            width = kiPad7_9InchScreenWidth;
            break;
            
        case iPadPro12Dot9Inch:
            width = kiPad12_9InchScreenWidth;
            break;
            
        case iPhone4:
        case iPhone4S:
            width = kiPhone3_5InchScreenWidth;
            break;
            
        case iPhone5:
        case iPhone5S:
        case iPhone5C:
            width = kiPhone4_0InchScreenWidth;
            break;
            
        case iPhone6:
        case iPhone6S:
            width = kiPhone4_7InchScreenWidth;
            break;
            
        case iPhone6Plus:
        case iPhone6SPlus:
            width = kiPhone5_5InchScreenWidth;
            break;
            
        default:
            width = [self irl_estimatedDeviceWidthFromScreenDimensions];
            break;
    }
    
    return width;
}

@end
