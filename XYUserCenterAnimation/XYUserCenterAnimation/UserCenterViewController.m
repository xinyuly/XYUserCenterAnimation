//
//  UserCenterViewController.m
//  VapingTour
//
//  Created by smok on 16/9/9.
//  Copyright © 2016年 IVPS. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UserCenterHeader.h"

#define OFFSETY 64
#define HEADERH 280
@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
@end
@interface UserCenterViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UserCenterHeader *headerView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation UserCenterViewController 
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"Lucy";
    self.navigationItem.titleView = self.titleLabel;
    self.titleLabel.alpha = 0;
    self.titleLabel.hidden = YES;

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)initViews {
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 280);
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.frame = CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height+64);
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    //向上滚
    CGFloat alpha = (offsetY-10)/OFFSETY;
    //    NSLog(@"%lf",alpha);
    if (alpha > 1) {
        alpha = 0.99;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:56/255.0 green:58/255.0 blue:65/255.0 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.headerView layoutSubViewWhenScroll:offsetY];
    if (alpha < 0) {
        self.titleLabel.hidden = YES;
    } else {
        self.titleLabel.hidden = NO;
    }
    self.titleLabel.alpha = alpha;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = @"test";
    return cell;
}
#pragma mark - setter && getter
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

- (UserCenterHeader *)headerView {
    if (_headerView == nil) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"UserCenterHeader" owner:self options:nil] firstObject];
    }
    return _headerView;
}

@end
