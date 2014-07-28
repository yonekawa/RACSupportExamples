//
//  SVProgressHUD+RACSupport.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "SVProgressHUD+RACSupport.h"
#import <ReactiveCocoa/NSNotificationCenter+RACSupport.h>
#import <ReactiveCocoa/RACSignal+Operations.h>

@implementation SVProgressHUD (RACSupport)

+ (RACSignal *)rac_dismiss
{
    [SVProgressHUD dismiss];

    return [[[[[NSNotificationCenter defaultCenter]
        rac_addObserverForName:SVProgressHUDDidDisappearNotification object:nil]
        take:1]
        ignoreValues]
        setNameWithFormat:@"%@ +rac_dismiss", self];
}

@end
