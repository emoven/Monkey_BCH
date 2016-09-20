//
//  BCHPedometerManager.h
//  BCHPedometer
//
//  Created by 白成慧&瑞瑞 on 16/7/16.
//  Copyright © 2016年 bch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCHPedometerData.h"

typedef void (^BCHPedometerHandler)(BCHPedometerData *pedometerData,
                                   NSError *error);

@interface BCHPedometerManager : NSObject

kSingleton_interface(BCHPedometerManager);

/**
 *  计步器是否可以使用
 *
 *  @return YES or NO
 */
+ (BOOL)isStepCountingAvailable;
/**
 *  查询某时间段的行走数据
 *
 *  @param start   开始时间
 *  @param end     结束时间
 *  @param handler 查询结果
 */
- (void)queryPedometerDataFromDate:(NSDate *)start
                            toDate:(NSDate *)end
                       withHandler:(BCHPedometerHandler)handler;
/**
 *  监听今天（从零点开始）的行走数据
 *
 *  @param handler 查询结果、变化就更新
 */
- (void)startPedometerUpdatesTodayWithHandler:(BCHPedometerHandler)handler;
/**
 *  停止监听运动数据
 */
- (void)stopPedometerUpdates;

@end
