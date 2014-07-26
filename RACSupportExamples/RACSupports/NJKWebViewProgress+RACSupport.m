//
//  NJKWebViewProgress+RACSupport.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "NJKWebViewProgress+RACSupport.h"
#import "RACDelegateProxy.h"
#import "NSObject+RACDeallocating.h"
#import "NSObject+RACDescription.h"
#import <objc/runtime.h>

@implementation NJKWebViewProgress (RACSupport)

static void RACUseDelegateProxy(NJKWebViewProgress *self)
{
    if (self.progressDelegate == self.rac_delegateProxy) return;
    self.rac_delegateProxy.rac_proxiedDelegate = self.progressDelegate;
    self.progressDelegate = (id)self.rac_delegateProxy;
}

- (RACDelegateProxy *)rac_delegateProxy
{
	RACDelegateProxy *proxy = objc_getAssociatedObject(self, _cmd);
	if (proxy == nil) {
		proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(NJKWebViewProgressDelegate)];
		objc_setAssociatedObject(self, _cmd, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return proxy;
}

- (RACSignal *)rac_updateProgressSignal
{
	RACSignal *signal = [[[[self.rac_delegateProxy signalForSelector:@selector(webViewProgress:updateProgress:)]
                           reduceEach:^(NJKWebViewProgress *webViewProgress, NSNumber *progress) {
                               return progress;
                           }]
                          takeUntil:self.rac_willDeallocSignal]
                         setNameWithFormat:@"%@ -rac_updateProgressSignal", [self rac_description]];
    
	RACUseDelegateProxy(self);
	return signal;
}

@end
