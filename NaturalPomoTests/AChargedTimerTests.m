#import <SenTestingKit/SenTestingKit.h>
#import "Timer.h"

@interface AChargedStillGrabbedTimerTests : SenTestCase<Clock>
@property NSTimeInterval secondsSinceEpoch;
@end
@implementation AChargedStillGrabbedTimerTests {
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
}

- (void)test_show_the_charged_time
{
    STAssertEqualObjects(@"10:00", timer.displayText, nil);    
}

- (void)test_it_can_be_charged_more
{
    [timer grab];
    [timer rotateBySeconds:10*60];
    
    STAssertEqualObjects(@"20:00", timer.displayText, nil);
}

- (void)test_till_is_grabbed_wont_discharge
{
    self.secondsSinceEpoch = 1.0;
    STAssertEqualObjects(@"10:00", timer.displayText, nil);
}

- (void)test_can_be_discharged
{
    [timer grab];
    [timer rotateBySeconds:-10*60];

    STAssertEqualObjects(@"00:00", timer.displayText, nil);
}

- (void)test_can_be_discharged_more_than_zero
{
    [timer grab];
    [timer rotateBySeconds:-10*60 -1];
    
    STAssertEqualObjects(@"00:00", timer.displayText, nil);
}

@end


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