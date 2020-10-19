# IRLSize Change Log

## [2.3.0](https://github.com/detroit-labs/IRLSize/releases/tag/2.3.0)
**Released:** 2020-10-19

### Added
- Support for iPhone 12
- Support for iPhone 12 mini
- Support for iPhone 12 Pro
- Support for iPhone 12 Pro Max
- Support for iPad (8th Generation)
- Support for iPad Air (4th Generation)
- Support for Apple Watch Series 6
- Support for Apple Watch SE

## [2.2.5](https://github.com/detroit-labs/IRLSize/releases/tag/2.2.5)
**Released:** 2020-08-28

### Updated
- Added `DEFINES_MODULE` setting to support static libraries.
  - Note: You may need to set the `-Wno-incomplete-umbrella` compiler flag to
    avoid a warning when using this setting. See
    [this GitHub issue](https://github.com/CocoaPods/CocoaPods/issues/7729)
    for more information.

## [2.2.4](https://github.com/detroit-labs/IRLSize/releases/tag/2.2.4)
**Released:** 2020-04-15

### Added
- Support for iPad Pro (12.9-inch) (4th Generation).
- Support for iPad Pro (11-inch) (2nd Generation).
- Support for iPhone SE (2nd Generation).

## [2.2.3](https://github.com/detroit-labs/IRLSize/releases/tag/2.2.3)
**Released:** 2019-09-24

### Added
- Support for iPad (7th Generation).

## [2.2.2](https://github.com/detroit-labs/IRLSize/releases/tag/2.2.2)
**Released:** 2019-09-16

### Added
- Support for iPhone 11, iPhone 11 Pro, iPhone 11 Pro Max, and Apple Watch
  Series 5.
- Preliminary support for the 10.2-inch iPad display size.

## [2.2.1](https://github.com/detroit-labs/IRLSize/releases/tag/2.2.1)
**Released:** 2019-05-29

### Added
- Support for iPod touch (7th generation).

## [2.2.0](https://github.com/detroit-labs/IRLSize/releases/tag/2.2.0)
**Released:** 2019-04-29

### Updated
- Switch from SDVersion to Orchard for device identification.

### Added
- Support for 2019 iPad models.

## [2.1.0](https://github.com/detroit-labs/IRLSize/releases/tag/2.1.0)
**Released:** 2018-11-16

### Updated
- Restored the deployment target to iOS 8.0 and watchOS 2.0.

## [2.0.1](https://github.com/detroit-labs/IRLSize/releases/tag/2.0.1)
**Released:** 2018-11-08

### Updated
- Improved accuracy of Apple Watch measurements.
- Improved the display of the example application, including supporting Dynamic 
  Type.

### Added
- Support for 2018 iPad Pro models.
- Fixed a bug in estimating iPad Pro sizes.
- Added debug logging of estimates (define `IRLSIZE_DEBUG` to `1` to use).

## [2.0.0](https://github.com/detroit-labs/IRLSize/releases/tag/2.0.0)
**Released:** 2018-11-06

### Breaking Changes
- Renamed `IRLRawLengthMeasurement` to `IRLRawMillimeters`.
- All measurements are now in terms of millimeters.
- Updated deployment target to iOS 10.0 and watchOS 3.0.

### Updated
- Re-sourced all device size data from
  [official Apple documentation](https://developer.apple.com/accessories).
- Refactored test suite to have much less repeated code.

### Fixed
- Fixed incorrect values for landscape devices.
