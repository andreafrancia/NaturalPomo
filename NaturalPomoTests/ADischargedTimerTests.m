//
//  NaturalPomoTests.m
//  NaturalPomoTests
//
//  Created by Andrea Francia on 8/13/13.
//  Copyright (c) 2013 Andrea Francia. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Timer.h"

@interface ADischargedTimerTests : SenInterfaceTestCase
@end
@implementation ADischargedTimerTests {
    Timer * timer;
}

- (void)setUp
{
    [super setUp];
    timer = [Timer new];
}

- (void)test_it_starts_to_zero
{
    NSString * display = timer.displayText;
    STAssertEqualObjects(@"00:00", display, nil);
}

- (void)test_it_can_be_charged
{
    [timer grab];
    [timer rotateBySeconds:1];
    
    STAssertEqualObjects(@"00:01", timer.displayText, nil);
}

- (void)test_it_can_be_charged_even_more_than_one_minute
{
    [timer grab];
    [timer rotateBySeconds:2*60 + 13];
    
    STAssertEqualObjects(@"02:13", timer.displayText, nil);
}
@end

