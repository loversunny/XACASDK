//
//  JLCManager.m
//  XACASampleDemo
//
//  Created by wangxq on 2017/5/24.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import "JLCManager.h"

@implementation JLCManager

+(BOOL)handleOpenUrl:(NSURL *)url{
    NSAssert(url, @"url is nil!");
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    
    NSArray *urlTypes = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLTypes"];
    NSMutableArray *schemes = [NSMutableArray array];
    for (NSDictionary *dic in urlTypes) {
        NSArray *tempArr = dic[@"CFBundleURLSchemes"];
        [schemes addObjectsFromArray:tempArr];
    }
    BOOL match = NO;
    for (NSString *scheme in schemes) {
        if ([scheme.lowercaseString isEqualToString:components.scheme]) {
            match = YES;
            break;
        }
    }
    if (!match) {
        return NO;
    }
    
    //获取页面参数
    NSMutableDictionary *pramaters = [NSMutableDictionary dictionary];
    
    NSArray *itemStringArr = [components.query componentsSeparatedByString:@"&"];
    for (NSString *itemstr in itemStringArr) {
        NSRange range = [itemstr rangeOfString:@"="];
        if (range.location != NSNotFound) {
            NSString *key = [itemstr substringToIndex:range.location];
            NSString *value = [itemstr substringFromIndex:range.location+range.length];
            //合并key 遇到相同的key value值被替换
            [pramaters addEntriesFromDictionary:@{key:value}];
        }
    }
    
    
    
    
    
    
    
    
    
    return YES;
}


@end
