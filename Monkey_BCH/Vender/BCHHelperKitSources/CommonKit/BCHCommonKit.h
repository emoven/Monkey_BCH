//
//  BCHCommonKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/15.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Masonry.h"

#pragma mark - 特定项目相关
#define  kBadgeTipStr @"badgeTip"

#pragma mark - 强弱引用相关
#define kWeakObject(object) __weak __typeof(object) weakObject = object;
#define kWeak(caller,object) __weak __typeof(object) caller = object;
#define kStrongObject(object) __strong __typeof(object) strongObject = object;
#define kStrong(caller,object) __strong __typeof(object) caller = object;

#pragma mark - 线程相关
#define kMainQueue  (dispatch_get_main_queue())
#define kGlobalQueue  (dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
#define k_dispatch_global_async(block) dispatch_async(kGlobalQueue,^{\
});
#define k_dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#pragma mark - 幅度/角度转换
#define kRadiansToDegrees(radians)  ((radians) * (180 / M_PI))
#define kDegreesToRadians(angle)  ((angle / 180) * M_PI)

#pragma mark - iOS系统版本相关
#define kiOSVersion ([UIDevice currentDevice].systemVersion.floatValue)
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
/** 是否为iOS6 */
#define iOS6_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? YES : NO)
/** 是否为iOS7 */
#define iOS7_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)
/** 是否为iOS8 */
#define iOS8_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)
/** 是否为iOS9 */
#define iOS9_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)

#pragma mark - kAppDelegate
#define kAppDelegate    [[UIApplication sharedApplication] delegate]

#pragma mark - kApp
#define kApp [UIApplication sharedApplication]

#pragma mark - kKeyWindow
#define kKeyWindow [UIApplication sharedApplication].keyWindow

#pragma mark - Device size
#define kScreenWidth    ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)
#define kScreenBounds   ([UIScreen mainScreen].bounds)
#define kMainScreenScale [UIScreen mainScreen].scale
#define kNavigationBarHeight   44
#define kLanguageBarHeight   40
#define kStatusBarHeight   20
#define ktabBarHeight   49
#define kPaddingLeftWidth 15.0

#pragma mark - color
#define kBlackColor       [UIColor blackColor]
#define kDarkGrayColor    [UIColor darkGrayColor]
#define kLightGrayColor   [UIColor lightGrayColor]
#define kWhiteColor       [UIColor whiteColor]
#define kRedColor         [UIColor redColor]
#define kBlueColor        [UIColor blueColor]
#define kGreenColor       [UIColor greenColor]
#define kCyanColor        [UIColor cyanColor]
#define kYellowColor      [UIColor yellowColor]
#define kMagentaColor     [UIColor magentaColor]
#define kOrangeColor      [UIColor orangeColor]
#define kPurpleColor      [UIColor purpleColor]
#define kBrownColor       [UIColor brownColor]
#define kClearColor       [UIColor clearColor]
#define kGroupTabBgColor  [UIColor groupTableViewBackgroundColor]
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define kGlobalColor kRGBColor(233, 233, 233)
#define kRandomColor    [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1]
#define kHexColor(hex)  [UIColor colorWithRed:((((hex) >> 16) & 0xFF) / 255.0f)\
green:((((hex) >> 8) & 0xFF) / 255.0f)\
blue:(((hex) & 0xFF) / 255.0f)\
alpha:1.0f]
#define kBlackOpaqueColor kHexColor(0, 0, 0, 0.5)
#define kColorTableSectionBg kHexColor(0xeeeeee)
#define kColorTableBG kHexColor(0xfafafa)
#define kColorNavBarBG kRGBColor(240,240,240)

#pragma mark - Load Font
#define kFontWithSize(size) [UIFont systemFontOfSize:size]
#define kBoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

#pragma mark - String 转 URL
#define kStringToURL(urlString) [NSURL URLWithString:urlString]

#pragma mark - Load Image
#define kImage(name)    [UIImage imageNamed:(name)]
#define kImageOfFile(name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:nil]])

#pragma mark - integer转字符串
#define kIntegerToString(num)  [NSString stringWithFormat:@"%ld",(num)]

