//
//  ViewController.m
//  Block的使用
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "ViewController.h"
#import "TwoController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //定义block
    int (^myBlock)(int a, int b) = ^(int x, int y){
        return x + y;
    };
    
    
    [self moedfi:^(int a, int b) {
        NSLog(@"a + b = %d",a + b);
    }];
    
    
    NSLog(@"%d",myBlock(10,20));//调用Block
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"视图完全显示");
}

- (void)dealloc{
    NSLog(@"ONEdealloc");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TwoController *twoVc = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoController"];
    
//    twoVc.backColor = ^(UIColor *color){
//        self.view.backgroundColor = color;
//    };
//    twoVc.passWordBlock = ^(NSString *string){
//        self.passWord.text = string;
//    };
    twoVc.myblock = ^(NSString *string,UIColor *color){
        self.view.backgroundColor = [UIColor blueColor];
        self.passWord.text = string;
    };
    [self presentViewController:twoVc animated:YES completion:^{
        NSLog(@"LOG");
    }];
}

- (void)moedfi:(void(^)(int a, int b))kkk{
    
    NSLog(@"-------");
    
    kkk(100, 200);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
