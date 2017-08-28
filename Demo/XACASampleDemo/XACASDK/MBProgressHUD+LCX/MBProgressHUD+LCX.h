//
//  MBProgressHUD+LCX.h
//  MBProgressHUD+LCX
//
//  Created by 刘长兴 on 2017/4/7.
//  Copyright © 2017年 刘长兴. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LCX)


#pragma mark-------------------- show text----------------------------

/**
 在window上显示文本，默认1S后消失

 @param message 文本
 */
+(void)showHUD_inWindowWith_Message:(NSString*)message;

/**
 在window上显示文本

 @param message 显示文本
 @param aTimer   ?s后隐藏
 */
+(void)showHUD_inWindowWith_Message:(NSString *)message timer:(int)aTimer;

/**
 在view上显示文本，默认1S后消失

 @param message 显示的文本
 */
+(void)showHUD_inViewWith_Message:(NSString*)message;


/**
 在view上显示文本

 @param message 显示的文本
 @param aTimer 时间
 */
+(void)showHUD_inViewWith_Message:(NSString*)message timer:(int)aTimer;


/**
 在window上显示默认加载，需手动隐藏

 @param message 显示文本
 */
+ (void)showActivityMessageInWindow:(NSString*)message;

/**
 在view上显示默认加载，需手动隐藏

 @param message 显示文本
 */
+ (void)showActivityMessageInView:(NSString*)message;

/**
 在window上显示默认加载，设置时间隐藏

 @param message 显示文本
 @param aTimer 时间
 */
+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer;

/**
 在view上显示文本，设置时间隐藏

 @param message 显示的文本
 @param aTimer 时间
 */
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer;


/**
 显示成功图片

 @param Message 文本
 */
+ (void)showSuccessMessage:(NSString *)Message;

/**
 显示失败图片

 @param Message 文本
 */
+ (void)showErrorMessage:(NSString *)Message;

/**
 显示自定义图片及文本在windows上显示

 @param iconName 自定义图片
 @param message 文本
 */
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;

/**
 显示自定义图片及文本在view上显示
 
 @param iconName 自定义图片
 @param message 文本
 */
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;



/**
 显示白色转动加载字样,需要手动隐藏

 @param message 自定义文本
 */
+(void)showIndicatorViewWithMessage:(NSString *)message;




+ (void)hideHUD;



/**
 获取当前window控制器

 @return 当前window控制器
 */
+(UIViewController *)getCurrentWindowVC;

+(UIViewController *)getCurrentUIVC;

@end
