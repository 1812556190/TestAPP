//
//  ViewController.m
//  CAAnimationGroup
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"
#define XSSREENWIDTH [UIScreen mainScreen].bounds.size.width
#define XSSREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *fleImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.bgView.layer.delegate = self;
    [self.bgView.layer setNeedsDisplay];//重绘
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.fleImage.layer addAnimation:[self groupAnimation] forKey:@"group"];
}


#pragma mark - 动画组
- (CAAnimation *)groupAnimation{
    
    CAAnimationGroup *groop = [CAAnimationGroup animation];
    
    groop.duration = 9.0;
    groop.fillMode = kCAFillModeForwards;
    groop.removedOnCompletion = NO;
    
    groop.animations  = @[[self keyFrameAnimation],[self rotationOneAnimation],[self positionOneAnimation],[self positionAnimation],[self rotationAnimation]];
    
    
    return groop;
}


#pragma mark - 子动画
//帧动画
- (CAAnimation *)keyFrameAnimation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 3.0;
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.path = [self path].CGPath;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//速度函数 加速
    
    return animation;
}

//平移

- (CAAnimation *)positionOneAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 3.0;
    animation.beginTime = 4.0;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH - 50, 20)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH - 650, 20)];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];//速度函数 匀速
    
    return animation;
}

//y旋转
- (CAAnimation *)rotationOneAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.byValue = @(M_PI);
    animation.duration = 1.0;
    animation.beginTime = 3.0;
//    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    return animation;
}




//下落
- (CAAnimation *)positionAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 2.0;
    animation.beginTime = 7.0;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH - 650, 20)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH - 650, XSSREENHEIGHT - 20)];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//速度函数 加速
    
    return animation;
}



//旋转
- (CAAnimation *)rotationAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.byValue = @(M_PI * 2);
    animation.duration = 1.0;
    animation.beginTime = 7.0;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    return animation;
}

#pragma mark - 绘制路径

- (UIBezierPath *)path{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, XSSREENHEIGHT - 20)];
    
    [path addQuadCurveToPoint:CGPointMake(XSSREENWIDTH,0) controlPoint:CGPointMake(XSSREENWIDTH, XSSREENHEIGHT)];
    
                
    return path;
}


//画图
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    CGContextAddPath(ctx, [self path].CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 5);

    CGContextDrawPath(ctx,kCGPathStroke);
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
