//
//  NSFileManager+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSFileManager+BCHHelperKit.h"
#import "NSDictionary+BCHHelperKit.h"

@implementation NSFileManager (BCHHelperKit)

- (BOOL)bch_isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath
                                                                                    error:&error];
        if (error) {
            return YES;
        }
        
        if ([attributes isKindOfClass:[NSDictionary class]] && attributes) {
            NSString *createDate = [attributes objectForKey:@"NSFileModificationDate"];
            createDate = [NSString stringWithFormat:@"%@", createDate];
            if (createDate.length >= 19) {
                createDate = [createDate substringToIndex:19];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                
                NSDate *sinceDate = [formatter dateFromString:createDate];
                NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:sinceDate];
                BOOL isTimeOut = (long)interval > timeout;
                
                return isTimeOut;
            }
        }
    }
    
    return YES;
}

- (NSDictionary *)bch_fileAttributesAtPath:(NSString *)path {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:path
                                                                           error:&error];
    if (error) {
        return nil;
    }
    
    return attrs;
}

- (unsigned long long)bch_fileSizeAtPath:(NSString *)path {
    NSDictionary *attrs = [self bch_fileAttributesAtPath:path];
    
    if (attrs == nil) {
        return 0;
    }
    
    return [attrs bch_unsignedLongLongValue:NSFileSize];
}


@end
