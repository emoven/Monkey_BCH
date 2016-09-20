//
//  BCHUserModel.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHUserModel.h"

@implementation BCHUserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid" : @[@"id"]};
}
@end
