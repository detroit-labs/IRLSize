# IRLSize

[![CI Status](http://img.shields.io/travis/detroit-labs/IRLSize.svg?style=flat)](https://travis-ci.org/detroit-labs/IRLSize)
[![Version](https://img.shields.io/cocoapods/v/IRLSize.svg?style=flat)](https://cocoapods.org/pods/IRLSize)
[![License](https://img.shields.io/cocoapods/l/IRLSize.svg?style=flat)](https://github.com/detroit-labs/IRLSize/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/IRLSize.svg?style=flat)](https://github.com/detroit-labs/IRLSize)

## Getting Started

To run the example project, clone the repo and navigate to its root folder in
Terminal. Run the following command to install dependencies in their proper
location:

```Bash
pod install --project-directory=Example
```

## Use

All IRLSize methods have two versions: one that uses `NSMeasurement` (`Measurement` in Swift), and one that uses the `IRLRawMillimeters` type (a `double` measuring millimeters).

### Important: Upgrading to IRLSize 2.0

IRLSize 2.0 switched the native unit for measurements from meters to millimeters to better manage what official Apple documentation there is on device sizes. This is a breaking change and as such the raw unit type changed from `IRLRawLengthMeasurement` to `IRLRawMillimeters` to avoid this change accidentally changing existing code by a factor of 1,000. If you were using `NSMeasurement`, no updates should be necessary, as it automatically converts between units.

### Measuring an On-Screen Element

To find out the dimensions of a `UIView` in an iOS app, use one of the following
properties:

#### Objective-C
```Objective-C
// NSMeasurement Version
NSMeasurement<NSUnitLength *> *width = view.irl_physicalWidth;
NSMeasurement<NSUnitLength *> *height = view.irl_physicalHeight;

// Raw Version
//   `IRLRawMillimeters` is a `double` representing millimeters. 
IRLRawMillimeters rawWidth = view.irl_rawPhysicalWidth;
IRLRawMillimeters rawHeight = view.irl_rawPhysicalHeight;
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
let rawWidth = view.rawPhysicalWidth // type: IRLRawMillimeters
let rawHeight = view.rawPhysicalHeight // type: IRLRawMillimeters
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
view.transform = [view irl_transformForRawPhysicalHeight:38.0];
```

#### Swift
```Swift
// Measurement Version
let desiredHeight = Measurement(value: 38, unit: UnitLength.millimeters)

view.transform = view.transform(forPhysicalHeight:desiredHeight)

// Raw Version
view.transform = view.transform(forRawPhysicalHeight:38);
```

### Measuring a Device

If you just want to know the physical size of the screen, use the category on
`UIDevice` for iOS or `WKInterfaceDevice` for watchOS:

#### Objective-C
```Objective-C
// iOS
NSMeasurement<NSUnitLength *> *screenHeight = UIDevice.currentDevice.irl_physicalScreenHeight;
IRLRawMillimeters rawScreenHeight = UIDevice.currentDevice.irl_rawPhysicalScreenHeight;

// watchOS
NSMeasurement<NSUnitLength *> *screenHeight = WKInterfaceDevice.currentDevice.irl_physicalScreenHeight;
IRLRawMillimeters rawScreenHeight = WKInterfaceDevice.currentDevice.irl_rawPhysicalScreenHeight;
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

