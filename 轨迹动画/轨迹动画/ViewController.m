//
//  ViewController.m
//  轨迹动画
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"
#define XSSREENWIDTH [UIScreen mainScreen].bounds.size.width
#define XSSREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong)CAShapeLayer *shapelayer;

@end

@implementation ViewController

#pragma mark - 懒加载
- (CAShapeLayer *)shapelayer{
    if (!_shapelayer) {
        _shapelayer = [CAShapeLayer layer];
        _shapelayer.bounds = self.view.bounds;
        _shapelayer.position = self.view.center;
        _shapelayer.backgroundColor = [UIColor blackColor].CGColor;
        _shapelayer.lineWidth = 3;//线条的宽度
        _shapelayer.lineCap = kCALineCapRound;//线条的样式，圆滑
        _shapelayer.strokeColor = [UIColor redColor].CGColor;//描边颜色
    }
    return _shapelayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.shapelayer.path = [self path].CGPath;
    [self.shapelayer addAnimation:[self shaprlayerAnimation] forKey:nil];
}

- (CAAnimation *)shaprlayerAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 6.0;
    animation.fromValue  = @0;
    animation.toValue = @1;
    return animation;
}



- (UIBezierPath *)path{
    CGFloat rectWH = XSSREENWIDTH - 40;
    CGFloat rectY = (XSSREENHEIGHT - rectWH) / 2;
    CGRect rect = CGRectMake(20,rectY,rectWH, rectWH);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    //画十字线条
    [path moveToPoint:CGPointMake(20, XSSREENHEIGHT / 2)];//画笔移动到某点
    [path addLineToPoint:CGPointMake(XSSREENWIDTH - 20, XSSREENHEIGHT / 2)];
    
    [path moveToPoint:CGPointMake(XSSREENWIDTH / 2,rectY)];
    [path addLineToPoint:CGPointMake(XSSREENWIDTH / 2, rectY + rectWH)];
    
    //画圆
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    //切圆
    [path appendPath:arcPath];
    
    
    //绘制贝塞尔曲线
    [path moveToPoint:CGPointMake(20, XSSREENHEIGHT / 2)];
    CGPoint toPoint = CGPointMake(XSSREENWIDTH - 20, XSSREENHEIGHT / 2);
    CGPoint contor_01 = CGPointMake(XSSREENWIDTH / 4 + 20, 0);
    CGPoint contor_02 = CGPointMake(XSSREENWIDTH / 4 * 3 - 20, XSSREENHEIGHT);
    [path addCurveToPoint:toPoint controlPoint1:contor_01 controlPoint2:contor_02];
    

    CGPoint _toPoint = CGPointMake(20, XSSREENHEIGHT / 2);
    CGPoint _contor_01 = CGPointMake(XSSREENWIDTH / 4 * 3 - 20, 0);
    CGPoint _contor_02 = CGPointMake(XSSREENWIDTH / 4  + 20, XSSREENHEIGHT);
    [path addCurveToPoint:_toPoint controlPoint1:_contor_01 controlPoint2:_contor_02];
    
    
    return path;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer addSublayer:self.shapelayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
