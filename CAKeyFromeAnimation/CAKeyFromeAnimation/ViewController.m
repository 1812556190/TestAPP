//
//  ViewController.m
//  CAKeyFromeAnimation
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"
#define XSSREENWIDTH [UIScreen mainScreen].bounds.size.width
#define XSSREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController (){
    CALayer *_animaLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.frame = self.view.bounds;
    [self.view.layer addSublayer:layer];
    layer.delegate = self;
    
    [layer setNeedsDisplay];//重绘
    
    _animaLayer = [CALayer layer];
    _animaLayer.frame = CGRectMake(0, 0, 50, 50);
    _animaLayer.position = CGPointMake(XSSREENWIDTH /2, 25);
    _animaLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"足球"].CGImage);
//    _animaLayer.delegate = self;
    [self.view.layer addSublayer:_animaLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_animaLayer addAnimation:[self positionAnimation] forKey:@"position"];
}

- (CAAnimation *)positionAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 4;
    animation.repeatCount = HUGE_VAL;
    /*
    NSValue *point_01 = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH/2, 25)];
    NSValue *point_02 = [NSValue valueWithCGPoint:CGPointMake(25, XSSREENHEIGHT /2)];
    NSValue *point_03 = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH/2,XSSREENHEIGHT - 25)];
    NSValue *point_04 = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH - 25, XSSREENHEIGHT / 2)];
    NSValue *point_05 = [NSValue valueWithCGPoint:CGPointMake(XSSREENWIDTH/2, 25)];
    //设置关键帧
    animation.values = @[point_01,point_02,point_03,point_04,point_05];
    
    //设置每个关键帧之间的时间0~1
    animation.keyTimes = @[@0,@0.2,@0.5,@0.7,@1];//
    */
    //设置插值计算的模式
    /*
     kCAAnimationLinear //关键帧之间进行插值计算(线性的)
     kCAAnimationDiscrete //关键帧之间不进行插值计算，(离散的)
     kCAAnimationPaced   //关键帧匀速切换
     kCAAnimationCubic // 关键帧之间进行圆滑曲线相连后插值计算
     kCAAnimationCubicPaced //关键帧之间匀速并进行圆滑曲线相连后插值计算
     
     */
//    animation.calculationMode = kCAAnimationCubic;
    
    animation.path = [self path].CGPath;
    
    
    return animation;
}
- (IBAction)pauseAnimation:(UIButton *)sender {
    [self pauseLayer:_animaLayer];
    
}

- (IBAction)statAnimation:(UIButton *)sender {
    [self resumeLayer:_animaLayer];
}

#pragma mark 暂停CALayer的动画
-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 让CALayer的时间停止走动
    layer.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
    layer.timeOffset = pausedTime;
}

#pragma mark 恢复CALayer的动画
-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = layer.timeOffset;
    // 1. 让CALayer的时间继续行走
    layer.speed = 1.0;
    // 2. 取消上次记录的停留时刻
    layer.timeOffset = 0.0;
    // 3. 取消上次设置的时间
    layer.beginTime = 0.0;
    // 4. 计算暂停的时间(这里也可以用CACurrentMediaTime()-pausedTime)
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    // 5. 设置相对于父坐标系的开始时间(往后退timeSincePause)
    layer.beginTime = timeSincePause;
}


//绘制路径
- (UIBezierPath *)path{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, XSSREENWIDTH, XSSREENHEIGHT) cornerRadius:100];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:self.view.bounds];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(0, XSSREENHEIGHT)];
    [path2 addCurveToPoint:CGPointMake(XSSREENWIDTH, XSSREENHEIGHT) controlPoint1:CGPointMake(XSSREENWIDTH / 3, XSSREENHEIGHT / 2) controlPoint2:CGPointMake(XSSREENWIDTH / 3 * 2, XSSREENHEIGHT / 2)];
    
    
    return path2;
}

//绘图

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    CGContextAddPath(ctx, [self path].CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    CGContextDrawPath(ctx, kCGPathStroke);
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
