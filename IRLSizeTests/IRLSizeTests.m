//
//  IRLSizeTests.m
//  IRLSizeTests
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import <IRLSize/IRLSize.h>

#import <UIKit/UIKit.h>

#import <Kiwi/Kiwi.h>
#import <Orchard/Orchard.h>

#import "IRLMeasurementBeWithinMatcher.h"
#import "iOSDeviceConstants.h"

#define IRL_MM(x) [[NSMeasurement alloc] initWithDoubleValue:(x) unit:IRL_SIZE_UNIT]

#define KNOWN_DEVICE_TEST_IMPL(name, modelEnum, sizeEnumPrefix, availability) \
    context(@"on an " name, ^{ \
        beforeEach(^{ \
            if (@available(iOS availability, *)) { \
                [UIDevice.currentDevice stub:@selector(orchardiOSDevice) \
                                   andReturn:theValue(modelEnum)]; \
            } \
            else { \
                [UIDevice.currentDevice stub:@selector(orchardiOSDevice) \
                                   andReturn:theValue(OrchardiOSDeviceUnknown)]; \
            } \
        }); \
        it(@"should report the correct height", ^{ \
            if (@available(iOS availability, *)) { \
                NSLog(@"Expecting device " #modelEnum " height to equal %f", \
                      k##sizeEnumPrefix##ScreenHeight); \
                if (@available(iOS 10.0, *)) { \
                    [[UIDevice.currentDevice.irl_physicalScreenHeight should] \
                     beWithin:0.01 \
                     ofMeasurement:IRL_MM(k##sizeEnumPrefix##ScreenHeight)]; \
                } \
                [[theValue(UIDevice.currentDevice.irl_rawPhysicalScreenHeight) should] \
                 beWithin:theValue(0.1) \
                 of:theValue(k##sizeEnumPrefix##ScreenHeight)]; \
            } \
        }); \
        it(@"should report the correct width", ^{ \
            if (@available(iOS availability, *)) { \
                NSLog(@"Expecting device " #modelEnum " width to equal %f", \
                      k##sizeEnumPrefix##ScreenWidth); \
                if (@available(iOS 10.0, *)) { \
                    [[UIDevice.currentDevice.irl_physicalScreenWidth should] \
                     beWithin:0.01 \
                     ofMeasurement:IRL_MM(k##sizeEnumPrefix##ScreenWidth)]; \
                } \
                [[theValue(UIDevice.currentDevice.irl_rawPhysicalScreenWidth) should] \
                 beWithin:theValue(0.1) \
                 of:theValue(k##sizeEnumPrefix##ScreenWidth)]; \
            } \
        }); \
    });

#define KNOWN_DEVICE_TEST(name, enum, availability) \
    KNOWN_DEVICE_TEST_IMPL(name, OrchardiOSDevice##enum, enum, availability)

SPEC_BEGIN(IRLSizeTests)

describe(@"Getting the native size of a device", ^{

    registerMatchers(@"IRL");

    KNOWN_DEVICE_TEST("iPhone 5", iPhone5, 6.0)
    KNOWN_DEVICE_TEST("iPhone 5c", iPhone5c, 7.0)
    KNOWN_DEVICE_TEST("iPhone 5s", iPhone5s, 7.0)
    KNOWN_DEVICE_TEST("iPhone 6", iPhone6, 8.0)
    KNOWN_DEVICE_TEST("iPhone 6 Plus", iPhone6Plus, 8.0)
    KNOWN_DEVICE_TEST("iPhone 6s", iPhone6s, 9.0)
    KNOWN_DEVICE_TEST("iPhone 6s Plus", iPhone6sPlus, 9.0)
    KNOWN_DEVICE_TEST("iPhone SE", iPhoneSE, 9.3)
    KNOWN_DEVICE_TEST("iPhone 7", iPhone7, 10.0)
    KNOWN_DEVICE_TEST("iPhone 7 Plus", iPhone7Plus, 10.0)
    KNOWN_DEVICE_TEST("iPhone 8", iPhone8, 11.0)
    KNOWN_DEVICE_TEST("iPhone 8 Plus", iPhone8Plus, 11.0)
    KNOWN_DEVICE_TEST("iPhone X", iPhoneX, 11.0)
    KNOWN_DEVICE_TEST("iPhone XS", iPhoneXS, 12.0)
    KNOWN_DEVICE_TEST("iPhone XS Max", iPhoneXSMax, 12.0)
    KNOWN_DEVICE_TEST("iPhone XR", iPhoneXR, 12.0)

    KNOWN_DEVICE_TEST("iPad (4th Generation)", iPad4, 6.0)
    KNOWN_DEVICE_TEST("iPad mini", iPadMini, 6.0)
    KNOWN_DEVICE_TEST("iPad Air", iPadAir, 7.0)
    KNOWN_DEVICE_TEST("iPad mini (2nd Generation)", iPadMini2, 7.0)
    KNOWN_DEVICE_TEST("iPad mini (3rd Generation)", iPadMini3, 8.0)
    KNOWN_DEVICE_TEST("iPad Air 2", iPadAir2, 8.1)
    KNOWN_DEVICE_TEST("iPad mini (4th Generation)", iPadMini4, 9.0)
    KNOWN_DEVICE_TEST("iPad Pro (12.9\")", iPadPro12_9Inch, 9.1)
    KNOWN_DEVICE_TEST("iPad Pro (9.7\")", iPadPro9_7Inch, 9.3)
    KNOWN_DEVICE_TEST("iPad (5th Generation)", iPad5, 10.3)
    KNOWN_DEVICE_TEST("iPad Pro (12.9\", 2nd Generation)", iPadPro12_9Inch2, 10.3)
    KNOWN_DEVICE_TEST("iPad Pro (10.5\")", iPadPro10_5Inch, 10.3)
    KNOWN_DEVICE_TEST("iPad (6th Generation)", iPad6, 11.3)
    KNOWN_DEVICE_TEST("iPad Pro (12.9\", 3nd Generation)", iPadPro12_9Inch3, 12.1)
    KNOWN_DEVICE_TEST("iPad Pro (11\")", iPadPro11Inch, 12.1)
    KNOWN_DEVICE_TEST("iPad mini (5th Generation))", iPadMini5, 12.2)
    KNOWN_DEVICE_TEST("iPad Air (3rd Generation)", iPadAir3, 12.2)

    KNOWN_DEVICE_TEST("iPod touch (5th Generation)", iPodTouch5, 6.0)
    KNOWN_DEVICE_TEST("iPod touch (6th Generation)", iPodTouch6, 8.4)

});

#define ESTIMATED_SIZE_TEST(width, height, deviceScale, size, deviceType) \
    context(@"On a device with a resolution of " #width " ⨉ " #height " at " #deviceScale "x", ^{ \
        beforeEach(^{ \
            [mockCoordinateSpace stub:@selector(bounds) \
                            andReturn:theValue(CGRectMake(0.0f, 0.0f, \
                                                          width##.0f, height##.0f))]; \
            [mockScreen stub:@selector(scale) andReturn:theValue(deviceScale##.0f)]; \
        }); \
        it(@"should estimate the size of a " #size " Inch " #deviceType, ^{ \
            NSLog(@"Expecting screen size " #width "⨉" #height " and scale " \
                  #deviceScale " to equal " #size " inches"); \
            if (@available(iOS 10.0, *)) { \
                [[UIDevice.currentDevice.irl_physicalScreenHeight should] \
                 beWithin:0.01 \
                 ofMeasurement:IRL_MM(k##deviceType##size##InchScreenHeight)]; \
                [[UIDevice.currentDevice.irl_physicalScreenWidth should] \
                 beWithin:0.01 \
                 ofMeasurement:IRL_MM(k##deviceType##size##InchScreenWidth)]; \
            } \
            [[theValue(UIDevice.currentDevice.irl_rawPhysicalScreenHeight) should] \
             beWithin:theValue(0.1) \
             of:theValue(k##deviceType##size##InchScreenHeight)]; \
            [[theValue(UIDevice.currentDevice.irl_rawPhysicalScreenWidth) should] \
             beWithin:theValue(0.1) \
             of:theValue(k##deviceType##size##InchScreenWidth)]; \
        }); \
    });

describe(@"Estimating the size of an unknown device based on the screen size", ^{
    
    registerMatchers(@"IRL");
    
    __block UIScreen *mockScreen = nil;
    __block NSObject <UICoordinateSpace> *mockCoordinateSpace = nil;
    
    beforeEach(^{
        
        [UIDevice.currentDevice stub:@selector(orchardiOSDevice)
                           andReturn:theValue(OrchardiOSDeviceSimulator)];
        
        mockScreen = [UIScreen mock];
        mockCoordinateSpace = [KWMock mockForProtocol:@protocol(UICoordinateSpace)];
        
        [UIScreen stub:@selector(mainScreen) andReturn:mockScreen];
        
        [mockScreen stub:@selector(fixedCoordinateSpace)
               andReturn:mockCoordinateSpace];
        
    });
    
    afterEach(^{
        
        mockScreen = nil;
        
    });

    ESTIMATED_SIZE_TEST(320, 480, 1, 3_5, iPhone)
    ESTIMATED_SIZE_TEST(320, 480, 2, 3_5, iPhone)
    ESTIMATED_SIZE_TEST(320, 568, 2, 4_0, iPhone)
    ESTIMATED_SIZE_TEST(375, 667, 2, 4_7, iPhone)
    ESTIMATED_SIZE_TEST(414, 736, 3, 5_5, iPhone)
    ESTIMATED_SIZE_TEST(375, 812, 3, 5_8, iPhone)
    ESTIMATED_SIZE_TEST(414, 896, 2, 6_1, iPhone)
    ESTIMATED_SIZE_TEST(414, 896, 3, 6_5, iPhone)

    ESTIMATED_SIZE_TEST(768,  1024, 1,  9_7, iPad)
    ESTIMATED_SIZE_TEST(768,  1024, 2,  9_7, iPad)
    ESTIMATED_SIZE_TEST(834,  1112, 2, 10_5, iPad)
    ESTIMATED_SIZE_TEST(1024, 1366, 2, 12_9, iPad)
    
});

describe(@"Getting the IRL size of a view", ^{
    
    registerMatchers(@"IRL");
    
    __block UIApplication *mockSharedApplication;
    __block UIScreen *mockMainScreen;
    __block UIWindow *mockWindow;
    
    beforeEach(^{
        
        mockMainScreen = [UIScreen mock];
        
        [UIScreen stub:@selector(mainScreen)
             andReturn:mockMainScreen];
        
        mockWindow = [UIWindow mock];
        
        [mockWindow stub:@selector(screen)
               andReturn:mockMainScreen];
        
        mockSharedApplication = [UIApplication mock];
        
        [mockSharedApplication stub:@selector(statusBarOrientation)
                          andReturn:theValue(UIInterfaceOrientationPortrait)];
        
        [mockSharedApplication stub:@selector(keyWindow)
                          andReturn:mockWindow];
        
        [UIApplication stub:@selector(sharedApplication)
                  andReturn:mockSharedApplication];
        
        [mockWindow stub:@selector(convertRect:fromView:)
               withBlock:^id(NSArray *params) {
                   NSValue *frameValue = params[0];
                   
                   CGRect frame = [frameValue CGRectValue];
                   
                   return theValue(frame);
               }];
        
    });
    
    context(@"on an iPhone 6", ^{
        
        __block UIView *view;
        
        beforeEach(^{
            
            CGRect iPhone6sBounds = CGRectMake(0.0f, 0.0f,
                                               375.0f, 667.0f);
            
            KWMock <UICoordinateSpace> *mockFixedCoordinateSpace =
            [KWMock mockForProtocol:@protocol(UICoordinateSpace)];
            
            [mockFixedCoordinateSpace stub:@selector(bounds)
                                 andReturn:theValue(iPhone6sBounds)];
            
            [mockMainScreen stub:@selector(fixedCoordinateSpace)
                       andReturn:mockFixedCoordinateSpace];
            
            [mockMainScreen stub:@selector(bounds)
                       andReturn:theValue(iPhone6sBounds)];
            
            [UIDevice.currentDevice stub:@selector(orchardiOSDevice)
                               andReturn:theValue(OrchardiOSDeviceiPhone6)];
            
            [mockWindow stub:@selector(bounds)
                   andReturn:theValue(iPhone6sBounds)];
            
            view = [[UIView alloc] initWithFrame:CGRectMake(0.0f,
                                                            0.0f,
                                                            100.0f,
                                                            100.0f)];
            
        });
        
        context(@"when a view is on the main screen", ^{
            
            beforeEach(^{
                
                [view stub:@selector(window) andReturn:mockWindow];
                [view stub:@selector(superview) andReturn:mockWindow];
                
            });
            
            it(@"should report the correct size", ^{
                
                if (@available(iOS 10.0, *)) {
                    NSMeasurement<NSUnitLength *> *expectedSize = IRL_MM(15.5997001499);
                    
                    [[view.irl_physicalWidth should] beWithin:0.01
                                                ofMeasurement:expectedSize];
                    
                    [[view.irl_physicalHeight should] beWithin:0.01
                                                 ofMeasurement:expectedSize];
                }
                
                [[theValue(view.irl_rawPhysicalWidth) should]
                 beWithin:theValue(0.01)
                 of:theValue(15.5997001499)];

                [[theValue(view.irl_rawPhysicalHeight) should]
                 beWithin:theValue(0.01)
                 of:theValue(15.5997001499)];
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                if (@available(iOS 10.0, *)) {
                    CGAffineTransform transform =
                    [view irl_transformForPhysicalWidth:IRL_MM(10)];
                    
                    CGAffineTransform expectedTransform =
                    CGAffineTransformMakeScale(0.641025602, 0.641025602);
                    
                    [[theValue(transform.a) should] equal:expectedTransform.a
                                                withDelta:0.001];
                    
                    [[theValue(transform.d) should] equal:expectedTransform.d
                                                withDelta:0.001];
                }
                
                CGAffineTransform transform = [view irl_transformForRawPhysicalWidth:10];
                
                CGAffineTransform expectedTransform =
                CGAffineTransformMakeScale(0.641025602, 0.641025602);
                
                [[theValue(transform.a) should] equal:expectedTransform.a
                                            withDelta:0.001];
                
                [[theValue(transform.d) should] equal:expectedTransform.d
                                            withDelta:0.001];
            });
            
        });
        
        context(@"when a view is not attached to a window", ^{
            
            it(@"should report the correct size", ^{
                
                if (@available(iOS 10.0, *)) {
                    NSMeasurement<NSUnitLength *> *expectedSize = IRL_MM(15.5997001499);
                    
                    [[view.irl_physicalWidth should] beWithin:0.01
                                                ofMeasurement:expectedSize];
                    
                    [[view.irl_physicalHeight should] beWithin:0.01
                                                 ofMeasurement:expectedSize];
                }
                
                [[theValue(view.irl_rawPhysicalWidth) should]
                 beWithin:theValue(0.01)
                 of:theValue(15.5997001499)];
                
                [[theValue(view.irl_rawPhysicalHeight) should]
                 beWithin:theValue(0.01)
                 of:theValue(15.5997001499)];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                if (@available(iOS 10.0, *)) {
                    CGAffineTransform transform =
                    [view irl_transformForPhysicalWidth:IRL_MM(10)];
                    
                    CGAffineTransform expectedTransform =
                    CGAffineTransformMakeScale(0.641025602, 0.641025602);
                    
                    [[theValue(transform.a) should] equal:expectedTransform.a
                                                withDelta:0.001];
                    
                    [[theValue(transform.d) should] equal:expectedTransform.d
                                                withDelta:0.001];
                }
                
                CGAffineTransform transform = [view irl_transformForRawPhysicalWidth:10];
                
                CGAffineTransform expectedTransform =
                CGAffineTransformMakeScale(0.641025602, 0.641025602);
                
                [[theValue(transform.a) should] equal:expectedTransform.a
                                            withDelta:0.001];
                
                [[theValue(transform.d) should] equal:expectedTransform.d
                                            withDelta:0.001];
                
            });
            
        });
        
        context(@"when there is no key window", ^{
            
            beforeEach(^{
                
                [UIApplication.sharedApplication stub:@selector(keyWindow)
                                            andReturn:nil];
                
            });
            
            it(@"should report the correct size", ^{
                
                if (@available(iOS 10.0, *)) {
                    NSMeasurement<NSUnitLength *> *expectedSize = IRL_MM(15.597333);
                    
                    [[view.irl_physicalWidth should] beWithin:0.01
                                                ofMeasurement:expectedSize];
                    
                    [[view.irl_physicalHeight should] beWithin:0.01
                                                 ofMeasurement:expectedSize];
                }
                
                [[theValue(view.irl_rawPhysicalWidth) should]
                 beWithin:theValue(0.01)
                 of:theValue(15.597333)];
                
                [[theValue(view.irl_rawPhysicalHeight) should]
                 beWithin:theValue(0.01)
                 of:theValue(15.597333)];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                if (@available(iOS 10.0, *)) {
                    CGAffineTransform transform =
                    [view irl_transformForPhysicalWidth:IRL_MM(10)];
                    
                    CGAffineTransform expectedTransform =
                    CGAffineTransformMakeScale(0.641025602, 0.641025602);
                    
                    [[theValue(transform.a) should] equal:expectedTransform.a
                                                withDelta:0.001];
                    
                    [[theValue(transform.d) should] equal:expectedTransform.d
                                                withDelta:0.001];
                }
                
                CGAffineTransform transform = [view irl_transformForRawPhysicalWidth:10];
                
                CGAffineTransform expectedTransform =
                CGAffineTransformMakeScale(0.641025602, 0.641025602);
                
                [[theValue(transform.a) should] equal:expectedTransform.a
                                            withDelta:0.001];
                
                [[theValue(transform.d) should] equal:expectedTransform.d
                                            withDelta:0.001];

                
            });
            
            context(@"when the device is rotated to landscape", ^{
                
                beforeEach(^{
                    
                    [mockSharedApplication stub:@selector(statusBarOrientation)
                                      andReturn:theValue(UIInterfaceOrientationLandscapeLeft)];
                    
                });
                
                it(@"should report the correct size", ^{
                    
                    if (@available(iOS 10.0, *)) {
                        NSMeasurement<NSUnitLength *> *expectedSize = IRL_MM(15.597333);
                        
                        [[view.irl_physicalWidth should] beWithin:0.01
                                                    ofMeasurement:expectedSize];
                        
                        [[view.irl_physicalHeight should] beWithin:0.01
                                                     ofMeasurement:expectedSize];
                    }
                    
                    [[theValue(view.irl_rawPhysicalWidth) should]
                     beWithin:theValue(0.01)
                     of:theValue(15.597333)];
                    
                    [[theValue(view.irl_rawPhysicalHeight) should]
                     beWithin:theValue(0.01)
                     of:theValue(15.597333)];
                    
                });
                
                it(@"should return the correct transform to resize the view", ^{
                    
                    if (@available(iOS 10.0, *)) {
                        CGAffineTransform transform =
                        [view irl_transformForPhysicalWidth:IRL_MM(10)];
                        
                        CGAffineTransform expectedTransform =
                        CGAffineTransformMakeScale(0.641025602, 0.641025602);
                        
                        [[theValue(transform.a) should] equal:expectedTransform.a
                                                    withDelta:0.001];
                        
                        [[theValue(transform.d) should] equal:expectedTransform.d
                                                    withDelta:0.001];
                    }
                    
                    CGAffineTransform transform = [view irl_transformForRawPhysicalWidth:10];
                    
                    CGAffineTransform expectedTransform =
                    CGAffineTransformMakeScale(0.641025602, 0.641025602);
                    
                    [[theValue(transform.a) should] equal:expectedTransform.a
                                                withDelta:0.001];
                    
                    [[theValue(transform.d) should] equal:expectedTransform.d
                                                withDelta:0.001];
                    
                    
                });
                
            });
            
        });
        
        context(@"when a view is on a secondary screen", ^{
            
            beforeEach(^{
                
                UIScreen *mockOtherScreen = [UIScreen mock];
                UIWindow *mockOtherWindow = [UIWindow mock];
                
                [mockOtherWindow stub:@selector(screen)
                            andReturn:mockOtherScreen];
                
                [view stub:@selector(superview)
                 andReturn:mockOtherWindow];
                
                [view stub:@selector(window)
                 andReturn:mockOtherWindow];
                
                [view stub:@selector(transform)
                 andReturn:theValue(CGAffineTransformIdentity)];
                
            });
            
            it(@"should not return a size", ^{
                
                if (@available(iOS 10.0, *)) {
                    [[view.irl_physicalWidth should] beNil];
                    [[view.irl_physicalHeight should] beNil];
                }
                
                [[theValue(view.irl_rawPhysicalWidth) should] beZero];
                [[theValue(view.irl_rawPhysicalHeight) should] beZero];
            });
            
            it(@"should reuse the view’s transform for resizing", ^{
                
                if (@available(iOS 10.0, *)) {
                    NSMeasurement<NSUnitLength *> *desiredWidth = IRL_MM(42);
                    
                    CGAffineTransform transform =
                    [view irl_transformForPhysicalWidth:desiredWidth];
                    
                    [[theValue(CGAffineTransformIsIdentity(transform)) should] beTrue];
                }
                
                CGAffineTransform transform = [view irl_transformForRawPhysicalWidth:42];
                
                [[theValue(CGAffineTransformIsIdentity(transform)) should] beTrue];
                
            });
            
        });
        
    });
    
});

SPEC_END
