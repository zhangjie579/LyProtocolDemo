//
//  LyBaiduMapViewStatus.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyBaiduMapViewStatus.h"

@interface LyBaiduMapViewStatus ()

@property(nonatomic,strong)BMKMapStatus *mapStatus;

@end

@implementation LyBaiduMapViewStatus

- (instancetype)initWithMapStatus:(BMKMapStatus *)status
{
    if (self = [super init]) {
        self.mapStatus = status;
    }
    return self;
}

- (float)fLevel
{
    return self.mapStatus.fLevel;
}

- (void)setFLevel:(float)fLevel
{
    
}

- (float)fRotation
{
    return self.mapStatus.fRotation;
}

- (void)setFRotation:(float)fRotation
{
    
}

- (float)fOverlooking
{
    return self.mapStatus.fOverlooking;
}

- (void)setFOverlooking:(float)fOverlooking
{
    
}

- (CLLocationCoordinate2D)targetGeoPt
{
    return self.mapStatus.targetGeoPt;
}

- (void)setTargetGeoPt:(CLLocationCoordinate2D)targetGeoPt
{
    
}

- (CGPoint)targetScreenPt
{
    return self.mapStatus.targetScreenPt;
}

- (void)setTargetScreenPt:(CGPoint)targetScreenPt
{
    
}

@end
