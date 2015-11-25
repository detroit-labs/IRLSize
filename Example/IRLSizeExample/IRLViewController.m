//
//  IRLViewController.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//


#import "IRLViewController.h"

#import "UIView+IRLSize.h"


@interface IRLViewController ()

@property (assign) BOOL didTransformRuler;

@property (weak, nonatomic) IBOutlet UIImageView *rulerImageView;
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
    
    self.didTransformRuler = NO;
    
    self.rulerImageView.autoresizingMask =
    (UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleBottomMargin);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureLabels];
    [self configureImageView];
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
        self.rulerImageView.transform =
        [self.rulerImageView irl_transformForWidth:0.31];
        
        self.didTransformRuler = YES;
    }

    CGRect rulerFrame = self.rulerImageView.frame;
    rulerFrame.origin = CGPointMake(0.0f, self.topLayoutGuide.length);
    self.rulerImageView.frame = rulerFrame;
}

- (void)configureLabels
{
    NSLengthFormatter *formatter = [[NSLengthFormatter alloc] init];
    
    self.widthLabel.text = [formatter stringFromMeters:
                            [self.view irl_width]];

    self.heightLabel.text = [formatter stringFromMeters:
                             [self.view irl_height]];
}

@end
