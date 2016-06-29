# IRLSize

[![CI Status](http://img.shields.io/travis/detroit-labs/IRLSize.svg?style=flat)](https://travis-ci.org/detroit-labs/IRLSize)
[![Version](https://img.shields.io/cocoapods/v/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)
[![License](https://img.shields.io/cocoapods/l/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)
[![Platform](https://img.shields.io/cocoapods/p/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example
directory first.

### Measuring a View

To find out the dimensions of a view on your device, use one of the following
methods:

* `NSMeasurement<NSUnitLength *> *width = [myView irl_physicalWidth];`
* `NSMeasurement<NSUnitLength *> *height = [myView irl_physicalHeight];`

If a view is not on the primary screen (i.e. if you’re using an external display)
the measurements will be returned as `nil`.

### Sizing a View

If you want to ensure that a view matches a certain physical size, IRLSize provides
transforms to help you out:

```Objective-C
NSMeasurement<NSUnitLength *> *expectedHeight =
[[NSMeasurement alloc] initWithDoubleValue:0.038
                                      unit:[NSUnitLength meters]];

myView.transform = [myView irl_transformForPhysicalHeight:expectedHeight];
```

### Measuring a Device

If you just want to know the physical size of the screen, use the category on
UIDevice:

```Swift
let screenHeight = UIDevice.current().physicalScreenHeight
```

## Installation

IRLSize is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "IRLSize"

## Author

Jeff Kelley (SlaunchaMan@gmail.com) at [Detroit Labs](https://detroitlabs.com).

## License

IRLSize is available under the MIT license. See the LICENSE file for more info.

