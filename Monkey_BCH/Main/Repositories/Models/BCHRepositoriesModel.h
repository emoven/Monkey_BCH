//
//  BCHRepositoriesModel.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BCHUserModel;

@interface BCHRepositoriesModel : NSObject

@property (nonatomic,copy) NSString *keys_url;
@property (nonatomic,copy) NSString *statuses_url;
@property (nonatomic,copy) NSString *issues_url;
@property (nonatomic,assign) BOOL has_pages;
@property (nonatomic,copy) NSString *issue_events_url;
@property (nonatomic,assign) NSInteger score;
@property (nonatomic,assign) NSInteger rid;

@property (nonatomic,strong) BCHUserModel *owner;

@property (nonatomic,copy) NSString *events_url;
@property (nonatomic,copy) NSString *subscription_url;
@property (nonatomic,assign) NSInteger watchers;
@property (nonatomic,copy) NSString *git_commits_url;
@property (nonatomic,copy) NSString *subscribers_url;
@property (nonatomic,copy) NSString *clone_url;
@property (nonatomic,assign) BOOL has_wiki;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *pulls_url;
@property (nonatomic,assign) BOOL fork;
@property (nonatomic,copy) NSString *notifications_url;
@property (nonatomic,copy) NSString *desc;//description
@property (nonatomic,copy) NSString *collaborators_url;
@property (nonatomic,copy) NSString *deployments_url;
@property (nonatomic,copy) NSString *languages_url;
@property (nonatomic,assign) BOOL has_issues;
@property (nonatomic,copy) NSString *comments_url;
@property (nonatomic,assign) BOOL private_;//private
@property (nonatomic,assign) NSInteger size;
@property (nonatomic,copy) NSString *git_tags_url;
@property (nonatomic,copy) NSString *updated_at;
@property (nonatomic,copy) NSString *ssh_url;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *contents_url;
@property (nonatomic,copy) NSString *archive_url;
@property (nonatomic,copy) NSString *milestones_url;
@property (nonatomic,copy) NSString *blobs_url;
@property (nonatomic,copy) NSString *contributors_url;
@property (nonatomic,assign) NSInteger open_issues_count;
@property (nonatomic,assign) NSInteger forks_count;
@property (nonatomic,copy) NSString *trees_url;
@property (nonatomic,copy) NSString *svn_url;
@property (nonatomic,copy) NSString *commits_url;
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSString *forks_url;
@property (nonatomic,assign) BOOL has_downloads;
@property (nonatomic,copy) id mirror_url;
@property (nonatomic,copy) NSString *homepage;
@property (nonatomic,copy) NSString *teams_url;
@property (nonatomic,copy) NSString *branches_url;
@property (nonatomic,copy) NSString *issue_comment_url;
@property (nonatomic,copy) NSString *merges_url;
@property (nonatomic,copy) NSString *git_refs_url;
@property (nonatomic,copy) NSString *git_url;
@property (nonatomic,assign) NSInteger forks;
@property (nonatomic,assign) NSInteger open_issues;
@property (nonatomic,copy) NSString *hooks_url;
@property (nonatomic,copy) NSString *html_url;
@property (nonatomic,copy) NSString *stargazers_url;
@property (nonatomic,copy) NSString *assignees_url;
@property (nonatomic,copy) NSString *compare_url;
@property (nonatomic,copy) NSString *full_name;
@property (nonatomic,copy) NSString *tags_url;
@property (nonatomic,copy) NSString *releases_url;
@property (nonatomic,copy) NSString *pushed_at;
@property (nonatomic,copy) NSString *labels_url;
@property (nonatomic,copy) NSString *downloads_url;
@property (nonatomic,copy) NSString *default_branch;
@property (nonatomic,assign) NSInteger stargazers_count;
@property (nonatomic,assign) NSInteger watchers_count;
@property (nonatomic,copy) NSString *language;


@property (nonatomic,assign) NSInteger rank;

