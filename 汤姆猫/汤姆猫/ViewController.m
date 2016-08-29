//
//  ViewController.m
//  汤姆猫
//
//  Created by apple on 16/8/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tomImage;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnsAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
            [self animationTomImage:@"pie" withActionCount:24];
            break;
        case 101:
            [self animationTomImage:@"eat" withActionCount:40];
            break;
        case 102:
            [self animationTomImage:@"drink" withActionCount:81];
            break;
        case 103:
            [self animationTomImage:@"fart" withActionCount:28];
            break;
        case 104:
            [self animationTomImage:@"cymbal" withActionCount:13];
            break;
        case 105:
            [self animationTomImage:@"scratch" withActionCount:56];
            break;
            
        default:
            break;
    }
}



- (IBAction)headerAction:(UIButton *)sender {
    [self animationTomImage:@"knockout" withActionCount:81];
}
- (IBAction)bodyAction:(UIButton *)sender {
    [self animationTomImage:@"stomach" withActionCount:34];
    
}
- (IBAction)leftFootAction:(UIButton *)sender {
    [self animationTomImage:@"footLeft" withActionCount:30];
    
}
- (IBAction)rightFootAction:(UIButton *)sender {
    [self animationTomImage:@"footRight" withActionCount:30];
}


- (void)animationTomImage:(NSString *)name withActionCount:(NSInteger)count{
    
    //  如果当前正在执行动画，就不要在执行其他动画了
    if (self.tomImage.isAnimating) {
        return;
    }
    
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:count];
    
    for (NSInteger i = 0; i < count; i ++) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@_%02ld",name,i];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
        //      2、根据图片名称创建图片
        //    使用 imageNamed: 创建出来的图片默认会进行缓存
        //        UIImage *image =  [UIImage imageNamed:imageName];
        //   imageWithContentsOfFile: 不会缓存数据
        //      获取图片全路径，注意如果图片在images.xcassets中图片会被压缩到一个包中，无法获取它的全路径
        UIImage *image = [UIImage imageWithContentsOfFile:path];//图片路径
        
        [images addObject:image];
    }
    self.tomImage.animationImages = images;
    self.tomImage.animationDuration =count * 0.05;//动画的时间
    self.tomImage.animationRepeatCount =1;//动画执行的次数
    
    //开始动画
    [self.tomImage startAnimating];
    
    //动画播放完毕后，要手动清理内存
    [self.tomImage performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomImage.animationDuration + 1];
    
    
}



@end
