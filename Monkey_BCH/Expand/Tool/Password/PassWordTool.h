//
//  PassWordTool.h
//
//  Created by CY on 16/1/9.
//

#import <Foundation/Foundation.h>

@interface PassWordTool : NSObject

+(void)savePassWord:(NSString *)password;
+(id)readPassWord;
+(void)deletePassWord;

@end
