//
//  YYLiveViewController.m
//  iOS-Example-demo
//
//  Created by Arvin on 16/9/23.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "YYLiveViewController.h"
#import "YYTestViewController.h"

static NSString *const CELLID = @"CELLIDENTIFIER";

@interface YYLiveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YYLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    [self.tableView setTableHeaderView:({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
        imageView.image = [UIImage imageNamed:@"huoying17.jpg"];
        /*
        UIView *view1 = [[UIView alloc] init];
        view1.frame = (CGRect){self.view.center.x-30, 80, 60, 60};
        view1.backgroundColor = [UIColor magentaColor];
        view1.layer.cornerRadius = 30;
        view1.layer.masksToBounds = YES;
        [imageView addSubview:view1];
        */
        imageView;
    })];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell --> %zd",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YYTestViewController *testVC = [[YYTestViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}

#pragma mark -
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView =
        [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [tableView setRowHeight:60];
        [tableView setDelegate:self];
        [tableView setDataSource:self];
        [self.view addSubview:tableView];
        [self setTableView:tableView];
        [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSDictionary *views = NSDictionaryOfVariableBindings(tableView);
        NSString *horizontal = @"H:|-0-[tableView]-0-|", *vertical = @"V:|-(-20)-[tableView]-0-|";
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:horizontal options:0 metrics:nil views:views]];
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:vertical options:0 metrics:nil views:views]];
    }
    return _tableView;
}
@end
