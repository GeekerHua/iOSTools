//
//  ZHPictureChange.h
//  图片无限轮播器
//
//  Created by qshl on 14/12/22.
//  Copyright (c) 2014年 Hzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHPictureChange : UIScrollView
@property (nonatomic, strong) NSArray *imageArray;


// 工厂方法
+ (instancetype) picktureChangeWithImageArray:(NSArray *)imageArray;
// 构造方法
- (instancetype) initWithImageArray:(NSArray *)array ;

@end
