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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.text = @"你好";
    
    [label NightWithType:UIViewColorTypeNormal];
    [label NightTextType:LabelColorGray];
    [self.view addSubview:label];
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 100, 40)];
    label1.text = @"世界";
    [label1 NightTextType:LabelColorBlack];
    [label1 NightWithType:UIViewColorTypeNormal];
    [self.view addSubview:label1];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 100, 100, 40);
    
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
