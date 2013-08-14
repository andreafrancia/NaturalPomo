#import <SenTestingKit/SenTestingKit.h>
#import "Timer.h"

@interface AnHalfDischargedTimerTests : SenTestCase<Clock>
@property NSTimeInterval secondsSinceEpoch;
@end
@implementation AnHalfDischargedTimerTests {
    Timer * timer;
}

- (void) setUp;
{
    [super setUp];
    self.secondsSinceEpoch = 0.0;
    
    timer = [Timer new];
    timer.clock = self;
    
    [timer grab];
    [timer rotateBySeconds:10*60];
    [timer ungrab];
    self.secondsSinceEpoch = 5 * 60;
    STAssertEqualObjects(@"05:00", timer.displayText, nil);
}

- (void) test_can_be_charged_again
{
    [timer grab];
    [timer rotateBySeconds:60];
    STAssertEqualObjects(@"06:00", timer.displayText, nil);
    [timer ungrab];
    
    self.secondsSinceEpoch += 1;
    STAssertEqualObjects(@"05:59", timer.displayText, nil);
}

@end