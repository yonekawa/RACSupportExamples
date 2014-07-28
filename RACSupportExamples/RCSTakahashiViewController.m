//
//  RCSTakahashiViewController.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "RCSTakahashiViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIButton+MeijinSupport.h"

@interface RCSTakahashiViewController ()
@property (nonatomic, weak) IBOutlet UIButton *meijinButton;
@end

@implementation RCSTakahashiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[self.meijinButton rac_16shotSignal]
      subscribeNext:^(NSNumber *shotCount) {
          NSString *title = [NSString stringWithFormat:@"%zd Shot!", [shotCount integerValue]];
          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                          message:nil
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
          [alert show];
    }];
}

@end
