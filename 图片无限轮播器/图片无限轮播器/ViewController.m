//
//  ViewController.m
//  图片无限轮播器
//
//  Created by qshl on 14/12/22.
//  Copyright (c) 2014年 Hzh. All rights reserved.
//
#define kImageW 300
#define kImageH 130
#define kNo 5

#import "ViewController.h"
//#import "ZHPictureChange.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *centerView;
@property (nonatomic, strong) UIImageView *circleView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i + 1];
//        NSString *imageName = [NSString stringWithFormat:@"img_01"];

        UIImage *image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }
    self.imageArray = imageArray;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 100, 300, 130)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView = scrollView;
    // 创建三个宽度的scrollView， self就是创建好的额scrollView
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.contentSize = CGSizeMake(kImageW *3, kImageH);
    UIImageView *centerView = [[UIImageView alloc] initWithImage:imageArray[0]];
    UIImageView *circleView = [[UIImageView alloc] initWithImage:imageArray[1]];
    self.centerView = centerView;
    self.circleView = circleView;
    
    scrollView.contentOffset = CGPointMake(kImageW, 0);
    self.centerView.tag = 0;
    
    self.centerView.frame = CGRectMake(kImageW, 0, kImageW, kImageH);
    self.circleView.frame = CGRectMake(0, 0, kImageW, kImageH);
    scrollView = scrollView;
    [scrollView addSubview:self.centerView];
//    [self.scrollView addSubview:self.circleView];
    [self.view addSubview:scrollView];

    [self addTimer];
}
// 当滚动的时候
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 判断偏移量是否超过center的x
    CGFloat offSetX = scrollView.contentOffset.x;
    CGRect f = self.circleView.frame;
    int index = 0;
    if (offSetX > _centerView.frame.origin.x) { // 如果大于第二张图片的，需要展示第三张图片
//        NSLog(@"%@",NSStringFromCGRect(f));
        // f保存第三个位置的frame;
        f.origin.x = scrollView.contentSize.width - kImageW;
        index = (int)self.centerView.tag + 1;
        if (index >= kNo) {
            index = 0;
        }
    } else{ // 显示在左边
        f.origin.x = 0;
        index = (int)self.centerView.tag - 1;
        if (index < 0) {
            index = kNo -1;
        }
    } // index保存显示的图片的索引
    self.circleView.frame = f;
    self.circleView.tag = index; // ??因为之后要交换对象，所以在这里也要赋值，在这里可以保存index的值;
    self.circleView.image = self.imageArray[index];
    
    if (offSetX <= 0 | offSetX >= kImageW *2) { // 索引越界了
        // 换一下指针名称
        UIImageView *temp = self.centerView;
        self.centerView = self.circleView;
        self.circleView = temp;
        self.centerView.frame = self.circleView.frame;
        scrollView.contentOffset = CGPointMake(kImageW, 0);
//        NSLog(@"sdfsdf");
        [self.circleView removeFromSuperview];
    } else{
        [scrollView addSubview:self.circleView];
    }
    
}

- (void) next{
    [self.scrollView setContentOffset:CGPointMake(kImageW * 2, 0) animated:YES];
}
- (void) addTimer{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}
@end
