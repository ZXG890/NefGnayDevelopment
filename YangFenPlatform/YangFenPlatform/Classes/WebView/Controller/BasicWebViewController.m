//
//  BasicWebViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "BasicWebViewController.h"
#import <WebKit/WebKit.h>

@interface BasicWebViewController ()<WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate>
@property (nonatomic,strong) WKWebView *webVeiw;
@property (nonatomic,strong) UIProgressView *progressView;
@end

@implementation BasicWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupWebVeiw];
    
    [self setupProgressView];
    
    [self setupNaviBar];
}

-(void)setupWebVeiw{
    
    
     WKWebViewConfiguration *configure = [[WKWebViewConfiguration alloc] init];
    
     configure.processPool = [[WKProcessPool alloc] init];
    
     WKUserContentController *userController = [[WKUserContentController alloc] init];
    
    [userController addScriptMessageHandler:self name:@"1"];
    
     configure.userContentController = userController;

    _webVeiw = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:configure];
    
    _webVeiw.navigationDelegate = self;
    
    _webVeiw.UIDelegate = self;
    
   //添加kvo，监听title progress
    
    [_webVeiw addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    
    [_webVeiw addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:_webVeiw];
    
    
    [_webVeiw loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    

}

-(void)setupProgressView{
    
    if (self.navigationController) {
        
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        
        _progressView.frame = CGRectMake(0, 64, MainScreenWidth, 10);
        
        _progressView.progressTintColor = [UIColor orangeColor];
        
        _progressView.trackTintColor = [UIColor groupTableViewBackgroundColor];
        
        [_webVeiw addSubview:_progressView];
        
        [_webVeiw bringSubviewToFront:_progressView];
        

    }
    
    
}
-(void)setupNaviBar{


    if (self.navigationController) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(goBackWebview:)];
    }

}
-(void)goBackWebview:(UIBarButtonItem *)item{

    if ([_webVeiw canGoBack]) {
        
        [_webVeiw goBack];
    }


}
#pragma 监听
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    if ([keyPath isEqualToString: @"title"]) {
        
        self.navigationItem.title = change[@"new"];
        
    }else if ([keyPath isEqualToString:@"estimatedProgress"]){
    
        [_progressView setProgress:[change[@"new"] floatValue] animated:YES];
        
        if (_progressView.progress == 1.0) {
            
            _progressView.hidden = YES;
            
            [_progressView setProgress:0.0 animated:NO];
            
        }else{
        
            _progressView.hidden = NO;
        
        }
    
    }

}

#pragma 处理页面信号。
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{


}
#pragma 实现网友代理方法
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{

    if (navigationAction.navigationType != WKNavigationTypeBackForward) {
        
        if ([SVProgressHUD isVisible]) {
            
            [SVProgressHUD dismiss];
        }
        
        [SVProgressHUD showWithStatus:@"网页加载中"];

    }

    decisionHandler(WKNavigationActionPolicyAllow);

}
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
   
    
    
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

    if ([SVProgressHUD isVisible]) {
        
        [SVProgressHUD dismiss];
    }


}
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{

    NSLog(@"");


}
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{



}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{

    if ([SVProgressHUD isVisible]) {
        
        [SVProgressHUD dismiss];
    }



}
-(void)dealloc{

    [_webVeiw removeObserver:_webVeiw forKeyPath:@"title"];
    
    [_webVeiw removeObserver:_webVeiw forKeyPath:@"estimatedProgress"];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
