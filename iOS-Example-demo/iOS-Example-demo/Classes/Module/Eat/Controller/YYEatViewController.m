//
//  YYEatViewController.m
//  iOS-Example-demo
//
//  Created by Arvin on 16/9/23.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "YYEatViewController.h"

static NSString *const CELLID = @"CELLIDENTIFIER";

@interface YYEatViewController ()<UITableViewDelegate,UITableViewDataSource>
/// tableView
@property (nonatomic, strong) UITableView *tableView;
/// 测试的数据源
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, weak) UIButton *topButton;
@end

@implementation YYEatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    [self.tableView setTableHeaderView:({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor brownColor];
        imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
        imageView;
    })];
    
    self.dataSource = [NSMutableArray array];
    for (NSInteger section = 0; section < 2; section++) {
        NSMutableArray *sourceArr = [NSMutableArray array];
        for (NSInteger row = 0; row < 5; row++) {
            [sourceArr addObject:[NSString stringWithFormat:@"%zd-%zd",section,row]];
        }
        [self.dataSource addObject:sourceArr];
    } 
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%zd--%zd",indexPath.section,indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}


#pragma mark -
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView =
        [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [tableView setRowHeight:60];
        [tableView setDelegate:self];
        [tableView setDataSource:self];
        [self.view addSubview:tableView];
        [self setTableView:tableView];
        [tableView setShowsVerticalScrollIndicator:NO];
        [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSDictionary *views = NSDictionaryOfVariableBindings(tableView);
        NSString *horizontal = @"H:|-0-[tableView]-0-|", *vertical = @"V:|-0-[tableView]-0-|";
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:horizontal options:0 metrics:nil views:views]];
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:vertical options:0 metrics:nil views:views]];
    }
    return _tableView;
}

@end
