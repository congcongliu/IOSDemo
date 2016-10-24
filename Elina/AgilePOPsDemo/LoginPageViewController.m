//
//  LoginPageViewController.m
//  AgilePOPsDemo
//
//  Created by CongCong on 2016/10/21.
//  Copyright © 2016年 CongCong. All rights reserved.
//

#import "LoginPageViewController.h"
#import "HomePageViewController.h"
@interface LoginPageViewController ()<UITextFieldDelegate,UIAlertViewDelegate>{
    UITextField *_phoneNumberTextFiled;
    UITextField *_passWordTextFiled;
}

@end

@implementation LoginPageViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated]; //view 生命周期
}

- (void)viewDidLoad {
    [super viewDidLoad];  //断点调试
    self.title = @"登陆";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initLoginView];
    [self initSumbitButton];
}
- (void)initLoginView{
    _phoneNumberTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(50, 164, self.view.frame.size.width-100, 50)];
    _phoneNumberTextFiled.placeholder = @"请输入你的手机号码";
    _phoneNumberTextFiled.delegate = self;//代理的应用
    _phoneNumberTextFiled.clipsToBounds = YES;
    _phoneNumberTextFiled.layer.cornerRadius = 5;
    _phoneNumberTextFiled.layer.borderColor = [UIColor blackColor].CGColor;
    _phoneNumberTextFiled.layer.borderWidth = 2;
    _phoneNumberTextFiled.keyboardType = UIKeyboardTypeNumberPad;
    _phoneNumberTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_phoneNumberTextFiled];
}

- (void)initSumbitButton{
    UIButton *sumbitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sumbitButton.frame = CGRectMake(100, self.view.frame.size.height-100, self.view.frame.size.width-200, 50);
    sumbitButton.clipsToBounds = YES;
    sumbitButton.layer.cornerRadius = 5;//layer层 简介
    sumbitButton.backgroundColor = [UIColor greenColor];
    [sumbitButton setTitle:@"登陆" forState:UIControlStateNormal];// UIControlStateNormal 枚举
    [sumbitButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];//SEL方法选择器
    [self.view addSubview:sumbitButton];
}
- (void)loginClick{
    
    if ([_phoneNumberTextFiled.text isEqualToString:@"18037273459"]) {//  对比 == string
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:_phoneNumberTextFiled.text forKey:@"phoneNumber"];//本地 存储 基本类型
        
        HomePageViewController *home = [[HomePageViewController alloc]init];
        home.title = @"首页";
        [self.navigationController pushViewController:home animated:YES];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"请输入正确的手机号" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
         [alert show];//系统警告框
    }
}

#pragma mark --------> TextFiled  Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"TextFile:%@",textField.text);
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"TextFile:%@",textField.text);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
