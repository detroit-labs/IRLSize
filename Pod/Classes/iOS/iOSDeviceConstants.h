//
//  iOSDeviceConstants.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/2/2018.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#ifndef iOSDeviceConstants_h
#define iOSDeviceConstants_h

#import "IRLSize.h"

#pragma mark - Physical Measurements
// All measurements are in millimeters, sourced from official, publicly-
// available Apple device documentation here:
//
// https://developer.apple.com/accessories/

/////////////
// iPhones //
/////////////

// iPhone 5
static const IRLRawMillimeters kiPhone5ScreenHeight = 90.39;
static const IRLRawMillimeters kiPhone5ScreenWidth  = 51.70;

// iPhone 5c
static const IRLRawMillimeters kiPhone5cScreenHeight = 90.39;
static const IRLRawMillimeters kiPhone5cScreenWidth  = 51.70;

// iPhone 5s
static const IRLRawMillimeters kiPhone5sScreenHeight = 90.39;
static const IRLRawMillimeters kiPhone5sScreenWidth  = 51.70;

// iPhone SE
static const IRLRawMillimeters kiPhoneSEScreenHeight = 90.39;
static const IRLRawMillimeters kiPhoneSEScreenWidth  = 51.70;

// iPhone 6
static const IRLRawMillimeters kiPhone6ScreenHeight = 104.05;
static const IRLRawMillimeters kiPhone6ScreenWidth  =  58.50;

// iPhone 6 Plus
static const IRLRawMillimeters kiPhone6PlusScreenHeight = 121.54;
static const IRLRawMillimeters kiPhone6PlusScreenWidth  =  68.36;

// iPhone 6s
static const IRLRawMillimeters kiPhone6sScreenHeight = 104.05;
static const IRLRawMillimeters kiPhone6sScreenWidth  =  58.49;

// iPhone 6s Plus
static const IRLRawMillimeters kiPhone6sPlusScreenHeight = 121.54;
static const IRLRawMillimeters kiPhone6sPlusScreenWidth  =  68.36;

// iPhone 7
static const IRLRawMillimeters kiPhone7ScreenHeight = 104.05;
static const IRLRawMillimeters kiPhone7ScreenWidth  =  58.50;

// iPhone 7 Plus
static const IRLRawMillimeters kiPhone7PlusScreenHeight = 121.54;
static const IRLRawMillimeters kiPhone7PlusScreenWidth  =  68.36;

// iPhone 8
static const IRLRawMillimeters kiPhone8ScreenHeight = 104.05;
static const IRLRawMillimeters kiPhone8ScreenWidth  =  58.50;

// iPhone 8 Plus
static const IRLRawMillimeters kiPhone8PlusScreenHeight = 121.54;
static const IRLRawMillimeters kiPhone8PlusScreenWidth  =  68.36;

// iPhone X
static const IRLRawMillimeters kiPhoneXScreenHeight = 135.75;
static const IRLRawMillimeters kiPhoneXScreenWidth  =  63.12;

// iPhone XR
static const IRLRawMillimeters kiPhoneXRScreenHeight = 139.78;
static const IRLRawMillimeters kiPhoneXRScreenWidth  =  64.58;

// iPhone XS
static const IRLRawMillimeters kiPhoneXSScreenHeight = 135.75;
static const IRLRawMillimeters kiPhoneXSScreenWidth  =  63.13;

// iPhone XS Max
static const IRLRawMillimeters kiPhoneXSMaxScreenHeight = 149.71;
static const IRLRawMillimeters kiPhoneXSMaxScreenWidth  =  69.61;

// iPhone 11
static const IRLRawMillimeters kiPhone11ScreenHeight = 139.78;
static const IRLRawMillimeters kiPhone11ScreenWidth  =  64.58;

// iPhone 11 Pro
static const IRLRawMillimeters kiPhone11ProScreenHeight = 134.95;
static const IRLRawMillimeters kiPhone11ProScreenWidth  =  62.33;

// iPhone 11 Pro Max
static const IRLRawMillimeters kiPhone11ProMaxScreenHeight = 148.91;
static const IRLRawMillimeters kiPhone11ProMaxScreenWidth  =  68.81;

// iPhone SE (2nd Generation)
static const IRLRawMillimeters kiPhoneSE2ScreenHeight = 104.05;
static const IRLRawMillimeters kiPhoneSE2ScreenWidth  =  58.50;


///////////
// iPads //
///////////

// iPad 4
static const IRLRawMillimeters kiPad4ScreenHeight = 198.1;
static const IRLRawMillimeters kiPad4ScreenWidth  = 149.0;

// iPad mini
static const IRLRawMillimeters kiPadMiniScreenHeight = 161.2;
static const IRLRawMillimeters kiPadMiniScreenWidth  = 121.3;

