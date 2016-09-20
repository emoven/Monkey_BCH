//
//  UIDevice+BCHHelperKitUIKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (BCHHelperKitUIKit)

/** iPhone3,2 */
+(NSString *)bch_devicePlatform;
/** iPad Air (Cellular) */
+(NSString *)bch_devicePlatformString;

+(BOOL)bch_isiPad;
+(BOOL)bch_isiPhone;
+(BOOL)bch_isiPod;
+(BOOL)bch_isSimulator;
+(BOOL)bch_isRetina;
+(BOOL)bch_isRetinaHD;

/** Return the iOS version */
+(NSInteger)bch_iOSVersion;
/** Return the current device CPU frequency */
+(NSUInteger)bch_cpuFrequency;
/** Return the current device BUS frequency */
+(NSUInteger)bch_busFrequency;
/** Return the current device RAM size */
+(NSUInteger)bch_ramSize;
/** Return the current device CPU number */
+(NSUInteger)bch_cpuNumber;
/** Return the current device total memory */
+(NSUInteger)bch_totalMemory;
/** Return the current device non-kernel memory */
+(NSUInteger)bch_userMemory;

/** Return the current device total disk space */
+(NSNumber *)bch_totalDiskSpace;
/** Return the current device free disk space */
+(NSNumber *)bch_freeDiskSpace;

/** Return the current device MAC address */
+(NSString *)bch_macAddress;
/** Generate an unique identifier and store it into standardUserDefaults */
+(NSString *)bch_uniqueIdentifier;

@end
