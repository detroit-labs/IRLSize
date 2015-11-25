//
//  IRLSizeTests.m
//  IRLSizeTests
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//


#import "SDVersion.h"


SPEC_BEGIN(IRLSizeTests)

describe(@"Getting the native size of a device", ^{
    
    context(@"on an iPhone 6 Plus", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6Plus)];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.1218 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.0685 withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPad Air", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadAir)];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.1971 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.1478 withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPad Pro", ^{
        
        beforeEach(^{
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPadPro)];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.2622 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.1965 withDelta:0.01];
            
        });
        
    });
    
});

describe(@"Getting the IRL size of a view", ^{
    
    __block UIApplication *mockSharedApplication;
    __block UIScreen *mockMainScreen;
    __block UIWindow *mockWindow;
    
    beforeEach(^{
        
        mockMainScreen = [UIScreen mock];
        
        [UIScreen stub:@selector(mainScreen)
             andReturn:mockMainScreen];
        
        mockWindow = [UIWindow mock];
        
        mockSharedApplication = [UIApplication mock];
        
        [mockSharedApplication stub:@selector(statusBarOrientation)
                          andReturn:theValue(UIInterfaceOrientationPortrait)];
        
        [mockSharedApplication stub:@selector(keyWindow)
                          andReturn:mockWindow];
        
        [UIApplication stub:@selector(sharedApplication)
                  andReturn:mockSharedApplication];
        
        [mockWindow stub:@selector(screen)
               andReturn:mockMainScreen];
        
        [mockWindow stub:@selector(convertRect:fromView:)
               withBlock:^id(NSArray *params) {
                   NSValue *frameValue = params[0];
                   
                   CGRect frame = [frameValue CGRectValue];
                   
                   return theValue(frame);
               }];
        
    });
    
    context(@"on an iPhone 6 Plus", ^{
        
        __block UIView *view;
        
        beforeEach(^{
            
            CGRect iPhone6PlusBounds = CGRectMake(0.0f, 0.0f,
                                                  414.0f, 736.0f);
            
            KWMock <UICoordinateSpace> *mockFixedCoordinateSpace =
            [KWMock mockForProtocol:@protocol(UICoordinateSpace)];
            
            [mockFixedCoordinateSpace stub:@selector(bounds)
                                 andReturn:theValue(iPhone6PlusBounds)];
            
            [mockMainScreen stub:@selector(fixedCoordinateSpace)
                       andReturn:mockFixedCoordinateSpace];
            
            [mockMainScreen stub:@selector(bounds)
                       andReturn:theValue(iPhone6PlusBounds)];
            
            [SDiOSVersion stub:@selector(deviceVersion)
                     andReturn:theValue(iPhone6Plus)];
            
            [mockWindow stub:@selector(bounds)
                   andReturn:theValue(iPhone6PlusBounds)];
            
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
                
                [[theValue([view irl_dimensions].width) should] equal:0.01654589372
                                                            withDelta:0.001];
                
                [[theValue([view irl_dimensions].height) should] equal:0.01654589372
                                                             withDelta:0.001];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                CGAffineTransform transform = [view irl_transformForWidth:0.01f];
                
                CGAffineTransform expectedTransform =
                CGAffineTransformMakeScale(0.604379535f, 0.604379535f);
                
                [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                
            });
            
        });
        
        context(@"when a view is not attached to a window", ^{
            
            it(@"should report the correct size", ^{
                
                [[theValue([view irl_dimensions].width) should] equal:0.01654589372
                                                            withDelta:0.001];
                
                [[theValue([view irl_dimensions].height) should] equal:0.01654589372
                                                             withDelta:0.001];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                CGAffineTransform transform = [view irl_transformForWidth:0.01f];
                
                CGAffineTransform expectedTransform =
                CGAffineTransformMakeScale(0.604379535f, 0.604379535f);
                
                [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                
            });
            
        });
        
        context(@"when there is no key window", ^{
            
            beforeEach(^{
                
                [[UIApplication sharedApplication] stub:@selector(keyWindow)
                                              andReturn:nil];
                
            });
            
            it(@"should report the correct size", ^{
                
                [[theValue([view irl_dimensions].width) should] equal:0.01654589372
                                                            withDelta:0.001];
                
                [[theValue([view irl_dimensions].height) should] equal:0.01654589372
                                                             withDelta:0.001];
                
            });
            
            it(@"should return the correct transform to resize the view", ^{
                
                CGAffineTransform transform = [view irl_transformForWidth:0.01f];
                
                CGAffineTransform expectedTransform =
                CGAffineTransformMakeScale(0.604379535f, 0.604379535f);
                
                [[theValue(CGAffineTransformEqualToTransform(transform, expectedTransform)) should] beTrue];
                
            });
            
            context(@"when the device is rotated to landscape", ^{
                
                beforeEach(^{
                    
                    [mockSharedApplication stub:@selector(statusBarOrientation)
                                      andReturn:theValue(UIInterfaceOrientationLandscapeLeft)];
                    
                });
                
                it(@"should report the correct size", ^{
                    
                    [[theValue([view irl_dimensions].width) should] equal:0.01654589372
                                                                withDelta:0.001];
                    
                    [[theValue([view irl_dimensions].height) should] equal:0.01654589372
                                                                 withDelta:0.001];
                    
                });
                
                it(@"should return the correct transform to resize the view", ^{
                    
                    CGAffineTransform transform = [view irl_transformForWidth:0.01f];
                    
                    CGAffineTransform expectedTransform =
                    CGAffineTransformMakeScale(0.604379535f, 0.604379535f);
                    
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
            
            it(@"should report 0 for size", ^{
                
                [[theValue([view irl_dimensions].width) should] beZero];
                [[theValue([view irl_dimensions].height) should] beZero];
                
            });
            
            it(@"should reuse the view’s transform for resizing", ^{
                
                CGAffineTransform transform = [view irl_transformForWidth:1.0f];
                
                [[theValue(CGAffineTransformIsIdentity(transform)) should] beTrue];
                
            });
            
        });
        
    });
    
});

describe(@"Estimating the size of a device based on the screen size", ^{
    
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
   
    context(@"on an iPhone 4S", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          320.0f, 480.0f))];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.0740 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.0493 withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPhone 5", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          320.0f, 568.0f))];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.0885 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.0499 withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPhone 6", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          375.0f, 667.0f))];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.1041 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.0585f withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPhone 6 Plus", ^{
        
        beforeEach(^{

            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          414.0f, 736.0f))];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.1218 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.0685 withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPad", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          768.0f, 1024.0f))];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.1971 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.1478 withDelta:0.01];
            
        });
        
    });
    
    context(@"on an iPad Pro", ^{
        
        beforeEach(^{
            
            [mockCoordinateSpace stub:@selector(bounds)
                            andReturn:theValue(CGRectMake(0.0f, 0.0f,
                                                          1024.0f, 1366.0f))];
            
        });
        
        it(@"should report the correct height", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceHeight]) should]
             equal:0.2622 withDelta:0.01];
            
        });
        
        it(@"should report the correct width", ^{
            
            [[theValue([[UIDevice currentDevice] irl_deviceWidth]) should]
             equal:0.1965 withDelta:0.01];
            
        });
        
    });
    
});

SPEC_END
