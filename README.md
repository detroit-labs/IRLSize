# IRLSize

[![CI Status](http://img.shields.io/travis/detroit-labs/IRLSize.svg?style=flat)](https://travis-ci.org/detroit-labs/IRLSize)
[![Version](https://img.shields.io/cocoapods/v/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)
[![License](https://img.shields.io/cocoapods/l/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)
[![Platform](https://img.shields.io/cocoapods/p/IRLSize.svg?style=flat)](http://cocoadocs.org/docsets/IRLSize)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Measuring a View

To find out the dimensions of a view on your device, use one of the following methods:

* `IRLSize size = [myView irl_dimensions];`
* `float widthInMeters = [myView irl_width];`
* `float heightInMeters = [myView irl_height];`

If a view is not on the primary screen (i.e. if you’re using an external display) the size will always be returned as 0, 0.

### Sizing a View

If you want to ensure that a view matches a certain physical size, IRLSize provides transforms to help you out:

```Objective-C
myView.transform = [myView irl_transformForHeight:0.038];
```

## Requirements

## Installation

IRLSize is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "IRLSize"

## Author

Jeff Kelley, SlaunchaMan@gmail.com

## License

IRLSize is available under the MIT license. See the LICENSE file for more info.

