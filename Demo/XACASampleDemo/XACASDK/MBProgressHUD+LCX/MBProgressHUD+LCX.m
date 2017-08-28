//
//  MBProgressHUD+LCX.m
//  MBProgressHUD+LCX
//
//  Created by 刘长兴 on 2017/4/7.
//  Copyright © 2017年 刘长兴. All rights reserved.
//

#import "MBProgressHUD+LCX.h"
#define DefultTimer 1
@implementation MBProgressHUD (LCX)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=message?message:@"加载中.....";
    hud.labelFont=[UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
  //  hud.dimBackground = NO;
    //hud.backgroundView.backgroundColor = [UIColor clearColor];
    return hud;
}

+(void)showHUD_inWindowWith_Message:(NSString*)message{
    [self showMessage:message isWindow:true timer:DefultTimer];
}

+(void)showHUD_inWindowWith_Message:(NSString *)message timer:(int)aTimer{
    [self showMessage:message isWindow:true timer:aTimer];
}

+(void)showHUD_inViewWith_Message:(NSString*)message{
    [self showMessage:message isWindow:false timer:DefultTimer];
}

+(void)showHUD_inViewWith_Message:(NSString*)message timer:(int)aTimer{
    [self showMessage:message isWindow:false timer:aTimer];
}

+(void)showMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)yimer{
 MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:yimer];
}

+ (void)showActivityMessageInWindow:(NSString*)message{
    [self showActivityMessage:message isWindow:true timer:0];
}

+ (void)showActivityMessageInView:(NSString*)message{
    [self showActivityMessage:message isWindow:false timer:0];
}

+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer{
    [self showActivityMessage:message isWindow:true timer:aTimer];
}
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer{
    [self showActivityMessage:message isWindow:false timer:aTimer];
}

+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hide:YES afterDelay:aTimer];
    }
}


+ (void)showSuccessMessage:(NSString *)Message{
    [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
}

+ (void)showErrorMessage:(NSString *)Message{
    [self showCustomIconInWindow:@"MBHUD_Error" message:Message];
}

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message{
    [self showCustomIcon:iconName message:message isWindow:true];
}

+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message{

    [self showCustomIcon:iconName message:message isWindow:false];

}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:1.1f];
}

+(void)showIndicatorViewWithMessage:(NSString *)message{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:false];
//    hud.color = [black_color colorWithAlphaComponent:0.5];
//    hud.mode = MBProgressHUDModeCustomView;
//    ArcView *view = [ArcView new];
//    hud.customView = view;
//    view.sd_layout.centerXEqualToView(hud).heightIs(37.f).widthEqualToHeight().topEqualToView(hud);
    hud.userInteractionEnabled = NO;
}


+ (void)hideHUD
{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    NSEnumerator *subviewsEnum = [winView.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:[MBProgressHUD class]]) {
            MBProgressHUD *hud =(MBProgressHUD*)subview;
            if (hud != nil) {
                hud.removeFromSuperViewOnHide = YES;
                [hud hide:YES];
            }
        }
    }
    [self hideHUDForView:winView animated:YES];

    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
@end
