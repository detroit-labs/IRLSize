#import <UIKit/UIKit.h>

typedef float RawLengthMeasurement; // meters

typedef struct {
    RawLengthMeasurement width;
    RawLengthMeasurement height
} RawSize;


@interface UIDevice (IRLSizePrivate)

- (RawSize)irl_rawPhysicalSizeOfView:(UIView *)view NS_SWIFT_NAME(rawPhysicalSize(of:));

@end
