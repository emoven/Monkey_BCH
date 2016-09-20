//
//  BCHUserModel.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCHUserModel : NSObject

@property (nonatomic,copy) NSString *login;
@property (nonatomic,assign) NSInteger uid;
@property (nonatomic,copy) NSString *avatar_url;
@property (nonatomic,copy) NSString *gravatar_id;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *html_url;
@property (nonatomic,copy) NSString *followers_url;
@property (nonatomic,copy) NSString *following_url;
@property (nonatomic,copy) NSString *gists_url;
@property (nonatomic,copy) NSString *starred_url;
@property (nonatomic,copy) NSString *subscriptions_url;
@property (nonatomic,copy) NSString *organizations_url;
@property (nonatomic,copy) NSString *repos_url;
@property (nonatomic,copy) NSString *events_url;
@property (nonatomic,copy) NSString *received_events_url;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,assign) BOOL site_admin;
@property (nonatomic,assign) NSInteger score;

@property (nonatomic,assign) NSInteger rank;

@end
/*
 "login": "adad184",
 "id": 878260,
 "avatar_url": "https://avatars.githubusercontent.com/u/878260?v=3",
 "gravatar_id": "",
 "url": "https://api.github.com/users/adad184",
 "html_url": "https://github.com/adad184",
 "followers_url": "https://api.github.com/users/adad184/followers",
 "following_url": "https://api.github.com/users/adad184/following{/other_user}",
 "gists_url": "https://api.github.com/users/adad184/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/adad184/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/adad184/subscriptions",
 "organizations_url": "https://api.github.com/users/adad184/orgs",
 "repos_url": "https://api.github.com/users/adad184/repos",
 "events_url": "https://api.github.com/users/adad184/events{/privacy}",
 "received_events_url": "https://api.github.com/users/adad184/received_events",
 "type": "User",
 "site_admin": false,
 "score": 1
 */