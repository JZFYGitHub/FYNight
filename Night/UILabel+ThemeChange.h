//
//  UILabel+ThemeChange.h
//  夜间模式9-27
//
//  Created by dllo on 15/9/27.
//  Copyright (c) 2015年 直到世界的尽头. All rights reserved.
//

#import <UIKit/UIKit.h>

/**字体颜色的枚举*/
typedef enum : NSUInteger {
    /**白天黑色, 夜间白色*/
    LabelColorBlack,
    /**白天灰色, 夜间白色*/
    LabelColorGray,
} LabelColor;

@interface UILabel (ThemeChange)

@property(nonatomic, assign)id textType;
-(void)changeColor;
/**设置字体的颜色*/
-(void)NightTextType:(LabelColor)type;

@end
