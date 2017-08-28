//
//  JLCManager.h
//  XACASampleDemo
//
//  Created by wangxq on 2017/5/24.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface JLCManager : NSObject


+ (BOOL)handleOpenUrl:(NSURL *)url;

+ (BOOL)canOpenUrl:(NSURL *)url;

//注册app
-(void)registerApp:(NSString *)appID;


//回调


@end
