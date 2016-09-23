//
//  YYTabBar.h
//  iOS-Example-demo
//
//  Created by Arvin on 16/9/23.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYTabBar;
@protocol YYTabBarDelegate <NSObject>

@optional
/// 代理方法
- (void)tabBar:(YYTabBar *)tabBar didSelectedIndex:(NSInteger)index;
@end

@interface YYTabBar : UITabBar
/// 代理属性
@property (nonatomic, weak) id<YYTabBarDelegate> tabDelegate;

@end
