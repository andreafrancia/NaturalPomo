#import <SenTestingKit/SenTestingKit.h>
#import "Timer.h"

@interface AChargedReleasedTimerTests : SenTestCase<Clock>
@property NSTimeInterval secondsSinceEpoch;
@end
@implementation AChargedReleasedTimerTests {
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
}

- (void) test_should_discharge
{
    self.secondsSinceEpoch = 1.0;
    STAssertEqualObjects(@"09:59", timer.displayText, nil);
}

- (void) test_should_discharge_completely
{
    self.secondsSinceEpoch = 10 * 60;
    STAssertEqualObjects(@"00:00", timer.displayText, nil);
}

- (void) test_should_stop_discharge_completely
{
    self.secondsSinceEpoch = 10 * 60 + 1;
    STAssertEqualObjects(@"00:00", timer.displayText, nil);
}
@end
