//
//  LyCodeResult.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LyCodeResult <NSObject>

///地理编码位置
@property (nonatomic,assign) CLLocationCoordinate2D location;
///地理编码地址
@property (nonatomic,copy  ) NSString               *address;

@end
