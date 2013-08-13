//
//  ViewController.m
//  NaturalPomo
//
//  Created by Andrea Francia on 8/13/13.
//  Copyright (c) 2013 Andrea Francia. All rights reserved.
//

#import "ViewController.h"
#import "Timer.h"
@implementation NSSet(touches)
-(CGPoint) locationInView:(UIView*) view{
    UITouch *touch = [self anyObject];
    return [touch locationInView:view];
}
@end

@implementation ViewController  {
    Timer * timer;
    CGPoint gestureStartPoint;
}

-(NSTimeInterval)secondsSinceEpoch;
{
    return [[NSDate date]timeIntervalSince1970];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [Timer new];
    timer.clock = self;
    [self refresh];
	[NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(refresh)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)refresh
{
    self.display.text = timer.displayText;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [timer ungrab];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [timer ungrab];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    gestureStartPoint = [touches locationInView:self.view];
    [timer grab];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGFloat move = [self movementFromGestureStrartingPoint:touches];
    
    CGFloat portionOfTheScreenSwiped = move / 320.0;
    CGFloat secondsForAScreenWideSwipe = 20 * 60;
    CGFloat secondsSwiped = portionOfTheScreenSwiped * secondsForAScreenWideSwipe;
    
    [timer rotateBySeconds: secondsSwiped];
}

-(CGFloat) movementFromGestureStrartingPoint:(NSSet*) touches
{
    CGPoint currentPosition = [touches locationInView:self.view];
    return currentPosition.x - gestureStartPoint.x;
}

@end
