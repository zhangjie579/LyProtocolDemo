//
//  LyLocalProtocol.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LyUserLocal.h"
#import "LyLocalDelegate.h"
#import "LyMapEnum.h"

@protocol LyLocalProtocol <NSObject>

- (void)startLocal;//开始定位
- (void)stopLocal;//结束定位

@property(nonatomic,strong,readonly)id localManager;//定位

/// 设定定位模式，取值为：LyUserTrackingMode
@property(nonatomic,assign)LyUserTrackingMode userTrackingMode;

@property(nonatomic,weak)id<LyLocalDelegate> delegate;

@end
