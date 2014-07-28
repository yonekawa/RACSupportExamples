//
//  SVProgressHUD+RACSupport.h
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "SVProgressHUD.h"

@class RACSignal;

@interface SVProgressHUD (RACSupport)
+ (RACSignal *)rac_dismiss;
@end
