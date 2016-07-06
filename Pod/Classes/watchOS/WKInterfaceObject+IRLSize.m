//
//  WKInterfaceObject+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "WKInterfaceObject+IRLSize.h"

@implementation WKInterfaceObject (IRLSize)

- (void)irl_setPhysicalWidth:(NSMeasurement<NSUnitLength *> *)width
{
    NSMeasurement<NSUnitLength *> *screenWidth =
    [WKInterfaceDevice currentDevice].physicalScreenWidth;
    
    if ([width canBeConvertedToUnit:screenWidth.unit]) {
        NSMeasurement<NSUnitLength *> *convertedWidth =
        [width measurementByConvertingToUnit:screenWidth.unit];
        
        double ratio = convertedWidth.doubleValue / screenWidth.doubleValue;
        
        CGFloat screenWidthInPoints =
        CGRectGetWidth([WKInterfaceDevice currentDevice].screenBounds);
        
        CGFloat targetWidth = screenWidthInPoints * ratio;
        
        [self setWidth:targetWidth];
    }
}

- (void)irl_setPhysicalHeight:(NSMeasurement<NSUnitLength *> *)height
{
    NSMeasurement<NSUnitLength *> *screenHeight =
    [WKInterfaceDevice currentDevice].physicalScreenHeight;
    
    if ([height canBeConvertedToUnit:screenHeight.unit]) {
        NSMeasurement<NSUnitLength *> *convertedHeight =
        [height measurementByConvertingToUnit:screenHeight.unit];
        
        double ratio = convertedHeight.doubleValue / screenHeight.doubleValue;
        
        CGFloat screenHeightInPoints =
        CGRectGetHeight([WKInterfaceDevice currentDevice].screenBounds);
        
        CGFloat targetHeight = screenHeightInPoints * ratio;
        
        [self setHeight:targetHeight];
    }
}

@end
