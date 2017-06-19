//
//  LyMapEngine.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//  引擎

#import <Foundation/Foundation.h>
#import "LyMapFactory.h"

/*引擎
 1.作用: 就是用于创建工厂(因为可能有多个工厂，比如华为，三星，apple)
 2.注意: 不能直接使用工厂的className,用json/xml配置，并且返回的是协议
 */
@interface LyMapEngine : NSObject

+ (instancetype)shareManger;

- (id<LyMapFactory>)creatFactory;

@end
