//
//  XbeatsAppDelegate.m
//  Xbeats
//
//  Created by Matthew Barnett on 11-03-31.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//

#import "BeatnikAppDelegate.h"
#import "Constants.h"

@implementation BeatnikAppDelegate

@synthesize statusBarController;
@synthesize loginController;

+ (void)initialize
{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithBool:NO], kExtendedPrecisionPrefKey,
                          [NSNumber numberWithBool:NO], kStartAtLoginPrefKey,
                          nil];
    
    [preferences registerDefaults:dict];   
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    // Tell the login controller what pref key to monitor
    [loginController observePreferenceKey:kStartAtLoginPrefKey];
    
    // We're up and running, start the beat clock
    [statusBarController scheduleBeatDisplayUpdate];
}

@end
