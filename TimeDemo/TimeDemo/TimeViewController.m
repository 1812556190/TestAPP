//
//  ViewController.m
//  TimeDemo
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "TimeViewController.h"
#import "NSDate+XSDate.h"
#define SecAng 6
#define MinAng 6
#define HourAng 0.5

//将度数转化成弧度
#define Angle2radion(angle) ((angle) / 180.0 * M_PI)

@interface TimeViewController (){
    UIView *_timeView;
    CALayer *hourLayer;
    CALayer *minutesLayer;
    CALayer *secondLayer;
}


@property (nonatomic, strong)UIImageView *timeImage;

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.timeImage];
    
    [self addSetChildLayers];
     [self currentTimeTo];//获取当前时间
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(currentTimeTo) userInfo:nil repeats:YES];
    
}

- (void)addSetChildLayers{
    //时针
    hourLayer = [[CALayer alloc] init];
    [self.view.layer addSublayer:hourLayer];
    hourLayer.bounds = CGRectMake(0, 0,27,60);
    hourLayer.position = self.view.center;
    hourLayer.anchorPoint = CGPointMake(0.5,0.8);
    hourLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);
    
    
    //分针
    minutesLayer = [[CALayer alloc] init];
    [self.view.layer addSublayer:minutesLayer];
    //    hourLayer.backgroundColor = [UIColor redColor].CGColor;
    minutesLayer.bounds = CGRectMake(0, 0,21,64);
    minutesLayer.position = self.view.center;
    minutesLayer.anchorPoint = CGPointMake(0.5,0.8);
    minutesLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);
    
    
    //秒针
    secondLayer = [[CALayer alloc] init];
    [self.view.layer addSublayer:secondLayer];
//        hourLayer.backgroundColor = [UIColor redColor].CGColor;
    secondLayer.bounds = CGRectMake(0, 0,9, 80);
    secondLayer.position = self.view.center;
    secondLayer.anchorPoint = CGPointMake(0.5,0.8);
    secondLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
    
    
    
}

#pragma mark - 改变偏移(让时钟转起来)
- (void)changeTimeFrome:(CGFloat)hourAngle withMinutesAngle:(CGFloat)minutesAngle withSecAngle:(CGFloat)secAngle{
    //一定要将角度转成弧度
     secondLayer.transform = CATransform3DMakeRotation(Angle2radion(secAngle), 0, 0, 1);
    minutesLayer.transform = CATransform3DMakeRotation(Angle2radion(minutesAngle), 0, 0, 1);
    hourLayer.transform = CATransform3DMakeRotation(Angle2radion(hourAngle), 0, 0, 1);
}

//获取当前时间
- (void)currentTimeTo{
    NSCalendar *calendar = [NSCalendar currentCalendar];//创建日历
    
    NSDateComponents *com = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];//取出需要的时间(过滤)
    NSInteger secTime = com.second;//获取当前秒
    NSInteger minTime = com.minute;//获取当前分
    NSInteger hourTime = com.hour;//获取当前时(12小时)
    
    CGFloat secAng = secTime * SecAng;//计算出秒针的角度
    CGFloat minAng = minTime * MinAng;//计算出分针的角度
    CGFloat hourAng = hourTime * 30 + minTime * HourAng;//计算出时针的角度
    
    [self changeTimeFrome:hourAng withMinutesAngle:minAng withSecAngle:secAng];
}






#pragma mark - 懒加载视图
- (UIImageView *)timeImage{
    if (!_timeImage) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, 200, 200);
        imageView.center = self.view.center;
        imageView.contentMode = UIViewContentModeScaleAspectFit;//等比例显示
        imageView.image = [UIImage imageNamed:@"dial"];
        _timeImage = imageView;
    }
    return _timeImage;
  
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
