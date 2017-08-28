//
//  AppDelegate.m
//  XACASampleDemo
//
//  Created by wangxq on 2017/5/23.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "QMUIConfigurationTemplate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // appid - 489BBD8A25F109A63A56ADAA39CAEC2B461A5E55 该字符串,由开发者去信安CA开发平台,填入项目对应bundleID来自动生成的 后台注册的时候,可以通过bundleID 上传到服务器 生成字符串,核对是否一致,不一致则注册失败,提醒用户(log提示,不能弹窗)填入的APPID与平台注册不一致,提醒用户核对,或者根据bundleID重新去生成
    
    [[XAManager sharedDevice]registWithAppKey:@"489BBD8A25F109A63A56ADAA39CAEC2B461A5E55" userID:@"company.hninfo.XACASampleDemo"];
    [[QMUIConfigurationTemplate new]setupConfigurationTemplate];
    // 将全局样式渲染出来
    [QMUIConfigurationManager renderGlobalAppearances];
    //[QDCommonUI renderGlobalAppearances];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - url

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    //类似支付完成过来的回调  根据相关字段,比如url.host (http:host/)来断定这个回调是不是来自支付的(因为有可能存在其他的回调,比如第三方分享的回调,微信支付的回调)
//    if ([url.host isEqualToString:@"xccafeed"]) {
//        NSLog(@"query - %@",url.query);
//    }
    
    return [[XAManager sharedDevice]handleUrl:url result:^(id responseobject) {
        
        NSLog(@"res - %@",responseobject);
    }];
    
    return YES;
}




@end
