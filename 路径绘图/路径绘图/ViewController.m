//
//  ViewController.m
//  路径绘图
//
//  Created by apple on 16/8/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"
#import "drweView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    drweView *view = [[drweView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:view];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
