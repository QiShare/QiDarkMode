//
//  QiWebViewController.m
//  QiDarkMode
//
//  Created by wangyongwang on 2019/9/23.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiWebViewController.h"
#import <WebKit/WebKit.h>

@implementation QiWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.tabBarItem.title = @"WebView";
    self.navigationItem.title = @"DarkModeWeb";
    
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:wkWebView];
    wkWebView.frame = self.view.bounds;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"QiTestDarkMode" ofType:@"html"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    [wkWebView loadData:data MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:[[NSBundle mainBundle] bundleURL]];
}

@end
