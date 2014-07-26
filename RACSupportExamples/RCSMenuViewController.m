//
//  RCSMenuViewController.m
//  RACSupportExamples
//
//  Created by Kenichi Yonekawa on 7/26/14.
//  Copyright (c) 2014 freee K.K. All rights reserved.
//

#import "RCSMenuViewController.h"

@interface RCSMenuViewController ()
@property (nonatomic, strong) NSArray *menus;
@end

@implementation RCSMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menus = @[
        @"SVProgressHUD",
        @"NJKWebViewProgress",
        @"16 Shot"
    ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menus count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.menus[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            UIViewController *viewController =
            [self.storyboard instantiateViewControllerWithIdentifier:@"SVProgressHUD"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 1: {
            UIViewController *viewController =
                [self.storyboard instantiateViewControllerWithIdentifier:@"NJKWebViewProgress"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 2: {
            UIViewController *viewController =
            [self.storyboard instantiateViewControllerWithIdentifier:@"Takahashi"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