@end
/*
 {
 "keys_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/keys{\/key_id}",
 "statuses_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/statuses\/{sha}",
 "issues_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/issues{\/number}",
 "default_branch" : "master",
 "issue_events_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/issues\/events{\/number}",
 "score" : 1,
 "id" : 23082332,
 "owner" : {
 "id" : 6911160,
 "organizations_url" : "https:\/\/api.github.com\/users\/slackhq\/orgs",
 "received_events_url" : "https:\/\/api.github.com\/users\/slackhq\/received_events",
 "following_url" : "https:\/\/api.github.com\/users\/slackhq\/following{\/other_user}",
 "login" : "slackhq",
 "avatar_url" : "https:\/\/avatars.githubusercontent.com\/u\/6911160?v=3",
 "url" : "https:\/\/api.github.com\/users\/slackhq",
 "subscriptions_url" : "https:\/\/api.github.com\/users\/slackhq\/subscriptions",
 "type" : "Organization",
 "repos_url" : "https:\/\/api.github.com\/users\/slackhq\/repos",
 "html_url" : "https:\/\/github.com\/slackhq",
 "events_url" : "https:\/\/api.github.com\/users\/slackhq\/events{\/privacy}",
 "site_admin" : false,
 "starred_url" : "https:\/\/api.github.com\/users\/slackhq\/starred{\/owner}{\/repo}",
 "gists_url" : "https:\/\/api.github.com\/users\/slackhq\/gists{\/gist_id}",
 "gravatar_id" : "",
 "followers_url" : "https:\/\/api.github.com\/users\/slackhq\/followers"
 },
 "events_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/events",
 "subscription_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/subscription",
 "watchers" : 6863,
 "git_commits_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/git\/commits{\/sha}",
 "subscribers_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/subscribers",
 "clone_url" : "https:\/\/github.com\/slackhq\/SlackTextViewController.git",
 "has_wiki" : true,
 "url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController",
 "pulls_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/pulls{\/number}",
 "fork" : false,
 "notifications_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/notifications{?since,all,participating}",
 "description" : "A drop-in UIViewController subclass with a growing text input view and other useful messaging features",
 "collaborators_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/collaborators{\/collaborator}",
 "deployments_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/deployments",
 "languages_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/languages",
 "has_issues" : true,
 "comments_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/comments{\/number}",
 "private" : false,
 "size" : 19596,
 "git_tags_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/git\/tags{\/sha}",
 "updated_at" : "2016-09-20T07:48:12Z",
 "ssh_url" : "git@github.com:slackhq\/SlackTextViewController.git",
 "name" : "SlackTextViewController",
 "contents_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/contents\/{+path}",
 "archive_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/{archive_format}{\/ref}",
 "milestones_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/milestones{\/number}",
 "blobs_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/git\/blobs{\/sha}",
 "contributors_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/contributors",
 "open_issues_count" : 33,
 "forks_count" : 779,
 "trees_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/git\/trees{\/sha}",
 "svn_url" : "https:\/\/github.com\/slackhq\/SlackTextViewController",
 "commits_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/commits{\/sha}",
 "created_at" : "2014-08-18T18:46:06Z",
 "forks_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/forks",
 "has_downloads" : true,
 "mirror_url" : null,
 "homepage" : "http:\/\/www.slack.com",
 "teams_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/teams",
 "branches_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/branches{\/branch}",
 "issue_comment_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/issues\/comments{\/number}",
 "merges_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/merges",
 "git_refs_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/git\/refs{\/sha}",
 "git_url" : "git:\/\/github.com\/slackhq\/SlackTextViewController.git",
 "forks" : 779,
 "open_issues" : 33,
 "hooks_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/hooks",
 "html_url" : "https:\/\/github.com\/slackhq\/SlackTextViewController",
 "stargazers_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/stargazers",
 "assignees_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/assignees{\/user}",
 "compare_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/compare\/{base}...{head}",
 "full_name" : "slackhq\/SlackTextViewController",
 "tags_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/tags",
 "releases_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/releases{\/id}",
 "pushed_at" : "2016-09-19T22:26:56Z",
 "labels_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/labels{\/name}",
 "downloads_url" : "https:\/\/api.github.com\/repos\/slackhq\/SlackTextViewController\/downloads",
 "stargazers_count" : 6863,
 "watchers_count" : 6863,
 "language" : "Objective-C",
 "has_pages" : false
 }
 */