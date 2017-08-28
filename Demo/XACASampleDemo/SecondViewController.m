//
//  SecondViewController.m
//  HNInfoCer
//
//  Created by wangxq on 2017/5/19.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import "SecondViewController.h"
#import <CoreFoundation/CFString.h>
#import "SDKTestDemo.h"


void addFunction(){

    
}

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong) NSArray * dataSource;

@end

static SecondViewController *VC = nil;

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"证书管理";
    [self loadData];
}

- (void)addff{
    NSLog(@"呵呵呵");
}
- (void)loadData{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MethodID" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
    NSMutableArray *ids = [NSMutableArray array];
    NSMutableArray *pinids = [NSMutableArray array];
    
    
    NSArray *IDs = dict[@"IDs"];
    
    for (NSDictionary *dic in IDs) {
        NSString *desc = dic[@"desc"];
        [ids addObject:desc];
    }
    
    NSArray *pins = dict[@"IDsforPassPin"];
    for (NSDictionary *dic in pins) {
        NSString *desc = dic[@"desc"];
        [pinids addObject:desc];
    }
    
    
    self.dataSource = @[ids,pinids];
    [self.tableView reloadData];
}

#pragma mark--UITableViewDelegate

//row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
//header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
//footer height
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
// view--header
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
// view-footer
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}



#pragma mark--UITableViewDataSource
//row 个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}

//section 个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
//自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row];
    
    
    return cell;
}


//点击跳转方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [SDKTestDemo applyCert];
                    
                    NSLog(@"Current method: %@",NSStringFromSelector(_cmd));
                }
                    break;
                case 1:
                {
                    [SDKTestDemo queryCert];
                }
                    break;
                case 2:
                {
                    [SDKTestDemo signContentHash];
                }
                    break;
                case 3:
                {
                    [SDKTestDemo symEncrypt];
                }
                    break;
                case 4:
                {
                    [SDKTestDemo symDecrypt];
                }
                    break;
                case 5:
                {
                    [SDKTestDemo envelopedData];
                }
                    break;
                case 6:
                {
                    [SDKTestDemo disEnvelopedData];
                }
                    break;
                    
                case 7:
                {
                    [SDKTestDemo signDataV1];
                }
                    break;
                case 8:
                {
                    [SDKTestDemo signDataP7];
                }
                    break;
                case 9:
                {
                    [SDKTestDemo gethash];
                }
                    break;
                case 10:
                {
                    [SDKTestDemo getCerInfo];
                }
                    break;
                case 11:
                {
                    [SDKTestDemo signHashDataV1];
                }
                    break;
                case 12:
                {
                    [SDKTestDemo signHashDataP7];
                }
                    break;
                case 13:
                default:
                    break;
            }

        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [SDKTestDemo applyCertWithPin];
                }
                    break;
                case 1:
                {
                    [SDKTestDemo queryCertWithPin];
                }
                    break;
                case 2:
                {
                    [SDKTestDemo signContentHashWithPin];
                }
                    break;
                case 3:
                {
                    [SDKTestDemo envelopedDataWithPin];
                }
                    break;
                case 4:
                {
                    [SDKTestDemo disEnvelopedDataWithPin];
                }
                    break;

                case 5:
                {
                    [SDKTestDemo signDataV1WithPin];
                }
                    break;
                case 6:
                {
                    [SDKTestDemo signDataP7WithPin];
                }
                    break;
                case 7:
                {
                    [SDKTestDemo gethashWithPin];
                }
                    break;
                case 8:
                {
                    [SDKTestDemo getCerInfoWithPin];
                }
                    break;
                case 9:
                {
                    [SDKTestDemo signHashDataV1WithPin];
                }
                    break;
                case 10:
                {
                    [SDKTestDemo signHashDataP7WithPin];
                }
                case 11:
                {
                    [SDKTestDemo changePinWithPin];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                case 3:
                {
                    
                }
                    break;
                case 4:
                {
                    
                }
                    break;
                case 5:
                {
                    
                }
                    break;
                case 6:
                {
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
}





#pragma mark -- lazy load

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = [UIColor lightGrayColor];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 13, 0, 0);
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //[_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UITableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"identifier"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


-(NSArray *)dataSource{
    if (!_dataSource) {
//        _dataSource = @[@[@"申请证书(实时弹PIN)",@"申请证书(实时传PIN)",@"申请证书(非实时弹PIN)",@"申请证书(非实时传PIN)",@"申请证书(手机授权码弹PIN)",@"申请证书(手机授权码传PIN)",@"证书下载(非实时弹PIN)",@"证书下载(非实时传PIN)",@"证书补办(实时弹PIN)",@"证书补办(实时传PIN)",@"证书补办(非实时弹PIN)",@"证书补办(非实时传PIN)",@"证书更新(弹PIN)",@"证书更新(传PIN)",@"用户信息变更(弹PIN)",@"用户信息变更(传PIN)",@"证书延期",@"证书状态变更",@"证书查询",@"生成CSR(弹PIN)",@"生成CSR(传PIN)",@"生成企业CSR(弹PIN)",@"生成企业CSR(传PIN)",@"保存证书"],@[@"原文签名(弹PIN)",@"原文签名(传PIN)",@"原文签名(PIN缓存)",@"摘要签名(弹PIN)",@"摘要签名(传PIN)",@"摘要签名(PIN缓存)",@"摘要接口",@"对称加密",@"对称解密",@"非对称加密",@"非对称解密(弹PIN)",@"非对称解密(传PIN)",@"非对称解密(PIN缓存)",@"封装P7数字信封",@"拆解P7数字信封(弹PIN)",@"拆解P7数字信封(传PIN)",@"拆解P7数字信封(PIN缓存)",@"获取SDK版本号"],@[@"企业申请证书(实时)",@"生成CSR(企业)",@"生成CSR(个人)",@"保存证书",@"原文签名(弹PIN)",@"摘要签名(弹PIN)",@"验签接口",@"证书密码修改",@"色调值"]];
        _dataSource = @[@[@"申请证书",@"原文签名",@"证书查询",@"摘要签名",@"证书更新(有效期)",@"证书延期",@"更新证书(用户信息)",@"证书状态变更(冻结,解冻)"],@[@"对称加密",@"对称解密",@"非对称加密",@"非对称解密",@"摘要算法",@"验签"],@[]];
    }
    return _dataSource;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
