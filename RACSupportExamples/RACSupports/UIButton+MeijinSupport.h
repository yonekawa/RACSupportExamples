//
//  UIButton+MeijinSupport.h
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACSignal;

@interface UIButton (MeijinSupport)
- (RACSignal *)rac_16shotSignal;
@end
