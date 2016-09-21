//
//  BCHUserModel.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BCHPlanModel;
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
@property (nonatomic,assign) NSInteger public_gists;
@property (nonatomic,copy) NSString *company;
@property (nonatomic,copy) NSString *blog;
@property (nonatomic,assign) NSInteger collaborators;
@property (nonatomic,copy) NSString *location;
@property (nonatomic,copy) NSString *hireable;
@property (nonatomic,assign) NSInteger following;
@property (nonatomic,assign) NSInteger total_private_repos;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,assign) NSInteger owned_private_repos;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger private_gists;
@property (nonatomic,copy) NSString *bio;
@property (nonatomic,assign) NSInteger followers;
@property (nonatomic,assign) NSInteger disk_usage;
@property (nonatomic,copy) NSString *updated_at;
@property (nonatomic,assign) NSInteger public_repos;
@property (nonatomic,strong) BCHPlanModel *plan;

@property (nonatomic,assign) NSInteger rank;

@end

@interface BCHPlanModel : NSObject

@property (nonatomic,assign) NSInteger private_repos;
@property (nonatomic,assign) NSInteger collaborators;
@property (nonatomic,assign) NSInteger space;
@property (nonatomic,copy) NSString *name;

@end
/*
 
 "public_gists" : 0,
 "company" : null,
 "blog" : null,
 "collaborators" : 0,
 "location" : "ShangHai",
 "hireable" : null,
 "following" : 10,
 "total_private_repos" : 0,
 "email" : "baichenghui88888@gmail.com",
 "owned_private_repos" : 0,
 "name" : "Coder_Bai",
 "private_gists" : 0,
 "plan" : {
     "private_repos" : 0,
     "collaborators" : 0,
     "space" : 976562499,
     "name" : "free"
 },
 "bio" : "iOS developer",
 "followers" : 5,
 "disk_usage" : 2136,
 "updated_at" : "2016-09-21T00:36:25Z",
 "public_repos" : 4,
 
 
 
 
 
 
 
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