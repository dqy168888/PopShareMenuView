//
//  SecondViewController.m
//  test22
//
//  Created by dqy on 2019/3/1.
//  Copyright © 2019年 dqy. All rights reserved.
//

#import "SecondViewController.h"
#import "test22-Swift.h"
#import "YXCustomActionSheet.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试调用swift方法
    
    swTest2 *helloss = [[swTest2 alloc]initWithAddress:@"上海" gender:@" 男"];
    [helloss method];
    
    swTest2 *st = [[swTest2 alloc]initWithAddress:@"hjlkkg" gender:@" man"];
    [st method];
    
    
    [testSwCall log1];
    
    [testSwCall logStringWithStr:@"sfs" ];

}

- (void) setName:(NSString*) str
{
//    [str retain];
//    
//    [name release];
    _name = str;
    
}

- (void)setAddress:(NSString *)Address
{
    id t = [Address copy];
//    [_Address release];
    
    _Address = t;
    
}


- (IBAction)sharePageAct:(id)sender {
    YXCustomActionSheet *shareSheet = [[YXCustomActionSheet alloc] init];
    NSArray *contentArray = @[@{@"name":@"微信好友",@"icon":@"icon_weixin"},
                              @{@"name":@"朋友圈",@"icon":@"icon_pengyouquan"},
                              @{@"name":@"QQ好友",@"icon":@"shareIcon_qq"},
                              @{@"name":@"QQ空间",@"icon":@"shareIcon_qzone"},
                              @{@"name":@"微博",@"icon":@"shareIcon_weibo"},
                              @{@"name":@"微博私信",@"icon":@"shareIcon_weiboCnt"},
                              @{@"name":@"复制链接",@"icon":@"icon_lianjie"}];
    [shareSheet showInView:[UIApplication sharedApplication].keyWindow contentArray:contentArray];
    
    shareSheet.customActionSheetButtonClick = ^(YXActionSheetButton *button){
        
        switch(button.tag)
        {
            case 0: // 微信好友
            {
            }
                break;
                
            case 1: // 朋友圈
            {
            }
                break;
                
            case 2:
            {
            }
                break;
                
            case 3:
            {
            }
                break;
                
            case 4:
            {
            }
                break;
                
            case 5:
            {
            }
                break;
                
            case 6:
            {
            }
                break;
                
            default:
                break;
                
        }
    };
    
}



@end
