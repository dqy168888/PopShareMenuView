//
//  YXCustomActionSheet.m
//  YXCustomActionSheet
//
//  Created by Houhua Yan on 16/7/14.
//  Copyright © 2016年 YanHouhua. All rights reserved.
//

#import "YXCustomActionSheet.h"


#define RGB(r, g, b)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define ColumnNum 4


#define iPadBig \
({BOOL isPadBig = NO;\
if (@available(iOS 11.0, *)) {\
isPadBig = ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0) && (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);\
}\
(isPadBig);})


#define iphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0) && (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);\
}\
(isPhoneX);})


@interface YXCustomActionSheet()
{
    UIView *_backView;
}
@end

@implementation YXCustomActionSheet

//原默认方式
- (void) showInView:(UIView *)superView contentArray:(NSArray *)contentArray
{
    [self showInView:superView contentArray:contentArray titleString:nil];
}

//可以设置标题方式
- (void)showInView:(UIView *)superView contentArray:(NSArray *)contentArray titleString:(NSAttributedString *)titleStr
{
    [self showInView:superView contentArray:contentArray titleString:titleStr column:ColumnNum];
}

//可以设置标题,列数方式
- (void)showInView:(UIView *)superView contentArray:(NSArray *)contentArray titleString:(NSAttributedString *)titleStr column:(NSInteger)column
{
    if (contentArray == nil || contentArray.count < 1) {
        return;
    }
    self.backgroundColor = [UIColor whiteColor];  //[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    
    [self addBackView:superView];

    CGFloat btnW = 70;
    CGFloat btnH = 70;
    int marginY = 22;
    CGFloat firstY = 68;
    
    for (int i = 0; i < contentArray.count; i++) {
        NSDictionary *dic = [contentArray objectAtIndex:i];
        NSString *name = dic[@"name"];
        NSString *icon = dic[@"icon"];
        YXActionSheetButton *btn = [YXActionSheetButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setTitle:name forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        CGFloat marginX = (self.frame.size.width - column * btnW) / (column + 1);
        int col = i % column;
        int row = i / column;
        CGFloat btnX = marginX + (marginX + btnW) * col;
        CGFloat btnY = firstY + (marginY + btnH) * row;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [self addSubview:btn];
    }
    
    //分享到
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = RGB(81, 95, 108);
    titleLabel.frame = CGRectMake(15, 5, self.frame.size.width-30, 50);
    titleLabel.numberOfLines=0;
    [self addSubview:titleLabel];
    
    if (titleStr.length==0) {
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.text = @"分 享";
    }
    else
    {
        if (titleStr.length>10) {
            titleLabel.font = [UIFont systemFontOfSize:14];
        }
        else{
            titleLabel.font = [UIFont boldSystemFontOfSize:16];
        }
        
        titleLabel.attributedText = titleStr;
    }
    
    //计算frame
    [superView addSubview:self];
    
    NSUInteger row = (contentArray.count - 1) / column;
    CGFloat height = firstY + 60 + (row +1) * (btnH + marginY)+ ((iphoneX || iPadBig)?20:0);
    
    CGFloat originY = [UIScreen mainScreen].bounds.size.height;
    self.frame = CGRectMake(0, originY, 0, height);
    [UIView animateWithDuration:0.25 animations:^{
        CGRect sF = self.frame;
        sF.origin.y = [UIScreen mainScreen].bounds.size.height - sF.size.height;        //重设区域坐标
        self.frame = sF;
    }];

    //取消
    UIButton *canleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat canW = self.frame.size.width;
    CGFloat canH = 40;
    CGFloat canY = self.frame.size.height - canH-20 -((iphoneX || iPadBig)?20:0);
    canleBtn.frame = CGRectMake(30, canY, canW-30*2, canH);
    [canleBtn setTitle:@"取 消" forState:UIControlStateNormal];
    canleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [canleBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    canleBtn.backgroundColor = RGB(238, 238, 238);
    canleBtn.layer.cornerRadius=40/2;
    [canleBtn addTarget:self action:@selector(tapBg) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:canleBtn];
    
    //分割线
//    UIView *line = [[UIView alloc] init];
//    CGFloat lineY = CGRectGetMinY(canleBtn.frame)  - 2;
//    line.frame = CGRectMake(25, lineY, [UIScreen mainScreen].bounds.size.width-50, 0.5);
//    line.backgroundColor = RGB(180, 180, 180);
//    [self addSubview:line];
   
    //设置部分圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners: UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];     //圆角路径
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}

- (void)setFrame:(CGRect)frame{
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    if (frame.size.height <= 0) {
        frame.size.height = 00;
    }
    frame.origin.x = 0;
    [super setFrame:frame];
}


#pragma mark - 添加背景视图
- (void) addBackView:(UIView *) superView
{
    _backView = [[UIView alloc] init];
    _backView.frame = superView.bounds;
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.4;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBg)];
    [_backView addGestureRecognizer:tap];
    [superView addSubview:_backView];
  
}

#pragma mark 点击背景阴影视图触发的方法
- (void)tapBg{
    [_backView removeFromSuperview];
    _backView = nil;
    [UIView animateWithDuration:0.25 animations:^{
        CGRect sf = self.frame;
        sf.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.frame = sf;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark 按钮被点击了
- (void)btnClick:(YXActionSheetButton *)btn{
    
    if ([_delegate respondsToSelector:@selector(customActionSheetButtonClick:)]) {
        [_delegate customActionSheetButtonClick:btn];
    }
    
    if (self.customActionSheetButtonClick) {
        self.customActionSheetButtonClick(btn);
    }
    [self tapBg];
}


@end
