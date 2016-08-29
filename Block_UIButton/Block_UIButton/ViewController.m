//
//  ViewController.m
//  Block_UIButton
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"
#import "XSButton.h"

@interface ViewController ()


@property(nonatomic, strong)XSButton *button;

@end

@implementation ViewController


- (XSButton *)button{
    if (!_button) {
        _button = [XSButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"按钮" forState:UIControlStateNormal];
        _button.frame = CGRectMake(100,200,100, 100);
        _button.backgroundColor = [UIColor redColor];
        [_button hand:^{
            NSLog(@"点击了----");//按钮点击事件
        }];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
