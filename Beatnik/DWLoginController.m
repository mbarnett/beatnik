//
//  DWLoginController.m
//  Beatnik
//
//  Created by Matthew Barnett on 11-07-23.
//  Copyright 2011 Matthew Barnett. All rights reserved.
//

#import "DWLoginController.h"

@implementation DWLoginController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)observePreferenceKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
}

- (void)awakeFromNib
{
    
}

// Handle changes
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{    
    if([[change valueForKey:@"new"] boolValue]) {
        NSLog(@"add to launch items");
        //        [self addToLaunchItems];
    } else {
        NSLog(@"Remove from launch items");
        //        [self removeFromLaunchItems];
    }
}

@end