#pragma mark - NSUserDefaults相关
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kUserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}
#define kUserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]
#define kUserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

#pragma mark - 通知
#define kNotificationCenter  [NSNotificationCenter defaultCenter]
#define kPostNotificationWithName(notificationName) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:nil]
#define kPostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]

#pragma mark - 文件相关
#define kFileManager [NSFileManager defaultManager]

#pragma mark - 判断
#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([[s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) || ([s isKindOfClass:[NSString class]] && s.length == 0))
#define kIsEmptyObject(obj) (obj == nil || [obj isKindOfClass:[NSNull class]])
#define kIsDictionary(objDict) (objDict != nil && [objDict isKindOfClass:[NSDictionary class]])
#define kIsArray(objArray) (objArray != nil && [objArray isKindOfClass:[NSArray class]])
#define kIsIPad \
([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]\
&& [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define Is_iOS7_Or_Later (((double)(DEVICE_IOS_VERSION) - 7.0) > - ((double)(DEVICE_IOS_VERSION) - 7.0) * DBL_EPSILON)
#define kIsLandscape (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define Is_3_5_inch (kScreenHeight == 480)
#define Is_4_0_inch (kScreenHeight == 568)
#define Is_4_7_inch (kScreenHeight == 667)
#define Is_5_5_inch (kScreenHeight == 736)
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - 屏幕适配相关
#define kScaleFrom_iPhone4s_Desgin(_X_) (_X_ * (kScreenWidth/320))
#define kScaleFrom_iPhone5_Desgin(_X_) (_X_ * (kScreenWidth/320))
#define kScaleFrom_iPhone5c_Desgin(_X_) (_X_ * (kScreenWidth/320))
#define kScaleFrom_iPhone5s_Desgin(_X_) (_X_ * (kScreenWidth/320))
#define kScaleFrom_iPhone6_Desgin(_X_) (_X_ * (kScreenWidth/375))
#define kScaleFrom_iPhone6P_Desgin(_X_) (_X_ * (kScreenWidth/414))
#define kScaleFrom_iPhone6s_Desgin(_X_) (_X_ * (kScreenWidth/375.0))
#define kScaleFrom_iPhone6sP_Desgin(_X_) (_X_ * (kScreenWidth/414.0))

#pragma mark - 获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#pragma mark - 单例化一个类
#define kSingleton_interface(classname) +(instancetype)shared##classname;
#define kSingleton_implementation(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#pragma mark - TipAlert
#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

#pragma mark - Blocks
typedef void(^BCHErrorBlock)(NSError *error);
typedef void(^BCHVoid)(void);
typedef void(^BCHStringBlock)(NSString  *result);
typedef void(^BCHNotificationBlock)(NSNotification  *notification);
typedef void(^BCHBOOLBlock)(BOOL result);
typedef void(^BCHArrayBlock)(NSArray *list);
typedef void(^BCHArrayMessageBlock)(NSArray *list,NSString *msg);
typedef void(^BCHDictionaryBlock)(NSDictionary *responseDict);
typedef void(^BCHDictionaryMessageBlock)(NSDictionary *responseDict,NSString *msg);
typedef void(^BCHNumberBlock)(NSNumber *resultNumber);
typedef void(^BCHNumberMessageBlock)(NSNumber *resultNumber,NSString *msg);
typedef void(^BCHIdBlock)(id result);
typedef void(^BCHButtonBlock)(UIButton *sender);
typedef void(^BCHValueChangedBlock)(id sender);
typedef void(^BCHEditChangedBlock)(id sender);
typedef void(^BCHButtonIndexBlock)(NSUInteger index,UIButton *sender);
typedef void(^BCHGestureBlock)(UIGestureRecognizer *sender);
typedef void(^BCHLongGestureBlock)(UILongPressGestureRecognizer *sender);
typedef void(^BCHTapGestureBlock)(UITapGestureRecognizer *sender);
typedef void(^BCHConstraintMaker)(MASConstraintMaker *make);

#pragma mark - Cell_Identifier
static NSString *kBCHCellIdentifier = @"BCHCommonCellIdentifier";

@interface BCHCommonKit : NSObject

@end
