从底部弹出的分享菜单框,可自定义其中分享项,弹框顶部带圆角的.

使用方法: 

    YXCustomActionSheet *shareSheet = [[YXCustomActionSheet alloc] init]; NSArray *contentArray = @[@{@"name":@"微信好友",@"icon":@"icon_weixin"}, @{@"name":@"朋友圈",@"icon":@"icon_pengyouquan"}, @{@"name":@"QQ好友",@"icon":@"shareIcon_qq"}, @{@"name":@"QQ空间",@"icon":@"shareIcon_qzone"}, @{@"name":@"微博",@"icon":@"shareIcon_weibo"}, @{@"name":@"微博私信",@"icon":@"shareIcon_weiboCnt"}, @{@"name":@"复制链接",@"icon":@"icon_lianjie"}]; [shareSheet showInView:[UIApplication sharedApplication].keyWindow contentArray:contentArray];
    
    shareSheet.customActionSheetButtonClick = ^(YXActionSheetButton *button){
    //各事件处理
    
        };

CocoaPods安装:

 pod 'DqyShareActionSheet'
