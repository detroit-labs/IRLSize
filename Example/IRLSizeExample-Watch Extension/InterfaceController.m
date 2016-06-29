//
//  InterfaceController.m
//  IRLSizeExample-Watch Extension
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "InterfaceController.h"

#import "WKInterfaceDevice+IRLSize.h"
#import "WKInterfaceObject+IRLSize.h"

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
    NSMeasurement<NSUnitLength *> *halfInch =
    [[NSMeasurement alloc] initWithDoubleValue:0.5
                                          unit:[NSUnitLength inches]];
    
    [self.halfInchGroup irl_setPhysicalWidth:halfInch];
    [self.halfInchGroup irl_setPhysicalHeight:halfInch];
}

- (void)configureLabels
{
    NSMeasurementFormatter *formatter = [[NSMeasurementFormatter alloc] init];
    
    formatter.unitOptions = NSMeasurementFormatterUnitOptionsProvidedUnit;
    
    NSUnitLength *lengthUnitToDisplay;
    
    if ([[NSLocale currentLocale] usesMetricSystem]) {
        lengthUnitToDisplay = [NSUnitLength centimeters];
    }
    else {
        lengthUnitToDisplay = [NSUnitLength inches];
    }
    
    [self.widthLabel setText:[formatter stringFromMeasurement:
                              [[[WKInterfaceDevice currentDevice] irl_physicalScreenWidth]
                               measurementByConvertingToUnit:lengthUnitToDisplay]]];
    
    [self.heightLabel setText:[formatter stringFromMeasurement:
                               [[[WKInterfaceDevice currentDevice] irl_physicalScreenHeight]
                                measurementByConvertingToUnit:lengthUnitToDisplay]]];
}

@end
