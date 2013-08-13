//
//  Timer.h
//  NaturalPomo
//
//  Created by Andrea Francia on 8/13/13.
//  Copyright (c) 2013 Andrea Francia. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Clock
-(NSTimeInterval)secondsSinceEpoch;
@end

@interface Timer : NSObject
@property id<Clock> clock;
-(NSString*) displayText;
-(void) grab;
-(void) ungrab;
-(void) rotateBySeconds:(NSInteger)seconds;
@end
