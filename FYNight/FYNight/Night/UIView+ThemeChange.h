//
//  UIView+ThemeChange.h
//  夜间模式9-27
//
//  Created by dllo on 15/9/27.
//  Copyright (c) 2015年 直到世界的尽头. All rights reserved.
//

#import <UIKit/UIKit.h>

//颜色的定义(一个代表一套)
typedef NS_ENUM(NSInteger, UIViewColorType) {
    /**白天白色, 夜间黑色*/
    UIViewColorTypeNormal,
    /**白天蓝色, 夜间深灰*/
    UIViewColorType1,
    /**白天浅蓝, 夜间浅蓝*/
    UIViewColorType2,
    /**透明状态*/
    UIViewColorTypeClear
};

@interface UIView (ThemeChange)

/**定义颜色类型的属性, NSNumber类型*/
@property(nonatomic, assign)id type;
/**消息中心开始监听*/
-(void)startMonitor;
/**改变颜色的方法*/
-(void)changeColor;
/**设置颜色类型和对应颜色*/
-(void)NightWithType:(UIViewColorType)type;

/**设置字体颜色的方法*/
-(void)initTextColor;

@end
