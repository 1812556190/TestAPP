//
//  XSButton.m
//  Block_UIButton
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSButton.h"

@interface XSButton (){
    buttonBlock _block;
}

@end


@implementation XSButton


- (void)hand:(buttonBlock)buttonAction{
    
    _block = buttonAction;
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction{
    if (_block) {
        
        _block();
    }
}

@end
