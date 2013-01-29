//
//  DWStatusBarController.h
//  Beatnik
//
//  Created by Matthew Barnett on 11-03-31.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DWStatusBarController : NSObject {
@private
    NSStatusItem *beatDisplay;
    NSCalendar *gregorian;
    
    IBOutlet NSMenu *beatMenu;   
}

@property (assign) IBOutlet NSMenu *beatMenu;

- (void)scheduleBeatDisplayUpdate;

@end
