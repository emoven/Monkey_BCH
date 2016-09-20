//
//  NSString+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BCHHelperKit)

-(NSString *)bch_toMD5;
-(NSString *)bch_to16MD5;

-(NSString *)bch_sha1;
-(NSString *)bch_sha256;
-(NSString *)bch_sha512;

-(NSData *)bch_toData;

+(NSString *)bch_toStringWithData:(NSData *)data;

-(BOOL)bch_isEmail;
+(BOOL)bch_isEmail:(NSString *)email;

-(BOOL)bch_isMobilePhone;
+(BOOL)bch_isMobilePhone:(NSString *)mobilePhone;

-(BOOL)bch_isTelNumber;
+(BOOL)bch_isTelNumber:(NSString *)telNumber;

-(BOOL)bch_isPersonID;
+(BOOL)bch_isPersonID:(NSString *)pID;

-(NSString *)bch_trimLeft;
-(NSString *)bch_trimRight;
-(NSString *)bch_trim;
-(NSString *)bch_trimAll;
-(NSString *)bch_trimLetters;
-(NSString *)bch_trimCharacter:(unichar)character;
-(NSString *)bch_trimWhiteSpaceAndNewLine;

- (BOOL)bch_isOnlyLetters;
- (BOOL)bch_isOnlyDigits;
- (BOOL)bch_isOnlyAlphaNumeric;

- (NSURL *)bch_toURL;

- (NSString *)bch_URLEncode;
- (NSString *)bch_filterHtml;
+ (NSString *)bch_filterHTML:(NSString *)html;
+ (NSString *)bch_documentPath;
+ (NSString *)bch_tmpPath;
+ (NSString *)bch_cachePath;

+ (NSString *)bch_checkString:(NSString *)string;

- (BOOL)bch_isContainString:(NSString *)substring;

- (CGSize)bch_getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

+ (NSString *)bch_getWeekCountWithNum:(NSString *)numString;

@end
