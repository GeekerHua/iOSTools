//
//  UIBarButtonItem+Extension.h
//  03-黑团
//
//  Created by zhenHua on 15/2/4.
//  Copyright (c) 2015年 GeekerHua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  返回创建好的barButtonItem
 *
 *  @param imageName     图片名称
 *  @param highlightName 高亮图片名称
 *  @param target        点击item会调用action方法
 *  @param action        点击执行的方法
 */
+ (instancetype)itemWithImage:(NSString *)imageName highlightName:(NSString *)highlightName target:(id)target action:(SEL)action;



@end
