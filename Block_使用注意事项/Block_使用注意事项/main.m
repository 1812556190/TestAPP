//
//  main.m
//  Block_使用注意事项
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyBlock.h"

//static int num = 2;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        
//        
//        void (^myBlock)() = ^(){
//            NSLog(@"---%d",num);
//        };
//        num = 3;
//        myBlock();
//        NSLog(@"++++%d",num);
//
        MyBlock *my = [[MyBlock alloc] init];
        [my toooo];
        
    }
    return 0;
}
