//
//  NSObject+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSObject+BCHHelperKit.h"

@implementation NSObject (BCHHelperKit)


- (NSString *)bch_className {
    return NSStringFromClass([self class]);
}

- (NSMutableData *)bch_toJsonData {
    return [NSObject bch_toJsonDataWithObject:self];
}

- (NSString *)bch_toJsonString {
    return [NSObject bch_toJsonStringWithObject:self];
}

+ (NSMutableData *)bch_toJsonDataWithObject:(id)object {
    NSMutableData *jsonData = nil;
    
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        if (error) {
            NSLog(@"error: %@", error.description);
        } else {
            jsonData = [[NSMutableData alloc] initWithData:data];
        }
    }
    
    return jsonData;
}

+ (NSString *)bch_toJsonStringWithObject:(id)object {
    NSMutableData *data = [self bch_toJsonDataWithObject:object];
    
    if (data.length) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (id)bch_filterNullNil {
    return [NSObject bch_filterNullNilFromObject:self];
}

+ (id)bch_filterNullNilFromObject:(id)object {
    if ([object isKindOfClass:[NSDictionary class]]) {
        return [self _removeNullNilFromDict:(NSDictionary *)object];
    } else if ([object isKindOfClass:[NSArray class]]) {
        return [self _removeNullFromArray:(NSArray *)object];
    } else if ([object isKindOfClass:[NSSet class]]) {
        return [self _removeNullFromSet:(NSSet *)object];
    } else if ([object isKindOfClass:[NSNull class]] || object == nil) {
        return nil;
    }
    
    return object;
}

#pragma mark - Private
+ (NSDictionary *)_removeNullNilFromDict:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithCapacity:dict.count];
    for (id key in dict.allKeys) {
        id object = [dict objectForKey:key];
        
        if ([object isKindOfClass:[NSNull class]] || object == nil) {
            // 不添加
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            object = [self _removeNullNilFromDict:(NSDictionary *)object];
            
            if (object != nil) {
                [resultDict setObject:object forKey:key];
            }
        } else if ([object isKindOfClass:[NSArray class]]) {
            object = [self _removeNullFromArray:(NSArray *)object];
            
            if (object != nil) {
                [resultDict setObject:object forKey:key];
            }
        } else if ([object isKindOfClass:[NSSet class]]) {
            object = [self _removeNullFromSet:(NSSet *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultDict setObject:object forKey:key];
            }
        } else {
            [resultDict setObject:object forKey:key];
        }
    }
    
    return resultDict;
}

+ (NSArray *)_removeNullFromArray:(NSArray *)array {
    if (array == nil || [array isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    if (array.count == 0) {
        return array;
    }
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    for (NSUInteger i = 0; i < array.count; ++i) {
        id object = array[i];
        
        if ([object isKindOfClass:[NSNull class]] || object == nil) {
            // 不添加
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            object = [self _removeNullNilFromDict:(NSDictionary *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultArray addObject:object];
            }
        } else if ([object isKindOfClass:[NSArray class]]) {
            object = [self _removeNullFromArray:(NSArray *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultArray addObject:object];
            }
        } else if ([object isKindOfClass:[NSSet class]]) {
            object = [self _removeNullFromSet:(NSSet *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultArray addObject:object];
            }
        } else {
            [resultArray addObject:object];
        }
    }
    
    return resultArray;
}

+ (NSSet *)_removeNullFromSet:(NSSet *)set {
    if (set == nil || [set isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    if (set.count == 0) {
        return set;
    }
    
    NSMutableSet *resultSet = [[NSMutableSet alloc] initWithCapacity:set.count];
    
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id object = obj;
        
        if ([object isKindOfClass:[NSNull class]] || object == nil) {
            // 不添加
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            object = [self _removeNullNilFromDict:(NSDictionary *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultSet addObject:object];
            }
        } else if ([object isKindOfClass:[NSArray class]]) {
            object = [self _removeNullFromArray:(NSArray *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultSet addObject:object];
            }
        } else if ([object isKindOfClass:[NSSet class]]) {
            object = [self _removeNullFromSet:(NSSet *)object];
            
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultSet addObject:object];
            }
        } else {
            [resultSet addObject:object];
        }
    }];
    
    return resultSet;
}

@end
