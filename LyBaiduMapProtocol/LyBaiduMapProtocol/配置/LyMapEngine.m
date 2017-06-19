//
//  LyMapEngine.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMapEngine.h"
#import "LyMapViewModel.h"

@interface LyMapEngine ()

@property(nonatomic,strong)LyMapViewModel *viewModel;
@property(nonatomic,assign)BOOL           isSetAppKey;

@end

@implementation LyMapEngine

#pragma mark - 懒加载
static LyMapEngine *manager = nil;
+ (instancetype)shareManger
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[LyMapEngine alloc] init];
        }
    });
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (manager == nil) {
                manager = [super allocWithZone:zone];
            }
        });
    }
    return manager;
}

- (id)copy
{
    return manager;
}

- (id)mutableCopy
{
    return manager;
}

- (id<LyMapFactory>)creatFactory
{
    [self.viewModel initViewModel];
    
    for (LyMapModel *model in self.viewModel.arrayModel)
    {
        if (model.isOpen)
        {
            id<LyMapFactory> factory = [[NSClassFromString(model.class) alloc] init];
            if (!self.isSetAppKey) {
                [factory setupAppKey:model.appKey];
                self.isSetAppKey = YES;
            }
            return factory;
        }
    }
    
    return nil;
}

#pragma mark - get

- (LyMapViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[LyMapViewModel alloc] init];
    }
    return _viewModel;
}

@end
