//
//  InterfaceController.m
//  IRLSizeExample-Watch Extension
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import "InterfaceController.h"

#import <IRLSize/IRLSize.h>

#import "IRLSizeExampleConstants.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceGroup *halfInchGroup;

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *widthLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *heightLabel;

@end

@implementation InterfaceController

- (void)willActivate
{
    [super willActivate];
    
    [self configureHalfInchGroup];
    [self configureLabels];
}

- (void)configureHalfInchGroup
{
    if (@available(watchOS 3.0, *)) {
        NSMeasurement<NSUnitLength *> *halfInch =
        [[NSMeasurement alloc] initWithDoubleValue:0.5
                                              unit:[NSUnitLength inches]];
        
        [self.halfInchGroup irl_setPhysicalWidth:halfInch];
        [self.halfInchGroup irl_setPhysicalHeight:halfInch];
    }
    else {
        const IRLRawMillimeters halfInch = 0.5 * kMillimetersPerInch;
        
        [self.halfInchGroup irl_setRawPhysicalWidth:halfInch];
        [self.halfInchGroup irl_setRawPhysicalHeight:halfInch];
    }
}

- (void)configureLabels
{
    NSString *widthString;
    NSString *heightString;
    
    BOOL usesMetric = [[[NSLocale currentLocale]
                        objectForKey:NSLocaleUsesMetricSystem] boolValue];
    
    if (@available(watchOS 3.0, *)) {
        NSMeasurementFormatter *formatter =
        [[NSMeasurementFormatter alloc] init];
        
        formatter.unitOptions = NSMeasurementFormatterUnitOptionsProvidedUnit;
        formatter.numberFormatter.maximumFractionDigits = 2;
        
        NSUnitLength *lengthUnitToDisplay =
        usesMetric ? NSUnitLength.millimeters : NSUnitLength.inches;
        
        widthString = [formatter stringFromMeasurement:
                       [WKInterfaceDevice.currentDevice.irl_physicalScreenWidth
                        measurementByConvertingToUnit:lengthUnitToDisplay]];
        
        heightString = [formatter stringFromMeasurement:
                        [WKInterfaceDevice.currentDevice.irl_physicalScreenHeight
                         measurementByConvertingToUnit:lengthUnitToDisplay]];
    }
    else {
        IRLRawMillimeters width = WKInterfaceDevice.currentDevice.irl_rawPhysicalScreenWidth;
        IRLRawMillimeters height = WKInterfaceDevice.currentDevice.irl_rawPhysicalScreenHeight;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.maximumFractionDigits = 2;
        
        NSString *suffix;
        
        if (usesMetric) {
            suffix = @" mm";
        }
        else {
            suffix = @" in";
            width *= kInchesPerMillimeter;
            height *= kInchesPerMillimeter;
        }
        
        formatter.positiveSuffix = suffix;
        
        widthString = [formatter stringFromNumber:@(width)];
        heightString = [formatter stringFromNumber:@(height)];
    }
    
    self.widthLabel.text = widthString;
    self.heightLabel.text = heightString;
}

@end
