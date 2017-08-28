//
//  SDKTestDemo.m
//  XACASampleDemo
//
//  Created by jlc on 2017/6/7.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import "SDKTestDemo.h"


//业务app用户唯一标识(业务方生成用户唯一标示)
#define BUSINESSUSERID @"ccititer"
//业务编号(由手机盾平台为业务方提供,实际开发中请使用对应业务编号)
#define BUSINISSCODE @"10005"

//非对称算法标识
#define Asymmetric_Algo  @"101"  //RSA1024:101 RSA2048:102 SM2_256:103

//对称算法标识
#define Symmetric_Algo  @"201"  //AES:201 SM4:202
//杂凑算法标识
#define Hash_Algo  @"302"  //SM3:301 SHA1:302 SHA256:303 MD5:304

static NSString *PIN = @"520131";

@implementation SDKTestDemo



+(id)creatUserInfo{
    /*
     user 用户信息 姓名 证件类型 证件号码 为 必填项
     */
    XAUserInfo * user = [XAUserInfo new];
    user.userName = @"张转";
    user.cardType = @"身份证";
    user.cardNum = @"411381199201203543";
//    user.city = @"郑州";
//    user.address = @"金水区";
//    user.unitName = @"项目部";
//    user.userOrg = @"信息化工程";
    return user;
}
#pragma mark - 弹pin

/**
 申请证书
 */
+(void)applyCert{
    
    
    [XAManager applyCert:[SDKTestDemo creatUserInfo] resultBlock:^(XAResultInfo *resultVo) {
        
        [SDKTestDemo logResult:resultVo title:@"申请证书"];
    }];
    
}

/*
 证书查询调用接口
 */
+(void)queryCert{
    [XAManager queryCert:[SDKTestDemo creatUserInfo] resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"证书查询"];
    }];
}


/**
 摘要签名调用接口(弹PIN)
 */
+(void)signContentHash{
    
    
    [[XAManager sharedDevice] signContentHash:@"我是原文" resultBlock:^(XAResultInfo *resultVo) {
        
        [SDKTestDemo logResult:resultVo title:@"摘要签名"];


    }];
}




/*
 对称加密调用接口
 */
+(void)symEncrypt{
    //
    [[XAManager sharedDevice] symEncrypt:11 input:@"我是原文" symkey:@"我是密钥" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"对称加密"];

    }];
}



/*
 对称解密调用接口
 */
+(void)symDecrypt{
    [[XAManager sharedDevice] symDecryptAlgorithm:11 symkey:@"我是密钥" input:@"cZ6DlQOQaHG9UF9B54kA4g==" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"对称解密"];

    }];
}

/*
 封装数字信封调用接口
 */
+ (void)envelopedData{
    
    
    [[XAManager sharedDevice]envelopedDataInput:@"我是原文" cert:nil resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"封装数字信封"];

    }];
}

/*
 拆解P7数字信封调用接口(弹PIN)
 */
+ (void)disEnvelopedData{
    [[XAManager sharedDevice]disEnvelopedData:@"MIH8BgkqhkiG9w0BBwOgge4wgesCAQAxgbkwgbYCAQAwKDAhMQswCQYDVQQGEwJDTjESMBAGA1UEAwwJdGVzdHNtMmNhAgMCv2swCwYHKoZIzj0CAQUABHoweAIgKv8smW3+XMH4nAyOYlYP4086FmTb3NMW06DBxjVLjGUCIDcOzdeZOL4cVm1ogL1heS7pyXpUmUzEOZ+TpCX9DILsBCBUhmUKd0g4pkjQ6gCLDnAPEMnWu+f+KPYw+qjWTQLAAgQQsuOrjmCfW5WomPUDkzhyjTAqBgkqhkiG9w0BBwYwCwYHKoEcz1UBaAUAgBBkORu1y8cgXe95Te4yPDyJ" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"拆解数字信封"];
    }];
}

/**
 p1签名
 */
+ (void)signDataV1{
    [[XAManager sharedDevice]signDataV1Input:@"我是原文" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"p1签名"];
    }];
}

/**
 p7签名
 */
+ (void)signDataP7{
    [[XAManager sharedDevice]signDataP7Input:@"我是原文" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"p7签名"];
    }];
}

//获取hash
+ (void)gethash{
    
}
/**
 hash签名 v1
 */
+ (void)signHashDataV1{
    //先hash
    [[XAManager sharedDevice]signHashData:@"经过hash后的值" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"hash签名 p1"];
    }];
}
/**
 hash签名 p7
 */
+ (void)signHashDataP7{
    [[XAManager sharedDevice]signHashDataVp7:@"经过hash后的值" resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"hash签名 p7"];
    }];
}

/**
 获取对应的数字证书信息
 */
+ (void)getCerInfo{
    //对应,根据所传信息,先获取对应证书,然后在获取信息
    [[XAManager sharedDevice] getCertInfo:@"证书" item:1 resultBlock:^(XAResultInfo *resultVo) {
       
    }];
}

/**
 修改pin码
 */
