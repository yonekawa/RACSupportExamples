//
//  SVProgressHUD+RACSupport.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "SVProgressHUD+RACSupport.h"
#import <ReactiveCocoa/NSNotificationCenter+RACSupport.h>
#import <ReactiveCocoa/RACReplaySubject.h>
#import <ReactiveCocoa/RACDisposable.h>

@implementation SVProgressHUD (RACSupport)

+ (RACSignal *)rac_dismiss
{
    RACReplaySubject *subject = [RACReplaySubject subject];
	[subject setNameWithFormat:@"%@ +rac_dismiss", self];

    [SVProgressHUD dismiss];

    RACSignal *signal = [[NSNotificationCenter defaultCenter] rac_addObserverForName:SVProgressHUDDidDisappearNotification object:nil];
    __block RACDisposable *subscription = [signal subscribeNext:^(NSNotification *notification) {
        [subject sendCompleted];
        [subscription dispose];
    }];
    return subject;
}

@end
