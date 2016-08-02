//
//  ViewController.m
//  iOS编程实战_01
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *topLayer;

@property (nonatomic, strong) CALayer *bottomLayer;

@property (nonatomic, strong) CALayer *leftLayer;

@property (nonatomic, strong) CALayer *rightLayer;

@property (nonatomic, strong) CALayer *frontLayer;

@property (nonatomic, strong) CALayer *backLayer;

@end

@implementation ViewController

const CGFloat kSize = 100.;
const CGFloat kPanScale = 1./100.;

- (CALayer *)layerWithColor:(UIColor *)color
                  transform:(CATransform3D)transform
{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [color CGColor];
    layer.bounds = CGRectMake(20, 20, kSize, kSize);
    layer.position = self.view.center;
    layer.transform = transform;
    return layer;
}
static CATransform3D MakePerspectiveTransform()
{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1. / 2000.;
    return perspective;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /// 分类中load方法的作用, 类似于一般的init方法可以对分类进行一些设置(例如: 初始化静态变量), load方法只会调用一次, 不应该手动调用, , 勇士也不需要调用 [super load]
    
    CATransform3D transform;
    // 1
    transform = CATransform3DMakeTranslation(0, -kSize / 2, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1.0, 0, 0);
    self.topLayer = [self layerWithColor:[UIColor purpleColor] transform:transform];
    [self.view.layer addSublayer:self.topLayer];
    // 2
    transform = CATransform3DMakeTranslation(0, kSize / 2, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1.0, 0, 0);
    self.bottomLayer = [self layerWithColor:[UIColor blackColor] transform:transform];
    [self.view.layer addSublayer:self.bottomLayer];
    // 3
    transform = CATransform3DMakeTranslation(kSize / 2, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1.0, 0);
    self.leftLayer = [self layerWithColor:[UIColor lightGrayColor] transform:transform];
    [self.view.layer addSublayer:self.leftLayer];
    // 4
    transform = CATransform3DMakeTranslation(-kSize / 2, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1.0, 0);
    self.rightLayer = [self layerWithColor:[UIColor blueColor] transform:transform];
    [self.view.layer addSublayer:self.rightLayer];
    // 5
    transform = CATransform3DMakeTranslation(0, 0, -kSize / 2);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 0, 0);
    self.frontLayer = [self layerWithColor:[UIColor greenColor] transform:transform];
    [self.view.layer addSublayer:self.frontLayer];
    // 6
    transform = CATransform3DMakeTranslation(0, 0, kSize / 2);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 0, 0);
    self.backLayer = [self layerWithColor:[UIColor redColor] transform:transform];
    [self.view.layer addSublayer:self.backLayer];

    
    self.view.layer.sublayerTransform = MakePerspectiveTransform();
    
    UIGestureRecognizer *g = [[UIPanGestureRecognizer alloc] initWithTarget:self action: @selector(pan:)];
    [self.view addGestureRecognizer:g];
}
- (void)pan:(UIPanGestureRecognizer *)rec
{
    NSLog(@"----------------");
    CGPoint translation = [rec translationInView:self.view];
    CATransform3D tranform = MakePerspectiveTransform();
    tranform = CATransform3DRotate(tranform, kPanScale * translation.x, 0, 1, 0);
    tranform = CATransform3DRotate(tranform, -kPanScale * translation.y, 1, 0, 0);
    self.view.layer.sublayerTransform = tranform;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
