//
//  BCHLanguageViewController.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBaseViewController.h"

typedef NS_ENUM(NSInteger, LanguageType) {
    LanguageTypeUsers = 0,
    LanguageTypeRepositories,
    LanguageTypeTrending,
};

@interface BCHLanguageViewController : BCHBaseViewController

@property (nonatomic,assign) LanguageType languageType;

@end
