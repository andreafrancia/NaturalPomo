//
//  Timer.m
//  NaturalPomo
//
//  Created by Andrea Francia on 8/13/13.
//  Copyright (c) 2013 Andrea Francia. All rights reserved.
//

#import "Timer.h"

@implementation Timer {
    NSInteger initialCharge;
    NSInteger charge;
    NSInteger chargeAtRelease;
    NSTimeInterval releaseDate;
    BOOL grabbed;
}
-(NSString*) displayText;
{
    if (!grabbed) {
        charge = chargeAtRelease - ([self.clock secondsSinceEpoch] - releaseDate);
        charge = MAX(0, charge);
    }

    NSInteger seconds = charge % 60;
    NSInteger minutes = charge / 60;
    return [NSString stringWithFormat:@"%02ld:%02ld", (long) minutes, (long) seconds];
}

-(void) grab;
{
    initialCharge = charge;
    grabbed = YES;
}

-(void) ungrab;
{
    releaseDate = [self.clock secondsSinceEpoch];
    chargeAtRelease = charge;
    grabbed = NO;
}

-(void) rotateBySeconds:(NSInteger)seconds;
{
    charge = initialCharge + seconds;
    charge = MAX(0, charge);
}

@end
