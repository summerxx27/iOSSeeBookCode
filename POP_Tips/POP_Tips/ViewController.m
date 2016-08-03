//
//  ViewController.m
//  POP_Tips
//
//  Created by zjwang on 16/7/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"
#import "XTPopingView.h"
#import "ModelViewController.h"

#import "DismissingAnimator.h"
#import "PresentingAnimator.h"
#import "SwipeUpInteractiveTransition.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;

@end

@implementation ViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _transitionController = [SwipeUpInteractiveTransition new];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addPresentButton];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}

#pragma mark - Private Instance methods

- (void)addPresentButton
{
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(0, 0, 300, 20);
    presentButton.center = self.view.center;
    [presentButton setTitle:@"Present Modal View Controller" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor colorWithRed:0.2912 green:0.904 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
   
}

- (void)present:(id)sender
{
    ModelViewController *modalViewController = [ModelViewController new];
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self.transitionController wireToViewController:modalViewController];
    [self.navigationController presentViewController:modalViewController
                                            animated:YES
                                          completion:NULL];
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}
@end
