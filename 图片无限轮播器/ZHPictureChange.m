//
//  ZHPictureChange.m
//  图片无限轮播器
//
//  Created by qshl on 14/12/22.
//  Copyright (c) 2014年 Hzh. All rights reserved.
//

#import "ZHPictureChange.h"
#define kImageW 300
#define kImageH 130
#define kNo 5
@interface ZHPictureChange ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIImageView *centerView;
@property (nonatomic, weak) UIImageView *circleView;
@property (nonatomic, assign) int index;

@end

@implementation ZHPictureChange
// 图片尺寸300 * 130
/**
 *  保存两张图片，中间那张，和第二张,同一屏幕最多同时出现两张图片
 1.刚开始只加载第一张图片，加载在中间;
 2.当向后划，第二张刚要出现时，加载第二张图片;
 3.当第二张图片完全出现时，更改两个图片的指针，并让最新的图片也就是中间的图片现实在中间，此时，改变scrollView的偏移量，偏移量是W，即现实位于中间的图片。，
 */
// 现实第一张和第二张图片
- (instancetype)initWithImageArray:(NSArray *)imageArray{
    if (self = [super init]) {

        // 创建三个宽度的scrollView， self就是创建好的额scrollView
        self.backgroundColor = [UIColor yellowColor];
        self.contentSize = CGSizeMake(kImageW *3, kImageH);
        self.centerView.frame = CGRectMake(kImageW, 0, kImageW, kImageH);
        self.circleView.frame = CGRectMake(0, 0, kImageW, kImageH);
        self.centerView.image = imageArray[0];
        self.circleView.image = imageArray[1];
        [self addSubview:self.centerView];
        [self addSubview:self.circleView];
    }
    return self;
}
/** 当将要开始拖动的时候 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

+ (instancetype)picktureChangeWithImageArray:(NSArray *)imageArray{
    
    return [[self alloc] initWithImageArray:imageArray];
    
}

@end
