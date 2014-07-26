//
//  RCSNJKWebViewProgressViewController.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "RCSNJKWebViewProgressViewController.h"

#import <NJKWebViewProgress/NJKWebViewProgress.h>
#import <NJKWebViewProgress/NJKWebViewProgressView.h>
#import "NJKWebViewProgress+RACSupport.h"

@interface RCSNJKWebViewProgressViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NJKWebViewProgress *progressProxy;
@property (nonatomic, strong) NJKWebViewProgressView *progressView;
@end

@implementation RCSNJKWebViewProgressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.progressProxy = [[NJKWebViewProgress alloc] init];
    [self.progressProxy.rac_updateProgressSignal
      subscribeNext:^(NSNumber *progress) {
        [self.progressView setProgress:[progress floatValue]
                              animated:NO];
     }];

    self.webView.delegate = self.progressProxy;
    self.progressProxy.webViewProxyDelegate = self;
    [self setupProgressBar];
    [self goGoogle];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:self.progressView];
}

- (void)setupProgressBar
{
    CGFloat progressBarHeight = 2.0f;
    CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    self.progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    self.progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
}

- (void)goGoogle
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://google.com/"]];
    [self.webView loadRequest:req];
}

@end
