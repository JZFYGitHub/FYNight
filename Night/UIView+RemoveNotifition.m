//
//  UIView+RemoveNotifition.m
//  FYNight
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 直到世界的尽头. All rights reserved.
//

#import "UIView+RemoveNotifition.h"
#import <objc/runtime.h>

@implementation UIView (RemoveNotifition)

//load方法会在类第一次加载的时候被调用
//调用的时间比较靠前，适合在这个方法里做方法交换
+ (void)load{
    //方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //获得系统的dealloc方法
        SEL systemSel = @selector(dealloc);
        //自己实现的将要被交换的方法的selector
        SEL swizzSel = @selector(myDealloc);
        //两个方法的Method
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        
        //交换两个方法的实现
        method_exchangeImplementations(systemMethod, swizzMethod);
    });
}

-(void)myDealloc
{
    [self myDealloc];
    
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
