//
//  UITabBar+ThemeChange.m
//  夜间
//
//  Created by dllo on 15/10/26.
//  Copyright © 2015年 直到世界的尽头. All rights reserved.
//

#import "UITabBar+ThemeChange.h"

@implementation UITabBar (ThemeChange)

-(void)changeColor
{
    [super changeColor];
    
    [self setBarTintColor:[ThemeManage shareThemeManage].bgColor];
    [self setTintColor:[ThemeManage shareThemeManage].navBarColor];
}

@end
