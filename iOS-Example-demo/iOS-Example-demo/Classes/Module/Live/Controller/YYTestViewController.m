//
//  YYTestViewController.m
//  iOS-Example-demo
//
//  Created by Arvin on 16/9/25.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "YYTestViewController.h"

@interface YYTestViewController ()<UITableViewDelegate, UITableViewDataSource>
/// tableView
@property (nonatomic, strong) UITableView *tableView;
/// 测试的数据源
@property (nonatomic, strong) NSMutableArray *dataSource;
///
@property (nonatomic, weak) UIButton *topButton;
@end

@implementation YYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:({
        UIButton *topButton = [[UIButton alloc] init];
        topButton.frame = CGRectMake(self.view.frame.size.width-65, self.view.frame.size.height - 120, 50, 50);
        topButton.backgroundColor = [UIColor orangeColor];
        topButton.layer.cornerRadius = 25;
        topButton.layer.masksToBounds = YES;
        [topButton setTitle:@"置顶" forState:UIControlStateNormal];
        [topButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [topButton addTarget:self action:@selector(toTop) forControlEvents:UIControlEventTouchUpInside];
        self.topButton = topButton;
        topButton;
    })];
    
    [self.tableView setTableFooterView:({
        UIView *footerView = [[UIView alloc] init];
        footerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
        footerView.backgroundColor = [UIColor clearColor];
        [footerView addSubview:({
            UIButton *button = [[UIButton alloc] init];
            button.frame = CGRectMake(30, 20, footerView.frame.size.width-60, 40);
            button.layer.cornerRadius = 5;
            button.layer.masksToBounds = YES;
            button.backgroundColor = [UIColor redColor];
            [button addTarget:self action:@selector(btnClick:)
             forControlEvents:UIControlEventTouchUpInside];
            button;
        })];
        footerView;
    })];
}


- (void)btnClick:(UIButton *)button {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point  = scrollView.contentOffset;
    if (point.y > self.view.frame.size.height - 50) {
        [self.topButton setHidden:NO];
    } else {
        [self.topButton setHidden:YES];
    }
}

- (void)toTop {
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.topButton setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 0; i < 30; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataSource;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
