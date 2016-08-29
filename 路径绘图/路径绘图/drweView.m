//
//  drweView.m
//  路径绘图
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "drweView.h"
#define XSSREENWIDTH [UIScreen mainScreen].bounds.size.width
#define XSSREENHEIGHT [UIScreen mainScreen].bounds.size.height

@implementation drweView


- (void)drawRect:(CGRect)rect {
//    [self drawLine];
//    [self drawGraphics];
//    [self drawArc];
    [self drawBezierLine];
}


- (void)drawLine{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置线条的宽度
    [path setLineWidth:5];
    
    [path setLineCapStyle:kCGLineCapRound];//设置线头的样式
    [path setLineJoinStyle:kCGLineJoinRound];//设置线头连接的样式
    
    [path moveToPoint:CGPointMake(50,200)];//设置画笔的位置
    
    [path addLineToPoint:CGPointMake(XSSREENWIDTH - 50, 200)];
    
    [path addLineToPoint:CGPointMake(80,350)];
    
    [path addLineToPoint:CGPointMake(XSSREENWIDTH / 2,100)];
    
    [path addLineToPoint:CGPointMake(XSSREENWIDTH - 80,350)];
    
    [path closePath];//闭合路径
    
    //设置虚线
    CGFloat dash[] = {2,10,2};//虚实线的长度
    [path setLineDash:dash count:3 phase:0];
    
    
    
    
    //设置描边的颜色
    [[UIColor redColor] setStroke];
    
    [[UIColor whiteColor] setFill];//设置填充颜色
    
    [path stroke];//绘制
    
    [path fill];//绘制(填充)
    
    
}


- (void)drawGraphics{
    CGRect rect = CGRectMake(20, 100, 200, 200);
    
    //绘制矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    //绘制圆角矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:-20];
    
    //绘制椭圆、圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    [[UIColor blueColor] setStroke];
    [path setLineWidth:5];
    
    
    
    [path stroke];
    
}


//绘制扇形
- (void)drawArc{
    CGPoint center = self.center;
    //Center: 圆心 radius:半径 startAngle: 起始弧度 endAngle: 终点弧度 clockwise:是否顺时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI_4 clockwise:YES];
    
    
    [path addLineToPoint:center];
    
    [path closePath];
    
    
    [[UIColor blueColor] setStroke];
    [path setLineWidth:5];
    
    
    
    [path stroke];
}

//绘制曲线
- (void)drawBezierLine{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint beginPoint = CGPointMake(0, 200);
    CGPoint endPoint = CGPointMake(100, 200);
    CGPoint controPoint = CGPointMake(50, 0);
    [path moveToPoint:beginPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controPoint];
    
    
    [[UIColor blueColor] setStroke];
    [path setLineWidth:5];
    
    
    
    [path stroke];
    
    
    
}






@end
