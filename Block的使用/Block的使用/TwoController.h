//
//  TwoController.h
//  Block的使用
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 Lingser. All rights reserved.
//
typedef void(^changeColor)(id);
typedef void(^myBlock)(id,id) ;
#import <UIKit/UIKit.h>

@interface TwoController : UIViewController
//声明一个Block，这个Block必须遵循的协议
@property (nonatomic, copy)changeColor backColor;

@property (nonatomic, copy) changeColor passWordBlock;

@property (nonatomic, copy) myBlock myblock;
@end
