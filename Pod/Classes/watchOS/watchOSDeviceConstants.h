//
//  watchOSDeviceConstants.h
//  IRLSize
//
//  Created by Jeff Kelley on 11/8/2018.
//  Copyright © 2019 Detroit Labs. All rights reserved.
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
static const IRLRawMillimeters kAppleWatch_38mmScreenHeight = 26.52;
static const IRLRawMillimeters kAppleWatch_38mmScreenWidth  = 21.22;

// Apple Watch (1st Generation) 42mm
static const IRLRawMillimeters kAppleWatch_42mmScreenHeight = 30.42;
static const IRLRawMillimeters kAppleWatch_42mmScreenWidth  = 24.34;

// Apple Watch Series 1 38mm
static const IRLRawMillimeters kAppleWatchSeries1_38mmScreenHeight = 26.52;
static const IRLRawMillimeters kAppleWatchSeries1_38mmScreenWidth  = 21.22;

// Apple Watch Series 1 42mm
static const IRLRawMillimeters kAppleWatchSeries1_42mmScreenHeight = 30.42;
static const IRLRawMillimeters kAppleWatchSeries1_42mmScreenWidth  = 24.34;

// Apple Watch Series 2 38mm
static const IRLRawMillimeters kAppleWatchSeries2_38mmScreenHeight = 27.32;
static const IRLRawMillimeters kAppleWatchSeries2_38mmScreenWidth  = 22.02;

// Apple Watch Series 2 42mm
static const IRLRawMillimeters kAppleWatchSeries2_42mmScreenHeight = 31.22;
static const IRLRawMillimeters kAppleWatchSeries2_42mmScreenWidth  = 25.13;

// Apple Watch Series 3 38mm
static const IRLRawMillimeters kAppleWatchSeries3_38mmScreenHeight = 27.32;
static const IRLRawMillimeters kAppleWatchSeries3_38mmScreenWidth  = 22.02;

// Apple Watch Series 3 42mm
static const IRLRawMillimeters kAppleWatchSeries3_42mmScreenHeight = 31.22;
static const IRLRawMillimeters kAppleWatchSeries3_42mmScreenWidth  = 25.13;

// Apple Watch Series 4 40mm
static const IRLRawMillimeters kAppleWatchSeries4_40mmScreenHeight = 30.73;
static const IRLRawMillimeters kAppleWatchSeries4_40mmScreenWidth  = 25.27;

// Apple Watch Series 4 44mm
static const IRLRawMillimeters kAppleWatchSeries4_44mmScreenHeight = 34.95;
static const IRLRawMillimeters kAppleWatchSeries4_44mmScreenWidth  = 28.71;

// Apple Watch Series 5 40mm
static const IRLRawMillimeters kAppleWatchSeries5_40mmScreenHeight = 30.73;
static const IRLRawMillimeters kAppleWatchSeries5_40mmScreenWidth  = 25.27;

// Apple Watch Series 5 44mm
static const IRLRawMillimeters kAppleWatchSeries5_44mmScreenHeight = 34.95;
static const IRLRawMillimeters kAppleWatchSeries5_44mmScreenWidth  = 28.71;


#pragma mark - Estimated Measurements
// Estimated heights for unknown devices use the most-recently-known height for
// that screen size. These are used in the case of an unknown model identifier
// (usually a new device) that shares a screen resolution with a known device.

// 38mm
static const IRLRawMillimeters kWatch38mmScreenHeight = kAppleWatchSeries3_38mmScreenHeight;
static const IRLRawMillimeters kWatch38mmScreenWidth  = kAppleWatchSeries3_38mmScreenWidth;

// 40mm
static const IRLRawMillimeters kWatch40mmScreenHeight = kAppleWatchSeries5_40mmScreenHeight;
static const IRLRawMillimeters kWatch40mmScreenWidth  = kAppleWatchSeries5_40mmScreenWidth;

// 42mm
static const IRLRawMillimeters kWatch42mmScreenHeight = kAppleWatchSeries3_42mmScreenHeight;
static const IRLRawMillimeters kWatch42mmScreenWidth  = kAppleWatchSeries3_42mmScreenWidth;

// 44mm
static const IRLRawMillimeters kWatch44mmScreenHeight = kAppleWatchSeries5_44mmScreenHeight;
static const IRLRawMillimeters kWatch44mmScreenWidth  = kAppleWatchSeries5_44mmScreenWidth;


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
