//
//  DWEBeat.h
//  Beatnik
//
//  Created by Matthew Barnett on 11-03-31.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DWBeat : NSObject {
@private
    double beats;
    BOOL useExtendedPrecision;
}
+ (id)beatFromTimeInterval:(NSTimeInterval)interval usingExtendedPrecision:(BOOL)shouldUseExtendedPrecision;
- (id)initWithTimeInterval:(NSTimeInterval)interval usingExtendedPrecision:(BOOL)shouldUseExtendedPrecision;


@end
