//
//  AccountSetViewController.h
//  MineDemo
//
//  Created by hoyifo on 2018/11/28.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTableViewController.h"

@class TLUser;

@interface AccountSetViewController : CommonTableViewController

@property (nonatomic, strong) TLUser *user;
@property (nonatomic, strong) NSMutableArray *data;


@end
