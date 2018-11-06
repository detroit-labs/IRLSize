//
//  WKInterfaceObject+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import "WKInterfaceObject+IRLSize.h"

@implementation WKInterfaceObject (IRLSize)

- (void)irl_setPhysicalWidth:(NSMeasurement<NSUnitLength *> *)width
{
    NSMeasurement<NSUnitLength *> *screenWidth =
    [WKInterfaceDevice currentDevice].irl_physicalScreenWidth;
    
    if ([width canBeConvertedToUnit:screenWidth.unit]) {
        NSMeasurement<NSUnitLength *> *convertedWidth =
        [width measurementByConvertingToUnit:screenWidth.unit];
        
        [self irl_setRawPhysicalWidth:convertedWidth.doubleValue];
        
        double ratio = convertedWidth.doubleValue / screenWidth.doubleValue;
        
        [self irl_setWidthRatio:ratio];
    }
}

- (void)irl_setPhysicalHeight:(NSMeasurement<NSUnitLength *> *)height
{
    NSMeasurement<NSUnitLength *> *screenHeight =
    [WKInterfaceDevice currentDevice].irl_physicalScreenHeight;
    
    if ([height canBeConvertedToUnit:screenHeight.unit]) {
        NSMeasurement<NSUnitLength *> *convertedHeight =
        [height measurementByConvertingToUnit:screenHeight.unit];
        
        double ratio = convertedHeight.doubleValue / screenHeight.doubleValue;
        
        [self irl_setHeightRatio:ratio];
    }
}

- (void)irl_setRawPhysicalWidth:(IRLRawMillimeters)width
{
    IRLRawMillimeters screenWidth =
    [WKInterfaceDevice currentDevice].irl_rawPhysicalScreenWidth;
    
    double ratio = width / screenWidth;

    [self irl_setWidthRatio:ratio];
}

- (void)irl_setRawPhysicalHeight:(IRLRawMillimeters)height
{
    IRLRawMillimeters screenHeight =
    [WKInterfaceDevice currentDevice].irl_rawPhysicalScreenHeight;
    
    double ratio = height / screenHeight;
    
    [self irl_setHeightRatio:ratio];
}

- (void)irl_setWidthRatio:(double)ratio
{
    CGFloat screenWidthInPoints =
    CGRectGetWidth([WKInterfaceDevice currentDevice].screenBounds);
    
    CGFloat targetWidth = screenWidthInPoints * ratio;
    
    [self setWidth:targetWidth];
}

- (void)irl_setHeightRatio:(double)ratio
{
    CGFloat screenHeightInPoints =
    CGRectGetHeight([WKInterfaceDevice currentDevice].screenBounds);
    
    CGFloat targetHeight = screenHeightInPoints * ratio;
    
    [self setHeight:targetHeight];
}

@end
