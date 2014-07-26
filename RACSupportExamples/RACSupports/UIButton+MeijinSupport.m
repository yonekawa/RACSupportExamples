//
//  UIButton+MeijinSupport.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "UIButton+MeijinSupport.h"
#import <ReactiveCocoa/RACCommand.h>
#import <ReactiveCocoa/RACReplaySubject.h>
#import <ReactiveCocoa/RACScheduler.h>
#import <ReactiveCocoa/UIButton+RACCommandSupport.h>

@implementation UIButton (MeijinSupport)

static const NSInteger kMaxShotCount = 16;

- (RACSignal *)rac_16shotSignal
{
    __block NSInteger shotCount = 0;

    RACReplaySubject *subject = [RACReplaySubject subject];
	[subject setNameWithFormat:@"%@ -rac_16shotSignal", self];

    [[RACSignal interval:1.0f onScheduler:[RACScheduler scheduler]] subscribeNext:^(NSDate *date) {
        shotCount = 0;
    }];

    self.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        shotCount++;
        NSLog(@"%zd", shotCount);
        if (shotCount == kMaxShotCount) {
            [subject sendNext:@(shotCount)];
            shotCount = 0;
        }
        return [RACSignal empty];
    }];
    return subject;
}

@end
