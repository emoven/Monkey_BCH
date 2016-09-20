//
//  NSTimer+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSTimer+BCHHelperKit.h"

@implementation NSTimer (BCHHelperKit)


+ (NSTimer *)bch_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          count:(NSInteger)count
                                       callback:(BCHTimerCallback)callback {
    if (count <= 0) {
        return [self bch_scheduledTimerWithTimeInterval:interval
                                                repeats:YES
                                               callback:callback];
    }
    
    NSDictionary *userInfo = @{@"callback"     : callback,
                               @"count"        : @(count)};
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(bch_onTimerUpdateCountBlock:)
                                          userInfo:userInfo
                                           repeats:YES];
}

+ (NSTimer *)bch_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        repeats:(BOOL)repeats
                                       callback:(BCHTimerCallback)callback {
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(bch_onTimerUpdateBlock:)
                                          userInfo:callback
                                           repeats:repeats];
}

- (void)bch_fireTimer {
    [self setFireDate:[NSDate distantPast]];
}

- (void)bch_unfireTimer {
    [self setFireDate:[NSDate distantFuture]];
}

- (void)bch_invalidate {
    if ([self.userInfo isKindOfClass:[NSDictionary class]]) {
        [self.userInfo removeObjectForKey:@"callback"];
        [self.userInfo removeObjectForKey:@"count"];
    }
    
    if (self.isValid) {
        [self invalidate];
    }
}

#pragma mark - Private
+ (void)bch_onTimerUpdateBlock:(NSTimer *)timer {
    BCHTimerCallback block = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

+ (void)bch_onTimerUpdateCountBlock:(NSTimer *)timer {
    static NSUInteger currentCount = 0;
    
    NSDictionary *userInfo = timer.userInfo;
    BCHTimerCallback callback = userInfo[@"callback"];
    NSNumber *count = userInfo[@"count"];
    
    if (currentCount < count.integerValue) {
        currentCount++;
        
        if (callback) {
            callback(timer);
        }
    } else {
        currentCount = 0;
        [timer bch_unfireTimer];
        [timer bch_invalidate];
    }
}

@end
