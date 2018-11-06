# IRLSize Change Log

## [2.0.0](https://github.com/detroit-labs/IRLSize/releases/tag/2.0.0)
**Released:** 2018-11-05

### Breaking Changes
  - Renamed `IRLRawLengthMeasurement` to `IRLRawMillimeters`
  - All measurements are now in terms of millimeters
  - Updated deployment target to iOS 10.0 and watchOS 3.0.

### Updated
  - Re-sourced all device size data from [official Apple documentation](https://developer.apple.com/accessories)
  - Refactored test suite to have much less repeated code.

### Fixed
  - Fixed incorrect values for landscape devices
