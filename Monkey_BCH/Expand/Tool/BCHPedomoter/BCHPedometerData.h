//
//  BCHPedometerData.h
//  BCHPedometer
//
//  Created by 白成慧&瑞瑞 on 16/7/16.
//  Copyright © 2016年 bch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCHPedometerData : NSObject

/**
 *  步数
 */
@property(nonatomic, strong, nullable) NSNumber *numberOfSteps;

/**
 *  步行+跑步距离
 */
@property(nonatomic, strong, nullable) NSNumber *distance;

/*
 * 上楼
 */
@property(nonatomic, strong, nullable) NSNumber *floorsAscended;

/*
 * 下楼
 */
@property(nonatomic, strong, nullable) NSNumber *floorsDescended;


/*
 * 开始时间
 */
@property(nonatomic, strong, nullable) NSDate *startDate;


/*
 * 结束时间
 */
@property(nonatomic, strong, nullable) NSDate *endDate;

@end
