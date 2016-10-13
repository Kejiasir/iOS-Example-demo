//
//  YYTabBar.m
//  iOS-Example-demo
//
//  Created by Arvin on 16/9/23.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "YYTabBar.h"
#import "UIView+Extension.h"

@interface YYTabBar ()
/// 中间按钮
@property (nonatomic, strong) UIButton *centerBtn;

@end

@implementation YYTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        //self.backgroundColor = [UIColor whiteColor];
        //[self setShadowImage:[UIImage imageWithColor:[UIColor blueColor]]];
        //[self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        
        UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [centerBtn setTag:10];
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"ycy_yql_fb"] forState:UIControlStateNormal];
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"ycy_yql_fb"] forState:UIControlStateHighlighted];
        [centerBtn addTarget:self action:@selector(centerBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centerBtn];
        self.centerBtn = centerBtn;
    }
    return self;
}

- (void)centerBtnDidClick:(UIButton *)button {
    if ([self.tabDelegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]) {
        [self.tabDelegate tabBar:self didSelectedIndex:button.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.centerBtn.centerX = self.centerX;
    self.centerBtn.centerY = self.h * 0.5 - 10;
    CGFloat width = self.centerBtn.currentBackgroundImage.size.width;
    CGFloat height = self.centerBtn.currentBackgroundImage.size.height;
    self.centerBtn.size = CGSizeMake(width, height);
    
    NSInteger index = 0;
    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:class]) {
            btn.w = self.w / 5;
            btn.x = btn.w * index;
            btn.h = self.h-5;
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
    [self bringSubviewToFront:self.centerBtn];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isHidden) {
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        if ([self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        } else {
            return [super hitTest:point withEvent:event];
        }
    } else {
        return [super hitTest:point withEvent:event];
    }
}

@end