// iPad Air
static const IRLRawMillimeters kiPadAirScreenHeight = 198.1;
static const IRLRawMillimeters kiPadAirScreenWidth  = 149.0;

// iPad mini 2
static const IRLRawMillimeters kiPadMini2ScreenHeight = 161.2;
static const IRLRawMillimeters kiPadMini2ScreenWidth  = 121.3;

// iPad mini 3
static const IRLRawMillimeters kiPadMini3ScreenHeight = 161.2;
static const IRLRawMillimeters kiPadMini3ScreenWidth  = 121.3;

// iPad Air 2
static const IRLRawMillimeters kiPadAir2ScreenHeight = 203.11;
static const IRLRawMillimeters kiPadAir2ScreenWidth  = 153.71;

// iPad mini 4
static const IRLRawMillimeters kiPadMini4ScreenHeight = 161.24;
static const IRLRawMillimeters kiPadMini4ScreenWidth  = 121.31;

// iPad Pro (12.9 Inch, 1st Generation)
static const IRLRawMillimeters kiPadPro12_9InchScreenHeight = 262.27; // Not in diagram, sourced from second-gen (width measurement is the same)
static const IRLRawMillimeters kiPadPro12_9InchScreenWidth  = 196.61;

// iPad Pro (9.7 Inch)
static const IRLRawMillimeters kiPadPro9_7InchScreenHeight = 203.11;
static const IRLRawMillimeters kiPadPro9_7InchScreenWidth  = 153.71;

// iPad 5
static const IRLRawMillimeters kiPad5ScreenHeight = 196.47;
static const IRLRawMillimeters kiPad5ScreenWidth  = 147.97;

// iPad 6
static const IRLRawMillimeters kiPad6ScreenHeight = 196.47;
static const IRLRawMillimeters kiPad6ScreenWidth  = 147.97;

// iPad Pro (12.9 Inch, 2nd Generation)
static const IRLRawMillimeters kiPadPro12_9Inch2ScreenHeight = 262.27;
static const IRLRawMillimeters kiPadPro12_9Inch2ScreenWidth  = 196.61;

// iPad Pro (10.5 Inch)
static const IRLRawMillimeters kiPadPro10_5InchScreenHeight = 213.50;
static const IRLRawMillimeters kiPadPro10_5InchScreenWidth  = 160.13;

// iPad Pro (12.9 Inch, 3rd Generation)
static const IRLRawMillimeters kiPadPro12_9Inch3ScreenHeight = 263.27;
static const IRLRawMillimeters kiPadPro12_9Inch3ScreenWidth  = 197.61;

// iPad Pro (11 Inch)
static const IRLRawMillimeters kiPadPro11InchScreenHeight = 230.25;
static const IRLRawMillimeters kiPadPro11InchScreenWidth  = 161.13;

// iPad mini 5
static const IRLRawMillimeters kiPadMini5ScreenHeight = 160.74;
static const IRLRawMillimeters kiPadMini5ScreenWidth  = 120.81;

// iPad Air 3
static const IRLRawMillimeters kiPadAir3ScreenHeight = 213.50;
static const IRLRawMillimeters kiPadAir3ScreenWidth  = 160.13;

// iPad 7
static const IRLRawMillimeters kiPad7ScreenHeight = 207.36;
static const IRLRawMillimeters kiPad7ScreenWidth  = 155.52;

// iPad Pro (12.9 Inch, 4th Generation)
static const IRLRawMillimeters kiPadPro12_9Inch4ScreenHeight = 262.27;
static const IRLRawMillimeters kiPadPro12_9Inch4ScreenWidth  = 196.61;

// iPad Pro (11 Inch, 2nd Generation)
static const IRLRawMillimeters kiPadPro11Inch2ScreenHeight = 230.25;
static const IRLRawMillimeters kiPadPro11Inch2ScreenWidth  = 161.13;


/////////////////
// iPods touch //
/////////////////

// iPod touch 5
static const IRLRawMillimeters kiPodTouch5ScreenHeight = 88.61;
static const IRLRawMillimeters kiPodTouch5ScreenWidth  = 49.92;

// iPod touch 6
static const IRLRawMillimeters kiPodTouch6ScreenHeight = 88.61;
static const IRLRawMillimeters kiPodTouch6ScreenWidth  = 49.92;

// iPod touch 7 (no changes from iPod touch 6)
static const IRLRawMillimeters kiPodTouch7ScreenHeight = kiPodTouch6ScreenHeight;
static const IRLRawMillimeters kiPodTouch7ScreenWidth = kiPodTouch6ScreenWidth;

#pragma mark - Estimated Measurements
// Estimated heights for unknown devices use the most-recently-known height for
// that screen size. These are used in the case of an unknown model identifier
// (usually a new device) that shares a screen resolution with a known device.

///////////////////////
// iPhone/iPod touch //
///////////////////////

