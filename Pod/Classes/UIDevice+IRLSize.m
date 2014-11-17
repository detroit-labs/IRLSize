//
//  UIDevice+IRLSize.m
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//


#import "UIDevice+IRLSize.h"

#import "SDiPhoneVersion.h"

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

static const NSUInteger kiPhone3_5InchHeightPoints = 480;
static const NSUInteger kiPhone4_0InchHeightPoints = 568;
static const NSUInteger kiPhone4_7InchHeightPoints = 667;
static const NSUInteger kiPhone5_5InchHeightPoints = 736;

static const NSUInteger kiPadHeightPoints = 1024;


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
        
        CGSize windowSize = window.bounds.size;
        
        if (window == nil) {
            windowSize = [UIScreen mainScreen].fixedCoordinateSpace.bounds.size;
        }
        
        if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
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
    
    CGRect portraitBounds = [UIScreen mainScreen].fixedCoordinateSpace.bounds;
    
    switch ((NSUInteger)round(CGRectGetHeight(portraitBounds))) {
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
    
    switch ([SDiPhoneVersion deviceVersion]) {
        case iPad1:
        case iPad2:
        case iPad3:
        case iPad4:
        case iPadAir:
            height = kiPad9_7InchScreenHeight;
            break;
            
        case iPadMini:
        case iPadMiniRetina:
            height = kiPad7_9InchScreenHeight;
            break;
            
        case iPhone4:
        case iPhone4S:
            height = kiPhone3_5InchScreenHeight;
            break;
            
        case iPhone5:
        case iPhone5S:
            height = kiPhone4_0InchScreenHeight;
            break;
            
        case iPhone6:
            height = kiPhone4_7InchScreenHeight;
            break;
            
        case iPhone6Plus:
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
    
    switch ([SDiPhoneVersion deviceVersion]) {
        case iPad1:
        case iPad2:
        case iPad3:
        case iPad4:
        case iPadAir:
            width = kiPad9_7InchScreenWidth;
            break;
            
        case iPadMini:
        case iPadMiniRetina:
            width = kiPad7_9InchScreenWidth;
            break;
            
        case iPhone4:
        case iPhone4S:
            width = kiPhone3_5InchScreenWidth;
            break;
            
        case iPhone5:
        case iPhone5S:
            width = kiPhone4_0InchScreenWidth;
            break;
            
        case iPhone6:
            width = kiPhone4_7InchScreenWidth;
            break;
            
        case iPhone6Plus:
            width = kiPhone5_5InchScreenWidth;
            break;
            
        default:
            width = [self irl_estimatedDeviceWidthFromScreenDimensions];
            break;
    }
    
    return width;
}

@end
