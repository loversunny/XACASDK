//
//  XAResultInfo.h
//  XACASampleDemo
//
//  Created by jlc on 2017/6/6.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XAResultInfo : NSObject


/**
 结果编码
 */
@property(nonatomic,assign) NSInteger resultCode;

/**
 结果描述
 */
@property(nonatomic,strong) NSString * resultDecs;

/**
 *  业务用户标识
 */
@property (nonatomic, copy) NSString *businessUserID;
/**
 *  签名证书
 */
@property (nonatomic, copy) NSString *signCert;

/**
 *  加密证书
 */
@property (nonatomic, copy) NSString * encryptCert;

/**
 *  签名值
 */
@property (nonatomic, copy) NSString *signData;

/**
 *  业务请求流水号
 */
@property (nonatomic, copy) NSString *businessNo;

/**
 *  手机U盾签名流水号
 */
@property (nonatomic, copy) NSString *signNo;

/**
 *  加密密文
 */
@property (nonatomic, copy) NSData *encData;

/**
 *  解密明文
 */
@property (nonatomic, copy) NSString *decData;

//原文
@property (nonatomic, copy) NSString *originalStr;
/**
 *  P10结构的CSR文件
 */
@property (nonatomic, copy) NSString * csr;
/**
 *  手机盾设备ID
 */
@property(nonatomic,copy)NSString *equipmentId;






#pragma mark - 证书信息类


/**
 *  签名证书序列号
 */
@property (nonatomic, copy) NSString *signCertSerial;
/**
 *  加密证书序列号
 */
@property (nonatomic, copy) NSString *encCertSerial;
/**
 *  证书生效日期
 */
@property (nonatomic, copy) NSString *startDate;
/**
 *  证书失效日期
 */
@property (nonatomic, copy) NSString *endDate;
/**
 *  证书状态
 */
@property (nonatomic, copy) NSString *certStatus;
/**
 *  证书算法标识
 */
@property (nonatomic, copy) NSString *algorithm;
/**
 *  主题
 */
@property (nonatomic, copy) NSString *subjectDN;
/**
 *  扩展项
 */
@property (nonatomic, copy) NSString *extensions;
/**
 *  颁发者信息
 */
@property (nonatomic, copy) NSString *issuerDN;
/**
 *  版本号
 */
@property (nonatomic, copy) NSString *version;

/*
 *  公钥
 */
@property (nonatomic, copy) NSString * pubKey;



@end
