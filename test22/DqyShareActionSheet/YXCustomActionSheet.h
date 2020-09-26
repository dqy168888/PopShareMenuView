//
//  YXCustomActionSheet.h
//  YXCustomActionSheet
//
//  Created by Houhua Yan on 16/7/14.
//  Copyright © 2016年 YanHouhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXActionSheetButton.h"

@protocol YXCustomActionSheetDelegate <NSObject>

@optional

- (void) customActionSheetButtonClick:(YXActionSheetButton *) btn;

@end


@interface YXCustomActionSheet : UIView

/**展示*/
- (void)showInView:(UIView *)superView contentArray:(NSArray *)contentArray;

- (void)showInView:(UIView *)superView contentArray:(NSArray *)contentArray titleString:(NSAttributedString *)titleStr;
- (void)showInView:(UIView *)superView contentArray:(NSArray *)contentArray titleString:(NSAttributedString *)titleStr column:(NSInteger)column;

@property (nonatomic, weak) id<YXCustomActionSheetDelegate> delegate;
@property (nonatomic,copy) void (^customActionSheetButtonClick)(YXActionSheetButton *);

@end
