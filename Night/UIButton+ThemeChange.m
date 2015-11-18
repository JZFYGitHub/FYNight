//
//  UIButton+ThemeChange.m
//  夜间模式9-27
//
//  Created by dllo on 15/9/27.
//  Copyright (c) 2015年 直到世界的尽头. All rights reserved.
//

#import "UIButton+ThemeChange.h"

@implementation UIButton (ThemeChange)

-(void)changeColor
{
    [super changeColor];
    
    self.titleLabel.textColor = [ThemeManage shareThemeManage].textColor;
}

@end
