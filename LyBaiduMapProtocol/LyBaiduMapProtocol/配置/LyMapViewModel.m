//
//  LyMapViewModel.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMapViewModel.h"

@implementation LyMapViewModel

- (void)initViewModel
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LyConfiger.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in array) {
        LyMapModel *model = [[LyMapModel alloc] initWithDict:dict];
        [self.arrayModel addObject:model];
    }
}

- (NSMutableArray<LyMapModel *> *)arrayModel
{
    if (!_arrayModel) {
        _arrayModel = [[NSMutableArray alloc] init];
    }
    return _arrayModel;
}

@end
