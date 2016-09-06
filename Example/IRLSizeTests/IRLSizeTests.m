//
//  IRLSizeTests.m
//  IRLSizeTests
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <IRLSize/IRLSize.h>

#import <UIKit/UIKit.h>

#import <Kiwi/Kiwi.h>
#import <SDVersion/SDVersion.h>

#import "IRLMeasurementBeWithinMatcher.h"

SPEC_BEGIN(IRLSizeTests)

describe(@"Getting the native size of a device", ^{
    
    registerMatchers(@"IRL");
    
    context(@"on an iPhone 5", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone5)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.0885
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0499
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPhone 5C", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone5C)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.0885
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0499
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPhone 5S", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone5S)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.0885
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0499
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
    });
    
    context(@"on an iPhone SE", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhoneSE)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.0885
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0499
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPhone 6", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1041
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0585
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPhone 6s", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6S)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1041
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0585
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPhone 6 Plus", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6SPlus)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1218
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0685
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPhone 6s Plus", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6SPlus)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1218
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0685
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPad mini (2nd Generation)", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadMini2)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1605
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1204
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPad mini (3rd Generation)", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadMini3)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1605
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1204
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPad mini (4th Generation)", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadMini4)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1605
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1204
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPad (4th Generation)", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPad4)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1971
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1478
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPad Air", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadAir)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1971
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1478
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on an iPad Air 2", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadAir2)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1971
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1478
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on a 9.7\" iPad Pro", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadPro9Dot7Inch)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1971
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1478
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on a 12.9\" iPad Pro", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadPro12Dot9Inch)];
            
        });
        
        it(@"should report the correct height", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.2622
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should report the correct width", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1965
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
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
                
                [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                
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
                
                [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                
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
                
                [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                
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
                    
                    [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                    
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
    
    context(@"on a device with a resolution of 320 ⨉ 568", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          320.0f, 568.0f))];
            
        });
        
        it(@"should estimate the height of a 4\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.0885
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should estimate the width of a 4\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0499
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on a device with a resolution of 375 ⨉ 667", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          375.0f, 667.0f))];
            
        });
        
        it(@"should estimate the height of a 4.7\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1041
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should estimate the width of a 4.7\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0585f
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on a device with a resolution of 414 ⨉ 736", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          414.0f, 736.0f))];
            
        });
        
        it(@"should estimate the height of a 5.5\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1218
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should estimate the width of a 5.5\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.0685
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on a device with a resolution of 768 ⨉ 1024", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          768.0f, 1024.0f))];
            
        });
        
        it(@"should estimate the height of a 9.7\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.1971
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should estimate the width of a 9.7\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1478
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
    context(@"on a device with a resolution of 1024 ⨉ 1366", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          1024.0f, 1366.0f))];
            
        });
        
        it(@"should estimate the height of a 12.9\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedHeight =
            [[NSMeasurement alloc] initWithDoubleValue:0.2622
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenHeight should]
             beWithin:0.01
             ofMeasurement:expectedHeight];
            
        });
        
        it(@"should estimate the width of a 12.9\" device", ^{
            
            NSMeasurement<NSUnitLength *> *expectedWidth =
            [[NSMeasurement alloc] initWithDoubleValue:0.1965
                                                  unit:[NSUnitLength meters]];
            
            [[UIDevice.currentDevice.irl_physicalScreenWidth should]
             beWithin:0.01
             ofMeasurement:expectedWidth];
            
        });
        
    });
    
});

SPEC_END
