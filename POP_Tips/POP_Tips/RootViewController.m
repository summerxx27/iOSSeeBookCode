//
//  RootViewController.m
//  POP_Tips
//
//  Created by zjwang on 16/8/5.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(0, 0, 300, 20);
    presentButton.center = self.view.center;
    [presentButton setTitle:@"Push View Controller" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor colorWithRed:0.2912 green:0.904 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
}
- (void)click:(UIButton *)btn
{
    ViewController *main = [[ViewController alloc] init];
    [self.navigationController pushViewController:main animated:YES];
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
