//
//  ZJViewController.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "ZJViewController.h"
#import "ViewController.h"

@interface ZJViewController ()
- (IBAction)push:(id)sender;

@end

@implementation ZJViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)push:(id)sender {
    [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
}
@end
