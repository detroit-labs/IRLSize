//
//  IRLViewController.m
//  IRLSizeExample
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

#import "IRLViewController.h"

#import <IRLSize/IRLSize.h>

#import "IRLSizeExample-Swift.h"

#import "IRLSizeExampleConstants.h"


@interface IRLViewController ()

@property (assign) BOOL didTransformRuler;

@property (weak, nonatomic) IBOutlet UIView *rulerContainerView;
@property (weak, nonatomic) IBOutlet UIView *rulerView;

@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@end


@implementation IRLViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (@available(iOS 10.0, *)) {
        self.widthLabel.adjustsFontForContentSizeCategory = YES;
        self.heightLabel.adjustsFontForContentSizeCategory = YES;
    }
    else {
        [self.rulerView removeFromSuperview];
        [self.rulerContainerView removeFromSuperview];
    }
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

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self configureLabels];
}

- (void)configureLabels
{
    NSString *widthString;
    NSString *heightString;
    
    BOOL usesMetric = [[[NSLocale currentLocale]
                        objectForKey:NSLocaleUsesMetricSystem] boolValue];
    
    if (@available(iOS 10.0, *)) {
        NSMeasurementFormatter *formatter =
        [[NSMeasurementFormatter alloc] init];
        
        formatter.unitOptions = NSMeasurementFormatterUnitOptionsProvidedUnit;
        formatter.numberFormatter.maximumFractionDigits = 2;
        
        NSUnitLength *lengthUnitToDisplay =
        usesMetric ? NSUnitLength.millimeters : NSUnitLength.inches;
        
        widthString = [formatter stringFromMeasurement:
                       [self.view.irl_physicalWidth
                        measurementByConvertingToUnit:lengthUnitToDisplay]];
        
        heightString = [formatter stringFromMeasurement:
                        [self.view.irl_physicalHeight
                         measurementByConvertingToUnit:lengthUnitToDisplay]];
    }
    else {
        IRLRawMillimeters width = self.view.irl_rawPhysicalWidth;
        IRLRawMillimeters height = self.view.irl_rawPhysicalHeight;
        
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