// 3.5"
// None of the devices in the specifications I could find were 3.5" devices, so
// these are the estimates from the previous version (1.3.0) of IRLSize.
static const IRLRawMillimeters kiPhone3_5InchScreenHeight = 74.0;
static const IRLRawMillimeters kiPhone3_5InchScreenWidth = 49.3;

// 4.0"
static const IRLRawMillimeters kiPhone4_0InchScreenHeight = kiPhoneSEScreenHeight;
static const IRLRawMillimeters kiPhone4_0InchScreenWidth = kiPhoneSEScreenWidth;

// 4.7"
static const IRLRawMillimeters kiPhone4_7InchScreenHeight = kiPhoneSE2ScreenHeight;
static const IRLRawMillimeters kiPhone4_7InchScreenWidth = kiPhoneSE2ScreenWidth;

// 5.5"
static const IRLRawMillimeters kiPhone5_5InchScreenHeight = kiPhone8PlusScreenHeight;
static const IRLRawMillimeters kiPhone5_5InchScreenWidth = kiPhone8PlusScreenWidth;

// 5.8"
static const IRLRawMillimeters kiPhone5_8InchScreenHeight = kiPhone11ProScreenHeight;
static const IRLRawMillimeters kiPhone5_8InchScreenWidth = kiPhone11ProScreenWidth;

// 6.1"
static const IRLRawMillimeters kiPhone6_1InchScreenHeight = kiPhone11ScreenHeight;
static const IRLRawMillimeters kiPhone6_1InchScreenWidth = kiPhone11ScreenWidth;

// 6.5"
static const IRLRawMillimeters kiPhone6_5InchScreenHeight = kiPhone11ProMaxScreenHeight;
static const IRLRawMillimeters kiPhone6_5InchScreenWidth = kiPhone11ProMaxScreenWidth;

//////////
// iPad //
//////////

// 7.9"
// Since both iPad mini and iPad have the same resolution, we can't use the
// 7.9" screen dimensions for estimating. Keeping this here but marked as
// __unused in case future iPad mini models have some other method of
// disambiguating what they are if model identifier and resolution don't work
// (e.g. if the next iPad mini has the same screen size but is 3x instead of
// 2x).
__unused static const IRLRawMillimeters kiPad7_9InchScreenHeight = kiPadMini4ScreenHeight;
__unused static const IRLRawMillimeters kiPad7_9InchScreenWidth = kiPadMini4ScreenWidth;

// 9.7"
static const IRLRawMillimeters kiPad9_7InchScreenHeight = kiPad6ScreenHeight;
static const IRLRawMillimeters kiPad9_7InchScreenWidth = kiPad6ScreenWidth;

// 10.2"
static const IRLRawMillimeters kiPad10_2InchScreenHeight = kiPad7ScreenHeight;
static const IRLRawMillimeters kiPad10_2InchScreenWidth = kiPad7ScreenWidth;

// 10.5"
static const IRLRawMillimeters kiPad10_5InchScreenHeight = kiPadPro10_5InchScreenHeight;
static const IRLRawMillimeters kiPad10_5InchScreenWidth = kiPadPro10_5InchScreenWidth;

// 11"
static const IRLRawMillimeters kiPad11InchScreenHeight = kiPadPro11InchScreenHeight;
static const IRLRawMillimeters kiPad11InchScreenWidth = kiPadPro11InchScreenWidth;

// 12.9"
static const IRLRawMillimeters kiPad12_9InchScreenHeight = kiPadPro12_9Inch3ScreenHeight;
static const IRLRawMillimeters kiPad12_9InchScreenWidth = kiPadPro12_9Inch3ScreenWidth;

#pragma mark - Screen Heights
// When we estimate the size of the device, we use its height in points. This is
// due to the fact that some iPhone sizes differ *only* in height. If, in the
// future, a device is released that shares a height and not width with other
// devices, we’ll have to use both width and height.

///////////////////////
// iPhone/iPod touch //
///////////////////////
static const NSUInteger kiPhone3_5InchHeightPoints = 480;
static const NSUInteger kiPhone4_0InchHeightPoints = 568;
static const NSUInteger kiPhone4_7InchHeightPoints = 667;
static const NSUInteger kiPhone5_5InchHeightPoints = 736;
static const NSUInteger kiPhone5_8InchHeightPoints = 812;
// The 6.1" and 6.5" phones both have 896 height points, so we'll need to use
// different techniques to identify them.
static const NSUInteger kiPhone6_1InchHeightPoints = 896;

//////////
// iPad //
//////////
static const NSUInteger kiPad9_7InchHeightPoints = 1024;
static const NSUInteger kiPad10_2InchHeightPoints = 1080;
static const NSUInteger kiPad10_5InchHeightPoints = 1112;
static const NSUInteger kiPad11InchHeightPoints = 1194;
static const NSUInteger kiPad12_9InchHeightPoints = 1366;

#endif /* iOSDeviceConstants_h */
