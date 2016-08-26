//
//  MyBlock.m
//  Block_使用注意事项
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MyBlock.h"
typedef void(^myBlock)();

@interface MyBlock (){
    NSObject *_obj2;
}

@property (nonatomic, copy)myBlock block;

@property (nonatomic, strong)NSObject *obj;

@end
@implementation MyBlock


//
//- (void)circularReference{
//    //当双方相互持有彼此时就会造成循环引用
//    self.block = ^{
//        NSLog(@"%@",self.obj);
//        
//        [self modfi];
//    };
//}

- (void)toooo{
    /*
    NSObject *obj = [[NSObject alloc ] init];
    NSLog(@"obj - -- %ld",[obj retainCount]);
    
    _obj2 = [[NSObject alloc] init];
    NSLog(@"obj2 - -- %ld",[_obj2 retainCount]);
    
    self.block = ^{
        NSLog(@"obj++++%ld",[obj retainCount]);
        
        NSLog(@"obj2++++%ld",[_obj2 retainCount]);
    };
    self.block();
    
    NSLog(@"self====%ld",[self retainCount]);
      */
    
    __weak typeof(self)weakSelf = self;
    
    //当双方相互持有彼此时就会造成循环引用
    self.block = ^{
        NSLog(@"%@",weakSelf.obj);
        
        [weakSelf modfi];
    };
    
    self.block();
    
    //不会造成循环引用，myBlock为局部变量。
    myBlock myBlock = ^{
        NSLog(@"%@",self.obj);
    };
    myBlock();
    
}

- (void)dealloc{
    NSLog(@"对象销毁了");
}


- (void)modfi{
    
}




@end
