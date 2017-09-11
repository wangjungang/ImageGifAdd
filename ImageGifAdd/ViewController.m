//
//  ViewController.m
//  ImageGifAdd
//
//  Created by 王俊钢 on 2017/9/9.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "gifCell.h"
#import "UIImage+GIF.h"
#import "UIImageView+WebCache.h"

//#import "FLAnimatedImageView+WebCache.h"
#import "FLAnimatedImageView.h"

#import "secondViewController.h"
#import "thirdViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *table;
@end

static NSString *tableidentfid = @"tableidentfid";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.table];
    self.table.tableFooterView = [UIView new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getters

-(UITableView *)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _table.dataSource = self;
        _table.delegate = self;
    }
    return _table;
}

#pragma mark - UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    gifCell *cell = [tableView dequeueReusableCellWithIdentifier:tableidentfid];
    if (!cell) {
         cell = [[gifCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableidentfid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        secondViewController *vc = [[secondViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row==1) {
        thirdViewController *vc = [[thirdViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }

}
@end
