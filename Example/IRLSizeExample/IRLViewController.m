//
//  IRLViewController.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

#import "IRLViewController.h"

#import "IRLSizeExample-Swift.h"

#import <IRLSize/UIView+IRLSize.h>

@interface IRLViewController ()

@property (assign) BOOL didTransformRuler;

@property (weak, nonatomic) IBOutlet RulerView *rulerView;

@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@end


@implementation IRLViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureLabels];
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size
          withTransitionCoordinator:coordinator];
    
    [self.rulerView setNeedsDisplay];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self configureLabels];
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
    
    self.widthLabel.text = [formatter stringFromMeasurement:
                            [[self.view irl_physicalWidth]
                             measurementByConvertingToUnit:lengthUnitToDisplay]];

    self.heightLabel.text = [formatter stringFromMeasurement:
                             [[self.view irl_physicalHeight]
                             measurementByConvertingToUnit:lengthUnitToDisplay]];
}

@end
