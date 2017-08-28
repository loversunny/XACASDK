//
//  XAManager.h
//  XACASampleDemo
//  调用方法类 弹pin
//  Created by jlc on 2017/6/6.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XACASDK.h"

@class XAEnterpriseInfo;


@interface XAManager : NSObject

+ (instancetype)sharedDevice;


/**
 注册sdk
 
 @param appKey 第三方平台生成key
 @param bundleID 用户唯一标识
 */
- (void)registWithAppKey:(NSString *)appKey userID:(NSString *)bundleID;

#pragma mark - 弹pin码的时候


/**
 *  申请证书(实时)
 *
 *  @param user           用户信息
 *  @param resultBlock    返回结果
 */
+ (void)applyCert:(XAUserInfo *)user
      resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 证书查询调用接口
 
 @param user user
 @param resultBlock 回调
 */
+(void)queryCert:(XAUserInfo *)user
     resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;



/**
 *  摘要签名
 *
 *  @param signContent    要签名的数据(经过杂凑算法后的数据)
 *  @param resultBlock    返回回调
 */
-(void) signContentHash:(NSString *)signContent
            resultBlock:(void (^)(XAResultInfo *resultVo)) resultBlock;
/**
 *  对称加密
 *
 *  @param algorithm      算法标示
 *  @param input          加密原文
 *  @param symkey         对称密钥
 
 *  @param resultBlock    返回回调
 */
-(void)symEncrypt:(int)algorithm
            input:(NSString *)input
           symkey:(NSString *)symkey
      resultBlock:(void (^) (XAResultInfo *resultVo))resultBlock;
/**
 *  对称解密 使用对称密钥解密
 *
 *  @param algorithm      算法标示
 *  @param symkey         对称密钥
 *  @param input          加密过的原文
 *  @param resultBlock    返回回调
 */
- (void)symDecryptAlgorithm:(int)algorithm
                     symkey:(NSString *)symkey
                      input:(NSString *)input
                resultBlock:(void (^)(XAResultInfo *resultVo)) resultBlock;

/**
 *  封装数字信封  加密
 *
 *  @param input                 原文 非空
 *  @param cert                  加密证书,传空的时候,会在业务APP查找对应证书
 *  @param resultBlock           返回回调
 */
- (void)envelopedDataInput:(NSString *)input
                      cert:(NSString *)cert
               resultBlock: (void (^) (XAResultInfo * resultVo)) resultBlock;


/**
 *  解析数字信封
 *
 *  @param envelopedData         数字信封
 *  //@ contentEncryAlgorithm 内容加密算法
 *  //@ encryKeyAlgorithm     对称秘钥加密算法
 *  @param resultBlock           返回回调
 */
- (void)disEnvelopedData:(NSString *)envelopedData
             resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;
/**
 v1签名
 @param input 原文
 @param resultBlock 回调结果
 */
- (void)signDataV1Input:(NSString *)input
            resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 p7签名
 @param input 原文
 @param resultBlock 回调结果
 */
- (void)signDataP7Input:(NSString *)input
            resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 获取hash值
 
 @param input 输入的字符串
 */
- (void)getHash:(NSString *)input
    resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 获取对应的数字证书信息
 
 @param cer 数字证书base64字符串
 @param item 需要解析的项
 */
- (void)getCertInfo:(NSString *)cer
               item:(int)item
        resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 对传入的 hash 值进行签名，函数中不在进行 hash 处理 v1
 
 @param hashData hash值
 @param resultBlock 回调
 */
- (void)signHashData:(NSString *)hashData
         resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 对传入的 hash 值进行签名，函数中不在进行 hash 处理  vp7
 
 @param hashData hash值
 @param resultBlock 回调
 */
- (void)signHashDataVp7:(NSString *)hashData
            resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 修改数字证书密码
 
 @param resultBlock 回调结果
 */
-(void)updatePinResultBlock:(void (^)(XAResultInfo *))resultBlock;











#pragma mark - 传pin的时候



/**
 *  申请证书(实时)
 *
 *  @param user           用户信息
 *  @param pin           证书密码
 *  @param resultBlock    返回结果
 */
