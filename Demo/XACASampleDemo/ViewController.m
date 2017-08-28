//
//  ViewController.m
//  XACASampleDemo
//
//  Created by wangxq on 2017/5/23.
//  Copyright © 2017年 河南省信息化有限公司. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
