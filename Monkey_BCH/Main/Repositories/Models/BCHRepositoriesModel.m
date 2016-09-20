//
//  BCHRepositoriesModel.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHRepositoriesModel.h"

@implementation BCHRepositoriesModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
                 @"rid" : @[@"id"],
                 @"desc" : @[@"description"],
                 @"private_" : @[@"private"]
             };
}
@end
