//
//  LyMapModel.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyMapModel : NSObject

@property(nonatomic,copy  )NSString *appKey;
@property(nonatomic,copy  )NSString *class;
@property(nonatomic,assign)BOOL     isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
