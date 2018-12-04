//
//  CommonTableViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/13.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewController.h"

@interface CommonTableViewController ()

@end

#define  DEFAULT_TEXT_GRAY_COLOR     [UIColor grayColor]

#define  DEFAULT_BACKGROUND_COLOR    [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:246.0/255.0 alpha:1.0]

@implementation CommonTableViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setTableFooterView:[UIView new]];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [self.tableView setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    
    [self setHidesBottomBarWhenPushed:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}

@end
