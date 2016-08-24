//
//  ViewController.m
//  CALayer_transfer
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CALayer *_layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _layer = [[CALayer alloc] init];
    [self.view.layer addSublayer:_layer];
    _layer.backgroundColor = [UIColor orangeColor].CGColor;
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = self.view.center;
    _layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self changeTransform];//
    [self modefi];

}
//隐式动画，当CALayer的属性直接发生改变时，变化的过程会产生一个动画 0.25s(动画时间)
- (void)modefi{
//    _layer.position = CGPointMake(50, 100);
    
    _layer.cornerRadius = 50;
    
    _layer.opacity = 0.5;
    
    
    CATransform3D transform_01 = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    CATransform3D transform_02 = CATransform3DMakeScale(1.5, 1.5, 1);
    _layer.transform = CATransform3DConcat(transform_01, transform_02);//组合变化
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _layer.cornerRadius = 0;
        _layer.opacity = 1;
        _layer.transform = CATransform3DIdentity;//还原到初始的状态
    });
    
    
    
    
    
    
}


- (void)changeTransform{
    //CGLayer3D变换
    //    _layer.transform = CATransform3DScale(_layer.transform, 1.5, 1.5, 1);//放大
    //    _layer.transform = CATransform3DRotate(_layer.transform, M_PI_4, 0, 0, 1);//旋转后面三个参数代表方向，只有0，1
    //    _layer.transform = CATransform3DTranslate(_layer.transform,100, 200, 1);//平移
    
    //通过KVC实现transform(只能进行一次与)
    [_layer setValue:@2 forKeyPath:@"transform.scale.y"];//沿着y放大
    //    [_layer setValue:@3 forKeyPath:@"transform.scale"];//放大
    
    //    [_layer setValue:@100 forKeyPath:@"transform.translation"];//平移
    //    [_layer setValue:@200 forKeyPath:@"transform.translation.x"];//沿着x方向平移
    
    //    [_layer setValue:@M_PI_4 forKeyPath:@"transform.rotation"];//旋转
    //    [_layer setValue:@M_PI_2 forKeyPath:@"transform.rotation.z"];//沿着z方向旋转
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
