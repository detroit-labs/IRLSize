//
//  IRLViewController.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//


#import "IRLViewController.h"

#import <IRLSize/UIView+IRLSize.h>


@interface IRLViewController ()

@property (assign) BOOL didTransformRuler;

@property (weak, nonatomic) UIImageView *rulerImageView;

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
    
    UIImageView *rulerImageView =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ruler"]];
    
    self.didTransformRuler = NO;
    
    rulerImageView.layer.anchorPoint = CGPointZero;
    
    // There are no constraints on the image view, so we use good ol’ autoresizing
    // masks to pin it to the top-left corner.
    rulerImageView.autoresizingMask = (UIViewAutoresizingFlexibleRightMargin |
                                       UIViewAutoresizingFlexibleBottomMargin);
    
    [self.view addSubview:rulerImageView];
    
    self.rulerImageView = rulerImageView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureLabels];
    [self configureImageView];
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size
          withTransitionCoordinator:coordinator];
    
    self.rulerImageView.transform = CGAffineTransformIdentity;
    self.didTransformRuler = NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self configureLabels];
    [self configureImageView];
}

- (void)configureImageView
{
    if (!self.didTransformRuler) {
        CGRect frame = self.rulerImageView.frame;
        frame.origin = CGPointZero;
        frame.size = self.rulerImageView.image.size;
        self.rulerImageView.frame = frame;
        
        NSMeasurement<NSUnitLength *> *expectedWidth =
        [[NSMeasurement alloc] initWithDoubleValue:30.5
                                              unit:[NSUnitLength centimeters]];
        
        self.rulerImageView.transform =
        [self.rulerImageView irl_transformForPhysicalWidth:expectedWidth];
        
        self.didTransformRuler = YES;
    }
}

- (void)configureLabels
{
    NSMeasurementFormatter *formatter = [[NSMeasurementFormatter alloc] init];
    
    formatter.unitOptions = NSMeasurementFormatterUnitOptionsProvidedUnit;
    
    self.widthLabel.text = [formatter stringFromMeasurement:
                            [[self.view irl_physicalWidth]
                             measurementByConvertingToUnit:
                             [NSUnitLength centimeters]]];

    self.heightLabel.text = [formatter stringFromMeasurement:
                             [[self.view irl_physicalHeight]
                             measurementByConvertingToUnit:
                              [NSUnitLength centimeters]]];
}

@end