+ (void)applyCert:(XAUserInfo *)user
          withPin:(NSString *)pin
      resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 证书查询调用接口
 
 *  @param user user
 *  @param pin   证书密码
 @param resultBlock 回调
 */
+(void)queryCert:(XAUserInfo *)user
         withPin:(NSString *)pin
     resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;



/**
 *  摘要签名
 *
 *  @param signContent    要签名的数据(经过杂凑算法后的数据)
 *  @param pin   证书密码
 *  @param resultBlock    返回回调
 */
-(void) signContentHash:(NSString *)signContent
                withPin:(NSString *)pin
            resultBlock:(void (^)(XAResultInfo *resultVo)) resultBlock;


/**
 *  封装数字信封  加密
 *
 *  @param input                 原文
 *  @param cert                  证书base64字符串
 *  @param pin                  证书密码
 *  @param resultBlock           返回回调
 */
- (void)envelopedDataInput:(NSString *)input
                      cert:(NSString *)cert
                   withPin:(NSString *)pin
               resultBlock: (void (^) (XAResultInfo * resultVo)) resultBlock;


/**
 *  解析数字信封
 *
 *  @param envelopedData         数字信封
 *  //@ contentEncryAlgorithm 内容加密算法
 *  @param pin                  证书密码
 *  @param resultBlock           返回回调
 */
- (void)disEnvelopedData:(NSString *)envelopedData
                 withPin:(NSString *)pin
             resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;
/**
 v1签名
 @param input 原文
 @param pin      证书密码
 @param resultBlock 回调结果
 */
- (void)signDataV1Input:(NSString *)input
                withPin:(NSString *)pin
            resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 p7签名
 @param input 原文
 @param pin      证书密码
 @param resultBlock 回调结果
 */
- (void)signDataP7Input:(NSString *)input
                withPin:(NSString *)pin
            resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 获取hash值
 
 @param input 输入的字符串
 @param pin      证书密码
 */
- (void)getHash:(NSString *)input
        withPin:(NSString *)pin
    resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 获取对应的数字证书信息
 
 @param cer 数字证书base64字符串
 @param item 需要解析的项
 @param pin      证书密码
 */
- (void)getCertInfo:(NSString *)cer
               item:(int)item
            withPin:(NSString *)pin
        resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 对传入的 hash 值进行签名，函数中不在进行 hash 处理 v1
 
 @param hashData hash值
 @param pin      证书密码
 @param resultBlock 回调
 */
- (void)signHashData:(NSString *)hashData
             withPin:(NSString *)pin
         resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;

/**
 对传入的 hash 值进行签名，函数中不在进行 hash 处理  vp7
 
 @param hashData hash值
 @param pin      证书密码
 @param resultBlock 回调
 */
- (void)signHashDataVp7:(NSString *)hashData
                withPin:(NSString *)pin
            resultBlock:(void (^) (XAResultInfo *resultVo)) resultBlock;


/**
 修改数字证书密码

 @param oldpin 原密码
 @param newpin 新密码
 @param resultBlock 结果回调
 */
-(void)updatePinwithOldPin:(NSString *)oldpin
                    newPin:(NSString *)newpin
               resultBlock:(void (^)(XAResultInfo *))resultBlock;




#pragma mark - public methods


/**
 发起调用,传入参数-
 
 @param info 用户信息或者公司信息实例对象,发起调用的操作对象,和方法名字,
 @param methodID 方法唯一标识,用来判断具体操作
 @param param 添加其他的一些参数
 @param feedBlock 回调结果
 */
- (void)callSDKWithInfo:(id)info
               methodID:(NSString *)methodID
         otherParmaters:(id)param
               feedBack:(void(^)(XAResultInfo * info))feedBlock;

/**
 用于跳转操作完成之后,回调回来的时候,处理这个
 
 @param url 回调进来传递的url
 @param result 处理结果
 */
- (BOOL)handleUrl:(NSURL *)url
           result:(void(^)(XAResultInfo * resultInfo))result;




@end
