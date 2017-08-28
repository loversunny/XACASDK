//
//  SDKTestDemo.h
//  XACASampleDemo
//
//  Created by jlc on 2017/6/7.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDKTestDemo : NSObject


#pragma mark - 弹pin

/**
 申请证书
 */
+(void)applyCert;

/*
 证书查询调用接口
 */
+(void)queryCert;


/**
 摘要签名调用接口(弹PIN)
 */
+(void)signContentHash;




/*
 对称加密调用接口
 */
+(void)symEncrypt;



/*
 对称解密调用接口
 */
+(void)symDecrypt;

/*
 封装数字信封调用接口
 */
+ (void)envelopedData;

/*
 拆解P7数字信封调用接口(弹PIN)
 */
+ (void)disEnvelopedData;

/**
 v1签名
 */
+ (void)signDataV1;

/**
 p7签名
 */
+ (void)signDataP7;

//获取hash
+ (void)gethash;
/**
 hash签名 v1
 */
+ (void)signHashDataV1;
/**
 hash签名 p7
 */
+ (void)signHashDataP7;

/**
 获取对应的数字证书信息
 */
+ (void)getCerInfo;

/**
 修改pin码
 */
+ (void)changePin;


#pragma mark - 传pin
/**
 申请证书
 */
+(void)applyCertWithPin;

/*
 证书查询调用接口
 */
+(void)queryCertWithPin;


/**
 摘要签名调用接口(弹PIN)
 */
+(void)signContentHashWithPin;



/*
 封装数字信封调用接口
 */
+ (void)envelopedDataWithPin;

/*
 拆解P7数字信封调用接口(弹PIN)
 */
+ (void)disEnvelopedDataWithPin;

/**
 v1签名
 */
+ (void)signDataV1WithPin;

/**
 p7签名
 */
+ (void)signDataP7WithPin;

//获取hash
+ (void)gethashWithPin;
/**
 hash签名 v1
 */
+ (void)signHashDataV1WithPin;
/**
 hash签名 p7
 */
+ (void)signHashDataP7WithPin;

/**
 获取对应的数字证书信息
 */
+ (void)getCerInfoWithPin;

/**
 修改pin码
 */
+ (void)changePinWithPin;





#pragma mark - 暂未实现的接口


/**
 证书更新调用接口(弹PIN)
 */
+(void)updateCert;

/*
 证书延期调用接口
 */
+ (void)extendCertDate;

/**
 用户信息变更调用接口(弹PIN)
 */
+ (void)updateCertUserInfo;


/*
 证书状态变更调用接口
 */
+(void)updateCertStatus;


/*
 生成CSR调用接口(弹PIN模式)
 */
+(void)generateCSR;








/*
 非对称解密调用接口(弹PIN)
 */
+(void)asyDecrypt;

/*
 摘要调用接口
 */
+(void)getHash;

/*
 验签调用接口
 */
+(void)verifySignature;





/**
 企业申请证书
 */
+ (void)applyCertEnterprise;
/**
 生成CSR(个人)
 */
+(void)generateCSRExtend;
/**
 生成CSR(企业)
 */
+(void)generateEnterpriseCSR;
/**
 保存证书
 */
+(void)importCertInfoExtend;
/**
 原文签名(弹PIN)
 */
+(void)signatureSignStructType;
/**
 摘要签名(弹PIN)
 */
+(void)signContentHashSignStructType;
/**
 验签
 */
+(void)verifySignatureSignStructType;
/**
 证书密码修改
 */
+(void)modifyPin;








@end
