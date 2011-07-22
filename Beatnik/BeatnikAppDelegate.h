//
//  BeatnikAppDelegate.h
//  Beatnik
//
//  Created by Matthew Barnett on 11-07-21.
//  Copyright 2011 Duskwerks. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BeatnikAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
