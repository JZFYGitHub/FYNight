//
//  UINavigationBar+ThemeChange.m
//  夜间
//
//  Created by dllo on 15/10/26.
//  Copyright © 2015年 直到世界的尽头. All rights reserved.
//

#import "UINavigationBar+ThemeChange.h"

@implementation UINavigationBar (ThemeChange)

-(void)changeColor
{
    [super changeColor];
    
    [self setBarTintColor:[ThemeManage shareThemeManage].bgColor];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [ThemeManage shareThemeManage].navBarColor}];
    
    //改变电池栏Style
    if ([ThemeManage shareThemeManage].isNight) {
        [self setBarStyle:UIBarStyleBlackTranslucent];
    }
    else{
        [self setBarStyle:UIBarStyleDefault];
    }
}

@end
