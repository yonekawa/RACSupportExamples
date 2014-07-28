//
//  UIButton+MeijinSupport.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "UIButton+MeijinSupport.h"
#import <ReactiveCocoa/RACCommand.h>
#import <ReactiveCocoa/RACScheduler.h>
#import <ReactiveCocoa/RACSignal+Operations.h>
#import <ReactiveCocoa/UIControl+RACSignalSupport.h>

@implementation UIButton (MeijinSupport)

static const NSInteger kMaxShotCount = 16;

- (RACSignal *)rac_16shotSignal
{
    RACSignal *tapped = [self rac_signalForControlEvents:UIControlEventTouchUpInside];
    RACSignal *resetTimer = [RACSignal interval:1.0f onScheduler:[RACScheduler scheduler]];

    return [[[[[[tapped
        scanWithStart:@0 reduce:^(NSNumber *running, id next) {
            NSInteger shotCount = running.integerValue + 1;
            NSLog(@"%zd", shotCount);
            return @(shotCount);
        }]
        // Restarts shot count from 0 if a second has passed.
        // In addition, reset timer should start after 1st button tap.
        takeUntil:[[[tapped take:1] ignoreValues] concat:resetTimer]]
        skip:(kMaxShotCount - 1)]
        take:1] // Completes this period.
        repeat] // Then, starts a new period.
        setNameWithFormat:@"%@ -rac_16shotSignal", self];
}

@end
