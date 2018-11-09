//
//  watchOSDeviceConstants.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/8/2018.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#ifndef watchOSDeviceConstants_h
#define watchOSDeviceConstants_h

#import "IRLSize.h"

#pragma mark - Physical Measurements
// All measurements are in millimeters, sourced from official, publicly-
// available Apple device documentation here:
//
// https://developer.apple.com/accessories/

// Apple Watch (1st Generation) 38mm
static const IRLRawMillimeters kAppleWatch38mmScreenHeight = 26.52;
static const IRLRawMillimeters kAppleWatch38mmScreenWidth  = 21.22;

// Apple Watch (1st Generation) 42mm
static const IRLRawMillimeters kAppleWatch42mmScreenHeight = 30.42;
static const IRLRawMillimeters kAppleWatch42mmScreenWidth  = 24.34;

// Apple Watch Series 1 38mm
static const IRLRawMillimeters kAppleWatch38mmSeries1ScreenHeight = 26.52;
static const IRLRawMillimeters kAppleWatch38mmSeries1ScreenWidth  = 21.22;

// Apple Watch Series 1 42mm
static const IRLRawMillimeters kAppleWatch42mmSeries1ScreenHeight = 30.42;
static const IRLRawMillimeters kAppleWatch42mmSeries1ScreenWidth  = 24.34;

// Apple Watch Series 2 38mm
static const IRLRawMillimeters kAppleWatch38mmSeries2ScreenHeight = 27.32;
static const IRLRawMillimeters kAppleWatch38mmSeries2ScreenWidth  = 22.02;

// Apple Watch Series 2 42mm
static const IRLRawMillimeters kAppleWatch42mmSeries2ScreenHeight = 31.22;
static const IRLRawMillimeters kAppleWatch42mmSeries2ScreenWidth  = 25.13;

// Apple Watch Series 3 38mm
static const IRLRawMillimeters kAppleWatch38mmSeries3ScreenHeight = 27.32;
static const IRLRawMillimeters kAppleWatch38mmSeries3ScreenWidth  = 22.02;

// Apple Watch Series 3 42mm
static const IRLRawMillimeters kAppleWatch42mmSeries3ScreenHeight = 31.22;
static const IRLRawMillimeters kAppleWatch42mmSeries3ScreenWidth  = 25.13;

// Apple Watch Series 4 40mm
static const IRLRawMillimeters kAppleWatch40mmSeries4ScreenHeight = 30.73;
static const IRLRawMillimeters kAppleWatch40mmSeries4ScreenWidth  = 25.27;

// Apple Watch Series 4 44mm
static const IRLRawMillimeters kAppleWatch44mmSeries4ScreenHeight = 34.95;
static const IRLRawMillimeters kAppleWatch44mmSeries4ScreenWidth  = 28.71;

#pragma mark - Estimated Measurements
// Estimated heights for unknown devices use the most-recently-known height for
// that screen size. These are used in the case of an unknown model identifier
// (usually a new device) that shares a screen resolution with a known device.

// 38mm
static const IRLRawMillimeters kWatch38mmScreenHeight = kAppleWatch38mmSeries3ScreenHeight;
static const IRLRawMillimeters kWatch38mmScreenWidth  = kAppleWatch38mmSeries3ScreenWidth;

// 40mm
static const IRLRawMillimeters kWatch40mmScreenHeight = kAppleWatch40mmSeries4ScreenHeight;
static const IRLRawMillimeters kWatch40mmScreenWidth  = kAppleWatch40mmSeries4ScreenWidth;

// 42mm
static const IRLRawMillimeters kWatch42mmScreenHeight = kAppleWatch42mmSeries3ScreenHeight;
static const IRLRawMillimeters kWatch42mmScreenWidth  = kAppleWatch42mmSeries3ScreenWidth;

// 44mm
static const IRLRawMillimeters kWatch44mmScreenHeight = kAppleWatch44mmSeries4ScreenHeight;
static const IRLRawMillimeters kWatch44mmScreenWidth  = kAppleWatch44mmSeries4ScreenWidth;


#pragma mark - Screen Heights
// When we estimate the size of the device, we use its height in points. This is
// due to the fact that some iPhone sizes differed *only* in height. If, in the
// future, a device is released that shares a height and not width with other
// devices, we’ll have to use both width and height.

static const NSUInteger kWatch38mmHeightPoints = 170;
static const NSUInteger kWatch40mmHeightPoints = 197;
static const NSUInteger kWatch42mmHeightPoints = 195;
static const NSUInteger kWatch44mmHeightPoints = 224;

#endif /* watchOSDeviceConstants_h */
