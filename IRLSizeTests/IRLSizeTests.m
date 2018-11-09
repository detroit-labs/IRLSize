//
//  IRLSizeTests.m
//  IRLSizeTests
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import <IRLSize/IRLSize.h>

#import <UIKit/UIKit.h>

#import <Kiwi/Kiwi.h>
#import <SDVersion/SDVersion.h>

#import "IRLMeasurementBeWithinMatcher.h"
#import "iOSDeviceConstants.h"

#define IRL_MM(x) [[NSMeasurement alloc] initWithDoubleValue:(x) unit:IRL_SIZE_UNIT]

#define KNOWN_DEVICE_TEST_UNMATCHING(name, modelEnum, sizeEnumPrefix) \
    context(@"on an " name, ^{ \
        beforeEach(^{ \
            [SDiOSVersion stub:@selector(deviceVersion) \
                     andReturn:theValue(modelEnum)]; \
        }); \
        it(@"should report the correct height", ^{ \
            NSLog(@"Expecting device " #modelEnum " height to equal %f", \
                  k##sizeEnumPrefix##ScreenHeight); \
            [[UIDevice.currentDevice.irl_physicalScreenHeight should] \
             beWithin:0.01 \
             ofMeasurement:IRL_MM(k##sizeEnumPrefix##ScreenHeight)]; \
            [[theValue(UIDevice.currentDevice.irl_rawPhysicalScreenHeight) should] \
             beWithin:theValue(0.1) \
             of:theValue(k##sizeEnumPrefix##ScreenHeight)]; \
        }); \
        it(@"should report the correct width", ^{ \
            NSLog(@"Expecting device " #modelEnum " width to equal %f", \
                  k##sizeEnumPrefix##ScreenWidth); \
            [[UIDevice.currentDevice.irl_physicalScreenWidth should] \
             beWithin:0.01 \
             ofMeasurement:IRL_MM(k##sizeEnumPrefix##ScreenWidth)]; \
            [[theValue(UIDevice.currentDevice.irl_rawPhysicalScreenWidth) should] \
             beWithin:theValue(0.1) \
             of:theValue(k##sizeEnumPrefix##ScreenWidth)]; \
        }); \
    });

#define KNOWN_DEVICE_TEST_MATCHING(name, enum) \
    KNOWN_DEVICE_TEST_UNMATCHING(name, enum, enum)

SPEC_BEGIN(IRLSizeTests)

describe(@"Getting the native size of a device", ^{

    registerMatchers(@"IRL");

    KNOWN_DEVICE_TEST_MATCHING("iPhone 5", iPhone5)
    KNOWN_DEVICE_TEST_UNMATCHING("iPhone 5c", iPhone5C, iPhone5c)
    KNOWN_DEVICE_TEST_UNMATCHING("iPhone 5s", iPhone5S, iPhone5s)
    KNOWN_DEVICE_TEST_MATCHING("iPhone SE", iPhoneSE)
    KNOWN_DEVICE_TEST_MATCHING("iPhone 6", iPhone6)
    KNOWN_DEVICE_TEST_MATCHING("iPhone 6 Plus", iPhone6Plus)
    KNOWN_DEVICE_TEST_UNMATCHING("iPhone 6s", iPhone6S, iPhone6s)
    KNOWN_DEVICE_TEST_UNMATCHING("iPhone 6s Plus", iPhone6SPlus, iPhone6sPlus)
    KNOWN_DEVICE_TEST_MATCHING("iPhone 7", iPhone7)
    KNOWN_DEVICE_TEST_MATCHING("iPhone 7 Plus", iPhone7Plus)
    KNOWN_DEVICE_TEST_MATCHING("iPhone 8", iPhone8)
    KNOWN_DEVICE_TEST_MATCHING("iPhone 8 Plus", iPhone8Plus)
    KNOWN_DEVICE_TEST_MATCHING("iPhone X", iPhoneX)

    KNOWN_DEVICE_TEST_MATCHING("iPad (4th Generation)", iPad4)
    KNOWN_DEVICE_TEST_MATCHING("iPad mini", iPadMini)
    KNOWN_DEVICE_TEST_MATCHING("iPad Air", iPadAir)
    KNOWN_DEVICE_TEST_MATCHING("iPad mini (2nd Generation)", iPadMini2)
    KNOWN_DEVICE_TEST_MATCHING("iPad Air2", iPadAir2)
    KNOWN_DEVICE_TEST_MATCHING("iPad mini (3rd Generation)", iPadMini3)
    KNOWN_DEVICE_TEST_UNMATCHING("iPad Pro (9.7\")", iPadPro9Dot7Inch, iPadPro9_7Inch)
    KNOWN_DEVICE_TEST_UNMATCHING("iPad Pro (12.9\")", iPadPro12Dot9Inch, iPadPro12_9Inch)
    KNOWN_DEVICE_TEST_MATCHING("iPad mini (4th Generation)", iPadMini4)
    KNOWN_DEVICE_TEST_MATCHING("iPad (5th Generation)", iPad5)
    KNOWN_DEVICE_TEST_UNMATCHING("iPad Pro (10.5\")", iPadPro10Dot5Inch, iPadPro10_5Inch)
    KNOWN_DEVICE_TEST_UNMATCHING("iPad Pro (12.9\", 2nd Generation)", iPadPro12Dot9Inch2Gen, iPadPro12_9Inch2)

    KNOWN_DEVICE_TEST_UNMATCHING("iPod touch (5th Generation)", iPodTouch5Gen, iPodTouch5)
    KNOWN_DEVICE_TEST_UNMATCHING("iPod touch (6th Generation)", iPodTouch6Gen, iPodTouch6)

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
            [[UIDevice.currentDevice.irl_physicalScreenHeight should] \
             beWithin:0.01 \
             ofMeasurement:IRL_MM(k##deviceType##size##InchScreenHeight)]; \
            [[UIDevice.currentDevice.irl_physicalScreenWidth should] \
             beWithin:0.01 \
             ofMeasurement:IRL_MM(k##deviceType##size##InchScreenWidth)]; \
        }); \
    });

describe(@"Estimating the size of an unknown device based on the screen size", ^{
    
    registerMatchers(@"IRL");
    
    __block UIScreen *mockScreen = nil;
    __block NSObject <UICoordinateSpace> *mockCoordinateSpace = nil;
    
    beforeEach(^{
        
        [SDiOSVersion stub:@selector(deviceVersion)
                 andReturn:theValue(Simulator)];
        
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
    
    context(@"on an iPhone 6s", ^{
        
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
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6S)];
            
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
                
                NSMeasurement<NSUnitLength *> *expectedSize =
                [[NSMeasurement alloc] initWithDoubleValue:0.01654589372
                                                      unit:[NSUnitLength meters]];
                
                [[view.irl_physicalWidth should] beWithin:0.01
                                            ofMeasurement:expectedSize];
                
                [[view.irl_physicalHeight should] beWithin:0.01
                                             ofMeasurement:expectedSize];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                CGAffineTransform transform =
                [view irl_transformForPhysicalWidth:
                 [[NSMeasurement alloc] initWithDoubleValue:0.01
                                                       unit:[NSUnitLength meters]]];
                
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
                
                NSMeasurement<NSUnitLength *> *expectedSize =
                [[NSMeasurement alloc] initWithDoubleValue:0.01654589372
                                                      unit:[NSUnitLength meters]];
                
                [[view.irl_physicalWidth should] beWithin:0.01
                                            ofMeasurement:expectedSize];
                
                [[view.irl_physicalHeight should] beWithin:0.01
                                             ofMeasurement:expectedSize];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                CGAffineTransform transform =
                [view irl_transformForPhysicalWidth:
                 [[NSMeasurement alloc] initWithDoubleValue:0.01f
                                                       unit:[NSUnitLength meters]]];
                
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
                
                NSMeasurement<NSUnitLength *> *expectedSize =
                [[NSMeasurement alloc] initWithDoubleValue:0.01654589372
                                                      unit:[NSUnitLength meters]];
                
                [[view.irl_physicalWidth should] beWithin:0.01
                                            ofMeasurement:expectedSize];
                
                [[view.irl_physicalHeight should] beWithin:0.01
                                             ofMeasurement:expectedSize];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                CGAffineTransform transform =
                [view irl_transformForPhysicalWidth:
                 [[NSMeasurement alloc] initWithDoubleValue:0.01
                                                       unit:[NSUnitLength meters]]];
                
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
                    
                    NSMeasurement<NSUnitLength *> *expectedSize =
                    [[NSMeasurement alloc] initWithDoubleValue:0.01654589372
                                                          unit:[NSUnitLength meters]];
                    
                    [[view.irl_physicalWidth should] beWithin:0.01
                                                ofMeasurement:expectedSize];
                    
                    [[view.irl_physicalHeight should] beWithin:0.01
                                                 ofMeasurement:expectedSize];
                    
                    
                });
                
                it(@"should return the correct transform to resize the view", ^{
                    
                    CGAffineTransform transform =
                    [view irl_transformForPhysicalWidth:
                     [[NSMeasurement alloc] initWithDoubleValue:0.01
                                                           unit:[NSUnitLength meters]]];
                    
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
                
                [[view.irl_physicalWidth should] beNil];
                [[view.irl_physicalHeight should] beNil];
                
            });
            
            it(@"should reuse the view’s transform for resizing", ^{
                
                NSMeasurement<NSUnitLength *> *desiredWidth =
                [[NSMeasurement alloc] initWithDoubleValue:0.42
                                                      unit:[NSUnitLength meters]];
                
                CGAffineTransform transform =
                [view irl_transformForPhysicalWidth:desiredWidth];
                
                [[theValue(CGAffineTransformIsIdentity(transform)) should] beTrue];
                
            });
            
        });
        
    });
    
});

SPEC_END
