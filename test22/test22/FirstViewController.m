//
//  FirstViewController.m
//  test22
//
//  Created by dqy on 2019/3/1.
//  Copyright © 2019年 dqy. All rights reserved.
//

#import "FirstViewController.h"
#import "test22-Swift.h"

@interface FirstViewController ()<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
}
//@property (nonatomic,strong)UIWebView *webView;

@property (NS_NONATOMIC_IOSONLY, readonly, strong) UITableView *targetTableView;
@property (nonatomic,strong)NSString *content1;
@property (nonatomic,strong)NSString *content2;

@end

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self printSysFonts];
    
    if (!_targetTableView) {
        _targetTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _targetTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _targetTableView.delegate = self;
        _targetTableView.dataSource = self;
        [_targetTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:_targetTableView];
    }
    
    [self loadwebV];
    
    [testSwCall logStringWithStr:@"sfs是广发地方" ];

    [testSwCall printArr];
}

-(void)printSysFonts
{
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    NSLog(@"当前字体。。。 %@",font);
    NSMutableArray *familyNameArray = [[NSMutableArray alloc] init];
    NSArray* familyNamesAll = [UIFont familyNames];
    for (id family in familyNamesAll) {
        NSArray* fonts = [UIFont fontNamesForFamilyName:family];
        for (id font in fonts)
        {
            [familyNameArray addObject:font];
            
        }
    }
    NSLog(@"所有字体 %@",familyNameArray);
    
}

-(void)loadwebV
{
//    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
//    _webView.delegate = self;
//    _webView.scrollView.scrollEnabled = NO;
////    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.testin.cn/business/about.htm" ]]];   //@"https://www.baidu.com/"
////    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com" ]]];
//    self.webView.scalesPageToFit = YES;
    
    _content1 = @"<span style=\"font-family:宋体;color:#0000FF;font-weight:normal;font-size:23.0000pt;\"><span>现支持有微信支付、支付宝支付和零钱支付</span></span><span style=\"font-family:宋体;font-weight:normal;font-size:12.0000pt;\"><span>，</span></span><span style=\"font-family:宋体;color:#FF0000;font-weight:normal;font-size:11.0000pt;\"><span>如是微信</span>/<span>零钱支付客户退款是会直接退款到零钱的</span></span><span style=\"font-family:宋体;font-weight:normal;font-size:19.0000pt;\"><span>，如是支付宝支付会原路退回（支付宝余额直接退回支付宝，支付宝绑定的银行卡也会直接退回银行卡，银行卡退回会稍慢一些）；</span></span><span style=\"font-family:宋体;color:#0000FF;font-weight:normal;font-size:10.0000pt;\">APP<span>只支持支付宝支付和零钱支付</span></span>  <img src=\"http://img.zxyjsc.com/G1/M00/0B/9A/rBISiFtldhOAG2EIAAC76PZC1-Q837.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/0E/9A/rBLh9ltldhOAKXf-AADR6-t6S50707.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/0E/9A/rBLh91tldhOAKMHNAACX5IoL5OU012.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/0B/9A/rBISiFtldhOAZnuCAADae7Lukhs552.jpg\" alt=\"\" />";



    _content2= @"<img src=\"http://img.zxyjsc.com/G1/M00/08/7A/rBISiFpUiROAU4ruAAKk0IPqd80696.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/08/7A/rBLh9lpUiROANnmzAAVDXB1QpMM395.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/08/7A/rBLh91pUiROAfResAAUCPYeRb-A776.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/08/7A/rBISiFpUiRSAd4A6AAbNkxn86Jk742.jpg\" alt=\"\" /><img src=\"http://img.zxyjsc.com/G1/M00/08/7A/rBLh9lpUiRSAJND7AAOTtSo5kt0640.jpg\" alt=\"\" />  <span style=\"font-family:宋体;color:#0000FF;font-weight:normal;font-size:11.0000pt;\"><span>现支持有微信支付、支付宝支付和零钱支付</span></span><span style=\"font-family:宋体;font-weight:normal;font-size:11.0000pt;\"><span>，</span></span><span style=\"font-family:宋体;color:#FF0000;font-weight:normal;font-size:11.0000pt;\"><span>如是微信</span>/<span>零钱支付客户退款是会直接退款到零钱的</span></span><span style=\"font-family:宋体;font-weight:normal;font-size:11.0000pt;\"><span>，如是支付宝支付会原路退回（支付宝余额直接退回支付宝，支付宝绑定的银行卡也会直接退回银行卡，银行卡退回会稍慢一些）；</span></span><span style=\"font-family:宋体;color:#0000FF;font-weight:normal;font-size:11.0000pt;\">APP<span>只支持支付宝支付和零钱支付</span></span>";


//    [self.webView loadHTMLString:_content1 baseURL:nil];

}


#pragma mark - TableViewDelegate & TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row %2== 0){
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//            [cell.contentView addSubview:_webView];
            /* 忽略点击效果 */
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.backgroundColor =[UIColor purpleColor];
        
//        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
//        webView.delegate = self;
//        webView.scrollView.scrollEnabled = NO;
//        //    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.testin.cn/business/about.htm" ]]];   //@"https://www.baidu.com/"
//        //    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com" ]]];
//        webView.scalesPageToFit = YES;
//        [cell.contentView addSubview:webView];
//
//        if (indexPath.row %4==0) {
//            if (webView.isLoading) {
//
//            }else{
////            [webView loadHTMLString:_content2 baseURL:nil];
//            }
//        }
//        else{
//            if (webView.isLoading) {
//
//            }else{
//            [webView loadHTMLString:_content1 baseURL:nil];
//            }
//        }
        
        
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[_content1 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        cell.textLabel.attributedText = attrStr;
//        [cell.textLabel sizeToFit];

        return cell;
    }else{
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"index====%ld",(long)indexPath.row];
        cell.backgroundColor=[UIColor orangeColor];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row %2 == 0){
        /* 通过webview代理获取到内容高度后,将内容高度设置为cell的高 */
//        return _webView.frame.size.height;
//        return UITableViewAutomaticDimension;       //自动高度
        return 200;
    }else{
        return 100;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIWebView Delegate Methods
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    //使用js 方法计算web高度
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    CGRect frame0 = webView.frame;
    webView.frame = CGRectMake(frame0.origin.x, frame0.origin.y, frame0.size.width, height);
    
//    //获取到webview的高度
//    CGFloat height = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
//    self.webView.frame = CGRectMake(self.webView.frame.origin.x,self.webView.frame.origin.y, kScreenWidth, height);
//    [self.targetTableView reloadData];
}


@end
