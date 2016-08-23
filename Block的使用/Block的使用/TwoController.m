//
//  TwoController.m
//  Block的使用
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//


#import "TwoController.h"

@interface TwoController ()


@property (weak, nonatomic) IBOutlet UITextField *passWord;


@end

@implementation TwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"TWO视图完全显示");
}

- (void)dealloc{
    NSLog(@"TWodealloc");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIColor *color = [UIColor redColor];
    
//    self.backColor(color);
//    self.passWordBlock(self.passWord.text);
    
    self.myblock(self.passWord.text,color);
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"TWO");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
