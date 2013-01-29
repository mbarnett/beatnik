//
//  BeatnikAppDelegate.h
//  Beatnik
//
//  Created by Matthew Barnett on 11-03-31.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DWStatusBarController.h"
#import "DWLoginController.h"

@interface BeatnikAppDelegate : NSObject <NSApplicationDelegate> {
    DWStatusBarController *statusBarController;
    DWLoginController *loginController;
}
@property (assign) IBOutlet DWStatusBarController *statusBarController;
@property (assign) IBOutlet DWLoginController *loginController;

@end
