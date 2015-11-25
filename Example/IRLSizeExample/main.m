//
//  main.m
//  IRLSize
//
//  Created by Jeff Kelley on 11/13/2014.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "IRLAppDelegate.h"


int main(int argc, char * argv[])
{
    int rc = EXIT_SUCCESS;
    
    @autoreleasepool {
        return UIApplicationMain(argc,
                                 argv,
                                 nil,
                                 NSStringFromClass([IRLAppDelegate class]));
    }
    
    return rc;
}