+ (void)changePin{
    [[XAManager sharedDevice]updatePinResultBlock:^(XAResultInfo * resultVo) {
        [SDKTestDemo logResult:resultVo title:@"修改pin码"];

    }];
}


#pragma mark - 传pin
/**
 申请证书
 */
+(void)applyCertWithPin{
    [XAManager applyCert:[SDKTestDemo creatUserInfo] withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"申请证书"];

    }];
}

/*
 证书查询调用接口
 */
+(void)queryCertWithPin{
    [XAManager queryCert:[SDKTestDemo creatUserInfo] withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"证书查询"];

    }];
}


/**
 摘要签名调用接口(弹PIN)
 */
+(void)signContentHashWithPin{
    [[XAManager sharedDevice] signContentHash:@"我是原文" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"摘要签名"];

    }];
}



/*
 封装数字信封调用接口
 */
+ (void)envelopedDataWithPin{
    [[XAManager sharedDevice] envelopedDataInput:@"我是原文" cert:nil withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"封装数字信封"];

    }];
}

/*
 拆解P7数字信封调用接口(弹PIN)
 */
+ (void)disEnvelopedDataWithPin{
    [[XAManager sharedDevice]disEnvelopedData:@"MIH8BgkqhkiG9w0BBwOgge4wgesCAQAxgbkwgbYCAQAwKDAhMQswCQYDVQQGEwJDTjESMBAGA1UEAwwJdGVzdHNtMmNhAgMCv2swCwYHKoZIzj0CAQUABHoweAIgKv8smW3+XMH4nAyOYlYP4086FmTb3NMW06DBxjVLjGUCIDcOzdeZOL4cVm1ogL1heS7pyXpUmUzEOZ+TpCX9DILsBCBUhmUKd0g4pkjQ6gCLDnAPEMnWu+f+KPYw+qjWTQLAAgQQsuOrjmCfW5WomPUDkzhyjTAqBgkqhkiG9w0BBwYwCwYHKoEcz1UBaAUAgBBkORu1y8cgXe95Te4yPDyJ" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"拆解数字信封"];
    }];
}

/**
 P1签名
 */
+ (void)signDataV1WithPin{
    [[XAManager sharedDevice]signDataV1Input:@"我是原文" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        [SDKTestDemo logResult:resultVo title:@"p1签名"];

    }];
}

/**
 p7签名
 */
+ (void)signDataP7WithPin{
    [[XAManager sharedDevice]signDataP7Input:@"我是原文" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        
    }];
}

//获取hash
+ (void)gethashWithPin{
    [[XAManager sharedDevice] getHash:@"我是原文" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        
    }];
}
/**
 hash签名 v1
 */
+ (void)signHashDataV1WithPin{
    [[XAManager sharedDevice] signHashData:@"hash值" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        
    }];
}
/**
 hash签名 p7
 */
+ (void)signHashDataP7WithPin{
    [[XAManager sharedDevice] signHashDataVp7:@"hash值" withPin:PIN resultBlock:^(XAResultInfo *resultVo) {
        
    }];
}

/**
 获取对应的数字证书信息
 */
+ (void)getCerInfoWithPin{
    //应该传过去用户信息
    [[XAManager sharedDevice] getCertInfo:@"" item:1 resultBlock:^(XAResultInfo *resultVo) {
        
    }];
}

/**
 修改pin码
 */
+ (void)changePinWithPin{
    [[XAManager sharedDevice] updatePinwithOldPin:PIN newPin:@"520133" resultBlock:^(XAResultInfo *) {
        
    }];
}



+ (void)logResult:(XAResultInfo *)resultVo title:(NSString *)title {
    [QMUITips hideAllToastInView:[UIApplication sharedApplication].keyWindow animated:YES];
    
    if (resultVo.resultCode != 0) { 
        
        [QMUITips showError:resultVo.resultDecs detailText:title inView:[MBProgressHUD getCurrentUIVC].view hideAfterDelay:1.5];
        
    }else{
        
        if (resultVo.resultDecs.length > 1) {
            [QMUITips showSucceed:resultVo.resultDecs detailText:title inView:[MBProgressHUD getCurrentUIVC].view hideAfterDelay:2.0];
            return;
        }
        if (resultVo.signData.length > 1) {
            [QMUITips showSucceed:resultVo.signData detailText:title inView:[MBProgressHUD getCurrentUIVC].view hideAfterDelay:2.0];
            return;
            
        } if (resultVo.originalStr.length > 1) {
            [QMUITips showSucceed:resultVo.originalStr detailText:title inView:[MBProgressHUD getCurrentUIVC].view hideAfterDelay:2.0];
            return;
        }
        if (resultVo.signCert.length > 1) {
            [QMUITips showSucceed:resultVo.signCert detailText:title inView:[MBProgressHUD getCurrentUIVC].view hideAfterDelay:2.0];
            return;
        }if (resultVo.encryptCert.length > 1) {
            [QMUITips showSucceed:resultVo.encryptCert detailText:title inView:[MBProgressHUD getCurrentUIVC].view hideAfterDelay:2.0];
            return;
        }
    }
}









@end
