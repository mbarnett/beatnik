//
//  DWEBeat.m
//  Beatnik
//
//  Created by Matthew Barnett on 11-03-31.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//

#import "DWBeat.h"
#import "Math.h"

static const double kSecondsInBeat= 86.4;

@implementation DWBeat

+ (id)beatFromTimeInterval:(NSTimeInterval)interval usingExtendedPrecision:(BOOL)shouldUseExtendedPrecision
{
    DWBeat *newInstance = [[DWBeat alloc] initWithTimeInterval:interval usingExtendedPrecision:shouldUseExtendedPrecision];
        
    return [newInstance autorelease];
}

- (id)init 
{
    return [self initWithTimeInterval:0 usingExtendedPrecision:NO];
}

- (id)initWithTimeInterval:(NSTimeInterval)interval usingExtendedPrecision:(BOOL)shouldUseExtendedPrecision
{
    self = [super init];
    if (self) {
        beats = interval/kSecondsInBeat;
        useExtendedPrecision = shouldUseExtendedPrecision;
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)description
{
    if(useExtendedPrecision) {
        return [NSString stringWithFormat:@"@%06.2f", beats];
    } else {
        return [NSString stringWithFormat:@"@%03d", (int)floor(beats)];
    }
}

@end
