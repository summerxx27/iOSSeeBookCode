//
//  ModelViewController.m
//  POP_Tips
//
//  Created by zjwang on 16/8/2.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()
- (void)addDismissButton;
- (void)dismiss:(id)sender;
@end

@implementation ModelViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.layer.cornerRadius = 8.f;
    self.view.backgroundColor = [UIColor colorWithRed:0.3373 green:0.8809 blue:0.9846 alpha:1.0];
    [self addDismissButton];
}

#pragma mark - Private Instance methods

- (void)addDismissButton
{
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissButton.frame = CGRectMake(20, 80, 80, 60);
    dismissButton.tintColor = [UIColor whiteColor];
    dismissButton.backgroundColor = [UIColor cyanColor];
    dismissButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    dismissButton.titleLabel.numberOfLines = 0;
    [dismissButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
