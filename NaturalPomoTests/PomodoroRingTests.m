#import <SenTestingKit/SenTestingKit.h>
#import "Timer.h"

@interface PomodoroRingTests : SenTestCase<Clock, Speaker>
@property NSTimeInterval secondsSinceEpoch;
@end
@implementation PomodoroRingTests {
    Timer * timer;
    NSInteger ring_calls;
}

- (void) setUp;
{
    [super setUp];
    self.secondsSinceEpoch = 0.0;
    
    timer = [Timer new];
    timer.clock = self;
    timer.speaker = self;

    [timer grab];
    [timer rotateBySeconds:10*60];
    [timer ungrab];
    STAssertEqualObjects(@"10:00", timer.displayText, nil);
    STAssertEquals(0, ring_calls, nil);
}

- (void) test_should_ring_when_reaches_zero
{
    self.secondsSinceEpoch = 10 * 60; [timer tick];
    STAssertEquals(1, ring_calls, nil);
}

- (void) test_should_ring_only_one_time
{
    self.secondsSinceEpoch = 10 * 60; [timer tick];
    self.secondsSinceEpoch = 10 * 60 + 1; [timer tick];
    STAssertEquals(1, ring_calls, nil);
}

- (void) test_should_ring_even_when_discharged_manually
{
    [timer grab];
    [timer rotateBySeconds:-10*60];
    STAssertEquals(1, ring_calls, nil);
}

- (void) ring;
{
    ring_calls+=1;
}
@end
