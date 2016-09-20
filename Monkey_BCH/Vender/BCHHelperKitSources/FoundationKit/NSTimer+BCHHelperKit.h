//
//  NSTimer+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BCHTimerCallback)(NSTimer *timer);

@interface NSTimer (BCHHelperKit)

+ (NSTimer *)bch_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        repeats:(BOOL)repeats
                                       callback:(BCHTimerCallback)callback;

+ (NSTimer *)bch_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          count:(NSInteger)count
                                       callback:(BCHTimerCallback)callback;

- (void)bch_fireTimer;

- (void)bch_unfireTimer;

- (void)bch_invalidate;

@end
