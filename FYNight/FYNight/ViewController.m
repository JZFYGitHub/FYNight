//
//  ViewController.m
//  FYNight
//
//  Created by dllo on 15/11/16.
//  Copyright © 2015年 直到世界的尽头. All rights reserved.
//

#import "ViewController.h"
#import "NextCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self.view NightWithType:UIViewColorTypeNormal];
    
    UIImage *barButtonImage = [ThemeManage shareThemeManage].isNight ? [UIImage imageNamed:@"yejian"] : [UIImage imageNamed:@"rijian"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:barButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction:)];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    label1.text = @"灰色字体, Normal背景";
    [label1 NightWithType:UIViewColorTypeNormal];
    [label1 NightTextType:LabelColorGray];
    [self.view addSubview:label1];
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 200, 40)];
    label2.text = @"黑色字体, Normal背景";
    [label2 NightTextType:LabelColorBlack];
    [label2 NightWithType:UIViewColorTypeNormal];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    label3.text = @"Type1背景";
    [label3 NightTextType:LabelColorBlack];
    [label3 NightWithType:UIViewColorType1];
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 100, 40)];
    label4.text = @"Type2背景";
    [label4 NightTextType:LabelColorBlack];
    [label4 NightWithType:UIViewColorType2];
    [self.view addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];
    label5.text = @"Clear背景";
    [label5 NightTextType:LabelColorBlack];
    [label5 NightWithType:UIViewColorTypeClear];
    [self.view addSubview:label5];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 50, 100, 40);
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 10;
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

-(void)buttonAction
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flow.itemSize = CGSizeMake(100, 100);
    
    NextCollectionViewController *vc = [[NextCollectionViewController alloc] initWithCollectionViewLayout:flow];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)rightBarButtonAction:(UIBarButtonItem *)barButton
{
    [ThemeManage shareThemeManage].isNight = ![ThemeManage shareThemeManage].isNight;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
    [[NSUserDefaults standardUserDefaults] setBool:[ThemeManage shareThemeManage].isNight forKey:@"night"];
    UIImage *barButtonImage = [ThemeManage shareThemeManage].isNight ? [UIImage imageNamed:@"yejian"] : [UIImage imageNamed:@"rijian"];
    [barButton setImage:barButtonImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
