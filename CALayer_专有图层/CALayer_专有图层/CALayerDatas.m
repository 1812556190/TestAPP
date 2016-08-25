//
//  CALayerDatas.m
//  CALayer_专有图层
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "CALayerDatas.h"

@interface CALayerDatas ()

@end


@implementation CALayerDatas




- (void)viewDidLoad{
    
    
    [self selectAction];
    
}


- (void)selectAction{
    switch (self.typeLayer) {
        case LayerTypeCAShapeLayer:
            
            break;
        case LayerTypeCATextLayer:
            
            break;
        case LayerTypeCAGradientLayer:
            [self creatCAGradientLayer];
            
            break;
        case LayerTypeCAEmitterLayer:
            [self creatLayerCAEmitterLayer];
            break;
        case LayerTypeAVPlayerLayer:
            
            break;
            
        default:
            break;
    }
}


#pragma mark -  渐变颜色变化

- (void)creatCAGradientLayer{
    CAGradientLayer *gradien = [CAGradientLayer layer];//创建
    gradien.frame = self.view.bounds;
    NSArray *colors = @[(__bridge id)[UIColor yellowColor].CGColor,
                        (__bridge id)[UIColor redColor].CGColor,
                        (__bridge id)[UIColor blueColor].CGColor];
    
    gradien.colors = colors;
    gradien.locations = @[@0.33,@0.66];//0~1,颜色占有的比例
    gradien.startPoint = CGPointMake(0, 1);//开始点
    gradien.endPoint = CGPointMake(1, 1);//结束点
    [self.view.layer addSublayer:gradien];
    
}


#pragma mark - 粒子效果

- (void)creatLayerCAEmitterLayer{
    self.view.backgroundColor = [UIColor blackColor];//
    CAEmitterLayer *emitter = [CAEmitterLayer layer];//创建粒子
                            
    emitter.emitterPosition = CGPointMake(150, -20);//设置粒子发射位置
    emitter.emitterSize = self.view.bounds.size;//设置发射源的尺寸
    emitter.emitterMode = kCAEmitterLayerSurface;//设置发射模式
    emitter.emitterShape = kCAEmitterLayerLine;//设置发射源形状
    
    //创建粒子形状
    CAEmitterCell *sonCell = [CAEmitterCell emitterCell];
    
    //粒子参数的速度乘数因子
    sonCell.birthRate = 20.0;
    sonCell.lifetime = 120.0;//设置持续时间
    
    //粒子的速度
    sonCell.velocity = 10.0;
    
    sonCell.velocityRange = 10;//粒子速度范围
    
    //粒子在y方向的加速分量
    sonCell.yAcceleration = 200.0;
    
    //周围发射角度
    sonCell.emissionRange = 0.5 * M_PI;
    
    //粒子旋转角度范围
    sonCell.spinRange = 0.25 * M_PI;
    sonCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"sonw"].CGImage);//设置填充图片(也就是粒子的形状)
    //设置粒子的属性
    sonCell.color = [UIColor whiteColor].CGColor;
    
    //设置阴影
    emitter.shadowOpacity = 1.0;
    emitter.shadowRadius = 0.0;
    emitter.shadowOffset = CGSizeMake(0, 0);
    emitter.shadowColor = [UIColor redColor].CGColor;
    
    sonCell.name = @"雪花";//粒子的名字
    
    //添加粒子
    emitter.emitterCells = @[sonCell];
    
    //将粒子Layer添加进图层
    [self.view.layer addSublayer:emitter];
    
    
    
    
    
    
    
}



@end
