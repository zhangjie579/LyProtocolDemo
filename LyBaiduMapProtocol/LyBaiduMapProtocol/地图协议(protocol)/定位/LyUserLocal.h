//
//  LyUserLocal.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <CoreLocation/CLAvailability.h>
#import <CoreLocation/CLLocation.h>
#import <Foundation/Foundation.h>

@protocol LyUserLocal <NSObject>

@property (readonly, nonatomic,strong)id userLocal;//获取定位数据对象(百度是BMKUserLocation)

/// 位置更新状态，如果正在更新位置信息，则该值为YES
@property (readonly, nonatomic, getter=isUpdating) BOOL updating;

/// 位置信息，尚未定位成功，则该值为nil
@property (readonly, nonatomic,strong) CLLocation *location;

/// heading信息，尚未定位成功，则该值为nil
//@property (readonly, nonatomic, strong) CLHeading *heading;

/// 定位标注点要显示的标题信息
@property (strong, nonatomic) NSString *title;

/// 定位标注点要显示的子标题信息.
@property (strong, nonatomic) NSString *subtitle;

@end
