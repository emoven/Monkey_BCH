//
//  BCHHelper.m
//  TYHomeland
//
//  Created by yiliao on 16/7/29.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHHelper.h"
#import <AssetsLibrary/AssetsLibrary.h>

@import AVFoundation;

@implementation BCHHelper

+ (BOOL)checkPhotoLibraryAuthorizationStatus
{
    if ([ALAssetsLibrary respondsToSelector:@selector(authorizationStatus)]) {
        ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
        if (ALAuthorizationStatusDenied == authStatus ||
            ALAuthorizationStatusRestricted == authStatus) {
            [self showSettingAlertStr:@"请在iPhone的“设置->隐私->照片”中打开本应用的访问权限"];
            return NO;
        }
    }
    return YES;
}

+ (BOOL)checkCameraAuthorizationStatus
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        kTipAlert(@"该设备不支持使用摄像头");
        
        return NO;
    }
    
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (AVAuthorizationStatusDenied == authStatus ||
            AVAuthorizationStatusRestricted == authStatus) {
            [self showSettingAlertStr:@"请在iPhone的“设置->隐私->相机”中打开本应用的访问权限"];
            return NO;
        }
    }
    
    return YES;
}

+ (void)showSettingAlertStr:(NSString *)tipStr{
    //iOS8+系统下可跳转到‘设置’页面，否则只弹出提示窗即可
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1) {
//        UIAlertView *alertView = [UIAlertView bk_alertViewWithTitle:@"提示" message:tipStr];
//        [alertView bk_setCancelButtonWithTitle:@"取消" handler:nil];
//        [alertView bk_addButtonWithTitle:@"设置" handler:nil];
//        [alertView bk_setDidDismissBlock:^(UIAlertView *alert, NSInteger index) {
//            if (index == 1) {
//                UIApplication *app = [UIApplication sharedApplication];
//                NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                if ([app canOpenURL:settingsURL]) {
//                    [app openURL:settingsURL];
//                }
//            }
//        }];
//        [alertView show];

        [UIAlertView bch_showWithTitle:@"提示" message:tipStr buttonTitles:@[@"设置",@"取消"] block:^(UIAlertView *alertView, NSUInteger buttonIndex) {
            if (buttonIndex == 1) {
                UIApplication *app = [UIApplication sharedApplication];
                NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([app canOpenURL:settingsURL]) {
                    [app openURL:settingsURL];
                }
            }

        }];
        
    }else{
        kTipAlert(@"%@", tipStr);
    }
}

+(NSString *)getTimestampToString{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    NSString *timestampStr = [NSString stringWithFormat:@"%0.2f", timeInterval];
    return timestampStr;
}

@end
