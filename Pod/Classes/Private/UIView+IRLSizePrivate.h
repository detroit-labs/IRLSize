//
//  UIView+IRLSizePrivate.h
//  IRLSize
//
//  Created by Jeff Kelley on 7/6/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IRLSizePrivate)

@property (nonatomic, readonly, getter=irl_isOnMainScreen) BOOL isOnMainScreen;

@property (nonatomic, readonly, getter=irl_isOnSecondaryScreen) BOOL isOnSecondaryScreen;

@end
