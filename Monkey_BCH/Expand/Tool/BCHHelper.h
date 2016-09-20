//
//  BCHHelper.h
//  TYHomeland
//
//  Created by yiliao on 16/7/29.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCHHelper : NSObject

/**
 * 检查系统"照片"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkPhotoLibraryAuthorizationStatus;

/**
 * 检查系统"相机"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkCameraAuthorizationStatus;

+ (NSString*)getTimestampToString;

@end
