//
//  ViewController.m
//  转场动画
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
    
   

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static NSInteger index = 1;
    NSString *imageName = [NSString stringWithFormat:@"image%ld.jpg",index];
    [self.imageView.layer addAnimation:[self animation] forKey:nil];
    self.imageView.image = [UIImage imageNamed:imageName];
    index++;
    if (index == 10) {
        index = 0;
    }
}


- (CAAnimation *)animation{
    CATransition *animation = [CATransition animation];
    
    animation.duration = 1;
    
    /*
     
     kCATransitionFade
     kCATransitionMoveIn
     kCATransitionPush
     kCATransitionReveal
     */
    //设置转场的效果
    animation.type = kCATransitionMoveIn;
    //设置转场的方向
    /*
     kCATransitionFromRight
     kCATransitionFromLeft
     kCATransitionFromTop
     kCATransitionFromBottom
     */
    animation.subtype = kCATransitionFromTop;
    //设置进度
    animation.startProgress = 0;
    animation.endProgress = 0.5;
    
    return animation;
}


- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = self.view.bounds;
//        imageView.contentMode = UIViewContentModeScaleAspectFit;//等比例显示
        imageView.image = [UIImage imageNamed:@"image0.jpg"];
        _imageView = imageView;
    }
    
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
