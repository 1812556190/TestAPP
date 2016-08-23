//
//  XSButton.h
//  Block_UIButton
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonBlock)();
@interface XSButton : UIButton


- (void)hand:(buttonBlock)buttonAction;

@end
