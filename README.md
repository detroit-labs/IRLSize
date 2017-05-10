# IRLSize

[![CI Status](http://img.shields.io/travis/detroit-labs/IRLSize.svg?style=flat)](https://travis-ci.org/detroit-labs/IRLSize)
[![Version](https://img.shields.io/cocoapods/v/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)
[![License](https://img.shields.io/cocoapods/l/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)
[![Platform](https://img.shields.io/cocoapods/p/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)

## Getting Started

To run the example project, clone the repo and navigate to its root folder in
Terminal. Run the following command to install dependencies in their proper
location:

```Bash
pod install --project-directory=Example
```

## Use

All IRLSize methods have two versions: one that uses `NSMeasurement` in iOS 10/watchOS 3 and later, and one that uses the `IRLRawLengthMeasurement` type (a float measuring meters).

### Measuring an On-Screen Element

To find out the dimensions of a `UIView` in an iOS app, use one of the following
properties:

#### Objective-C
```Objective-C
// NSMeasurement Version
NSMeasurement<NSUnitLength *> *width = view.irl_physicalWidth;
NSMeasurement<NSUnitLength *> *height = view.irl_physicalHeight;

// Raw Version
//   IRLRawLengthMeasurement is a `float` representing meters for OSes versions that
//   don’t support `NSMeasurement`. 
IRLRawLengthMeasurement rawWidth = view.irl_rawPhysicalWidth;
IRLRawLengthMeasurement rawHeight = view.irl_rawPhysicalHeight;
```

If a view is on a secondary screen (i.e. if you’re using an external display)
the measurements will be returned as `nil`.

Of course, this also works nicely in Swift:

#### Swift
```Swift
// Measurement Version
let width = view.physicalWidth // type: Measurement<UnitLength>
let height = view.physicalHeight // type: Measurement<UnitLength>

// Raw Version
let rawWidth = view.rawPhysicalWidth // type: RawLengthMeasurement
let rawHeight = view.rawPhysicalHeight // type: RawLengthMeasurement
```

### Sizing a View

If you want to ensure that a view matches a certain physical size, IRLSize provides
transforms to help you out:

#### Objective-C
```Objective-C
// NSMeasurement Version
NSMeasurement<NSUnitLength *> *desiredHeight =
[[NSMeasurement alloc] initWithDoubleValue:38.0
                                      unit:NSUnitLength.millimeters];

view.transform = [view irl_transformForPhysicalHeight:desiredHeight];

// Raw Version
view.transform = [view irl_transformForRawPhysicalHeight:0.038];
```

#### Swift
```Swift
// Measurement Version
let desiredHeight = Measurement(value: 38, unit: UnitLength.millimeters)

view.transform = view.transform(forPhysicalHeight:desiredHeight)

// Raw Version
view.transform = view.transform(forRawPhysicalHeight:0.038);
```

### Measuring a Device

If you just want to know the physical size of the screen, use the category on
`UIDevice` for iOS or `WKInterfaceDevice` for watchOS:

#### Objective-C
```Objective-C
// iOS
NSMeasurement<NSUnitLength *> *screenHeight = UIDevice.currentDevice.irl_physicalScreenHeight;
IRLRawLengthMeasurement rawScreenHeight = UIDevice.currentDevice.irl_rawPhysicalScreenHeight;

// watchOS
NSMeasurement<NSUnitLength *> *screenHeight = WKInterfaceDevice.currentDevice.irl_physicalScreenHeight;
IRLRawLengthMeasurement rawScreenHeight = WKInterfaceDevice.currentDevice.irl_rawPhysicalScreenHeight;
```

#### Swift
```Swift
// iOS
let screenHeight = UIDevice.current.physicalScreenHeight
let rawScreenHeight = UIDevice.current.rawPhysicalScreenHeight

// watchOS
let screenHeight = WKInterfaceDevice.current.phsyicalScreenHeight
let rawScreenHeight = WKInterfaceDevice.current.rawPhysicalScreenHeight
```

## Installation

IRLSize is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```Ruby
pod "IRLSize"
```

## Author

Jeff Kelley (SlaunchaMan@gmail.com) at [Detroit Labs](https://detroitlabs.com).

## License

IRLSize is available under the MIT license. See the LICENSE file for more info.

