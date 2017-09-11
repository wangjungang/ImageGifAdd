//
//  thirdViewController.m
//  ImageGifAdd
//
//  Created by 王俊钢 on 2017/9/10.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "thirdViewController.h"
#import "LLGifImageView.h"
#import "LLGifView.h"

@interface thirdViewController ()
@property (nonatomic, strong) LLGifView *gifView;
@property (nonatomic, strong) LLGifImageView *gifImageView;

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"本地gif图片";
    
    [self gif01];
    //[self gif02];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gif01
{
    [self removeGif];
    
    //方法1:适用于帧数少的gif动画
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"example" ofType:@"gif"]];
    _gifView = [[LLGifView alloc] initWithFrame:CGRectMake(100, 100, 200, 80) data:localData];
    [self.view addSubview:_gifView];
    [_gifView startGif];
}

-(void)gif02
{
    [self removeGif];
    //方法2:适用于帧数多的gif动画
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"888" ofType:@"gif"];
    _gifImageView = [[LLGifImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 80) filePath:filePath];
    [self.view addSubview:_gifImageView];
    [_gifImageView startGif];

}

//方式三：显示从网络获取的Gif图片
- (void)wangluogif {
    [self removeGif];
    //此处使用异步加载
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic19.nipic.com/20120222/8072717_124734762000_2.gif"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (urlData) {
                _gifView = [[LLGifView alloc] initWithFrame:CGRectMake(100, 300, 200, 80) data:urlData];
                [self.view addSubview:_gifView];
                [_gifView startGif];
            }
            else {
                NSLog(@"请允许应用访问网络");
            }
        });
    });
}

- (void)removeGif {
    if (_gifView) {
        [_gifView removeFromSuperview];
        _gifView = nil;
    }
    if (_gifImageView) {
        [_gifImageView removeFromSuperview];
        _gifImageView = nil;
    }
}

@end
