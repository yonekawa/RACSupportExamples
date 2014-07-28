//
//  RCSSVProgressHUDViewController.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "RCSSVProgressHUDViewController.h"

#import <ReactiveCocoa/RACSignal.h>
#import <SVProgressHUD.h>
#import "SVProgressHUD+RACSupport.h"

@interface RCSSVProgressHUDViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation RCSSVProgressHUDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.webView.delegate = self;
    [self goGoogle];
}

- (void)goGoogle
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://google.com/"]];
    [self.webView loadRequest:req];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD show];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[SVProgressHUD rac_dismiss] subscribeCompleted:^{
        //NSLog(@"Dismissed");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Dismissed"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

@end
