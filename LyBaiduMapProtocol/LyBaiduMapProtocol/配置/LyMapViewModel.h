//
//  LyMapViewModel.h
//  LyBaiduMapProtocol
//
//  Created by 张杰 on 2017/6/19.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LyMapModel.h"

@interface LyMapViewModel : NSObject

@property(nonatomic,strong)NSMutableArray<LyMapModel *> *arrayModel;

- (void)initViewModel;

@end
