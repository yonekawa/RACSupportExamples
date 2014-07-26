//
//  NJKWebViewProgress+RACSupport.h
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "NJKWebViewProgress.h"
#import "RACSignal+Operations.h"

@class RACDelegateProxy;

@interface NJKWebViewProgress (RACSupport)
@property (nonatomic, strong, readonly) RACDelegateProxy *rac_delegateProxy;
- (RACSignal *)rac_updateProgressSignal;
@end
