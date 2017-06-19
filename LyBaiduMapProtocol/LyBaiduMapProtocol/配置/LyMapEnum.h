//
//  LyMapEnum.m
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

typedef enum {
    LyUserTrackingModeNone = 0,             /// 普通定位模式
    LyUserTrackingModeHeading,              /// 定位方向模式
    LyUserTrackingModeFollow,               /// 定位跟随模式
    LyUserTrackingModeFollowWithHeading,    /// 定位罗盘模式
}LyUserTrackingMode;
