//
//  UIBarButtonItem+Extension.m
//  03-黑团
//
//  Created by zhenHua on 15/2/4.
//  Copyright (c) 2015年 GeekerHua. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (instancetype)itemWithImage:(NSString *)imageName highlightName:(NSString *)highlightName target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // !!!: 抽取代码,设置按钮的frame由它的图片尺寸决定
    btn.frame = (CGRect){CGPointZero,btn.currentImage.size};
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}
@end
