# FYNight
一套实现夜间模式的简单第三方


# 夜间模式的使用方式
## 使用前的设置:
### 1-- pch文件的设置:
 - 在build Settings中搜索header, 找到Apple LLVM 7.0 - Language 下面的Prefix Header.
> 在后面设置:
 '$(SRCROOT)/夜间/Night/PrefixHeader.pch'  夜间: 工程名称

### 2—设置UIView+RemoveNotifition 为MRC

 - 在 Build Phases 下的Compile Sources找到UIView+RemoveNotifition, 设置其为 '<-fno-objc-arc.>'



## 背景颜色的设置
 - 1—在AppDelegate中首先设置是否是夜间模式(这里使用的是NSUserDefaults)
'<[ThemeManage shareThemeManage].isNight = [[NSUserDefaults standardUserDefaults] boolForKey:@"night"];>'

 - 2—为每一个控件设置颜色
调用NightWithType方法
'<[控件 NightWithType:UIViewColorTypeNormal];>'

 - 3—模式切换方法
//改变单例中的isNight
'<[ThemeManage shareThemeManage].isNight = ![ThemeManage shareThemeManage].isNight;>'
//发送改变颜色通知
'<[[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil]; '>
//修改沙盒信息
[[NSUserDefaults standardUserDefaults] setBool:[ThemeManage shareThemeManage].isNight forKey:@"night"];

Label中字体颜色的设置
[label NightWithType:UIViewColorTypeNormal];


## 夜间模式颜色的自定义

### 背景颜色的自定义
 - 1—	在ThemeManage中设置需要添加的颜色
例如:
@property(nonatomic, retain)UIColor *color2;
 - 2—	在.m中设置对应的属性
设置白天和夜间模式
 - 3—	在UIView+ThemeChange中添加对应的颜色类型
在UIViewColorType的枚举中添加UIViewColorType2

这样就可以使用UIViewColorType2了.


### UILabel字体颜色的自定义
 - 前两步与上面的一致
 - 3—  在UILabel+ThemeChange中添加对应的颜色属性
注意: LabelColorBlack一定要放在第一个, 不用动, 这是系统默认的颜色,如果你修改后, label以及button上的颜色就会改变, 添加请在最后添加


