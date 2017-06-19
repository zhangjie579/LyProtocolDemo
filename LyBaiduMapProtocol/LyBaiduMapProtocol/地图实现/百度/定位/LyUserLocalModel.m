//
//  LyUserLocalModel.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyUserLocalModel.h"

@interface LyUserLocalModel ()

@property(nonatomic,strong)BMKUserLocation *userLocation;

@end

@implementation LyUserLocalModel

- (instancetype)initWithUserLocation:(BMKUserLocation *)userLocation
{
    if (self = [super init]) {
        self.userLocation = userLocation;
    }
    return self;
}

- (BOOL)isUpdating
{
    return self.userLocation.updating;
}

- (CLLocation *)location
{
    return self.userLocation.location;
}

@synthesize title = _title;
- (NSString *)title
{
    if (_title != nil) {
        return _title;
    }
    return self.userLocation.title;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
}

@synthesize subtitle = _subtitle;
- (NSString *)subtitle
{
    if (_subtitle != nil) {
        return _subtitle;
    }
    return self.userLocation.subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
    _subtitle = subtitle;
}

- (id)userLocal
{
    return self.userLocation;
}

@end
