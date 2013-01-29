//
//  DWStatusBarController.m
//  Beatnik
//
//  Created by Matthew Barnett on 11-03-31.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//


// TODO
// login item

#import "DWStatusBarController.h"
#import "DWBeat.h"
#import "Constants.h"

// 0.432 seconds is roughly one half of 100th of a beat
// chosen mostly for smoothness of updates when displaying extended precision
static const NSTimeInterval kUpdateFrequency = 0.432;

@implementation DWStatusBarController

@synthesize beatMenu;

- (id)init
{
    self = [super init];
    if (self) {
        gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        [gregorian setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    }
    
    return self;
}

- (void)dealloc
{
    [beatDisplay release];
    [gregorian release];
    
    [super dealloc];
}

- (void)updateBeatDisplay
{
    NSDate *now = [NSDate date];
    NSDateComponents *components = [gregorian components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:now];
    NSDate *midnight = [gregorian dateFromComponents:components];
    
    BOOL shouldUseExtendedPrecision = [[NSUserDefaults standardUserDefaults] boolForKey:kExtendedPrecisionPrefKey];
    DWBeat *beats = [DWBeat beatFromTimeInterval:[now timeIntervalSinceDate:midnight] usingExtendedPrecision:shouldUseExtendedPrecision];
    
    [beatDisplay setTitle: [beats description]];
}

- (void)scheduleBeatDisplayUpdate
{    
    NSTimer *timer = [NSTimer timerWithTimeInterval:kUpdateFrequency target:self selector:@selector(updateBeatDisplay) userInfo:nil repeats:YES];

    // we use NSRunLoopCommonModes instead of NSDefaultRunLoopMode
    // so that the beats update even when the user is holding the menu open
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)awakeFromNib
{    
    // Create Beat display in the menu bar status area
    beatDisplay = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    [beatDisplay setMenu:beatMenu];
    [beatDisplay setHighlightMode:YES];
       
    // Display initial beat count
    [self updateBeatDisplay];
}

@end
