//
//  YYTabBarController.m
//  iOS-Example-demo
//
//  Created by Arvin on 16/9/23.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "YYTabBarController.h"
#import "YYNavigationController.h"
#import "YYEatViewController.h"
#import "YYDrinkViewController.h"
#import "YYPlayViewController.h"
#import "YYLiveViewController.h"
#import "YYTabBar.h"

@interface YYTabBarController ()<YYTabBarDelegate>

@end

@implementation YYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    YYTabBar *tabBar = [[YYTabBar alloc] init];
    tabBar.tabDelegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];

    [self setupAllChildViewControll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupAllChildViewControll {
    [self setChildViewController:[[YYEatViewController alloc] init]
                       withTitle:@"吃呗"
              andNormalIamgeName:@"ycy_yql_fx"
            andSelectedImageName:@"ycy_yql_fx_blue"];
    [self setChildViewController:[[YYDrinkViewController alloc] init]
                       withTitle:@"喝呗"
              andNormalIamgeName:@"ycy_yql_py"
            andSelectedImageName:@"ycy_yql_py_blue"];
    [self setChildViewController:[[YYPlayViewController alloc] init]
                       withTitle:@"玩呗"
              andNormalIamgeName:@"ycy_yql_sb"
            andSelectedImageName:@"ycy_yql_sb_blue"];
    [self setChildViewController:[[YYLiveViewController alloc] init]
                       withTitle:@"乐呗"
              andNormalIamgeName:@"ycy_yql_wd"
            andSelectedImageName:@"ycy_yql_wd_blue"];
}

- (void)setChildViewController:(UIViewController *)childControl withTitle:(NSString *)title andNormalIamgeName:(NSString *)norImageName andSelectedImageName:(NSString *)selImageName {
    YYNavigationController *navControl = [[YYNavigationController alloc] initWithRootViewController:childControl];
    [self addChildViewController:navControl];
    childControl.navigationItem.title = title;
    UIImage *norImage = [[UIImage imageNamed:norImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navControl.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:norImage selectedImage:selImage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
