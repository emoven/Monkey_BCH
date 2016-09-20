//
//  NSFileManager+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (BCHHelperKit)

- (BOOL)bch_isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout;


- (NSDictionary *)bch_fileAttributesAtPath:(NSString *)path;


- (unsigned long long)bch_fileSizeAtPath:(NSString *)path;

@end
