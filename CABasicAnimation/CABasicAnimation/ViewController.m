//
//  ViewController.m
//  CABasicAnimation
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CALayer *_animaLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _animaLayer = [CALayer layer];
    _animaLayer.frame = CGRectMake(0, 0, 100, 100);
    _animaLayer.position = CGPointMake(self.view.center.x,50);
    _animaLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"football"].CGImage);
    [self.view.layer addSublayer:_animaLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_animaLayer addAnimation:[self positionAnimation] forKey:@"positionAnimation"];
    
    [_animaLayer addAnimation:[self rotationAnimation] forKey:@"rotationAnimation"];
}

- (CAAnimation *)positionAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];//创建动画
    animation.fromValue = [NSValue valueWithCGPoint: CGPointMake(self.view.center.x,50)];//动画的起点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x,600 )];//动画的终点
    animation.duration = 2.0;//动画的时间
//    animation.repeatCount = 1;//动画执行次数
//    animation.speed = 2.0;//动画的速度
    /*
     kCAFillModeForwards
     kCAFillModeBackwards
     kCAFillModeBoth
     kCAFillModeRemoved
     */
    animation.fillMode = kCAFillModeForwards;//动画的模式
    animation.removedOnCompletion = NO;//动画完成后是否移除
//    animation.autoreverses = YES;//返回时是否有动画
    /*
     kCAMediaTimingFunctionLinear        匀速
     kCAMediaTimingFunctionEaseIn        加速
     kCAMediaTimingFunctionEaseOut       减速
     kCAMediaTimingFunctionEaseInEaseOut 先加速在减速
     kCAMediaTimingFunctionDefault       默认匀速
     */
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//动画的速度函数
    
    return animation;
}
- (CAAnimation *)rotationAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.fromValue = @0;//动画的起点
    animation.toValue = @(M_PI * 2);//动画的终点
    
    animation.duration = 1;//动画的时间
        animation.repeatCount = HUGE_VAL;//动画执行次数HUGE_VAL无限循环
    //    animation.speed = 2.0;//动画的速度

    
    animation.fillMode = kCAFillModeForwards;//动画的模式
    animation.removedOnCompletion = NO;//动画完成后是否移除
//        animation.autoreverses = YES;//返回时是否有动画


    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//动画的速度函数
    
    return animation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
