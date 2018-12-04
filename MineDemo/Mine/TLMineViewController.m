//
//  TLMineViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLMineViewController.h"

#import "TLFounctionCell.h"

#import "TLUserDetailCell.h"



#import "AccountSetViewController.h"

@interface TLMineViewController ()

@property (nonatomic ,strong)  CommonTableViewController *commontable;

@end

@implementation TLMineViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self setHidesBottomBarWhenPushed:NO];
    
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    
    [self initTestData];
    
}

#pragma mark - UITableView section

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [_data objectAtIndex:section];
    
    return array.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FotterView"];
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"FotterView"];
        [view setBackgroundView:[UIView new]];
    }
    return view;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
 
    id cell = nil;
    if ([dic objectForKey:@"mine"] != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeMine];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
        [cell setImageName:[dic objectForKey:@"image"]];
        [cell setTitle:[dic objectForKey:@"title"]];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setUserInteractionEnabled:YES];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    if (indexPath.row == 0) {
        [cell setTopLineStyle:CellLineStyleFill];
    }
    else {
        [cell setTopLineStyle:CellLineStyleNone];
    }
    if (indexPath.row == array.count - 1) {
        [cell setBottomLineStyle:CellLineStyleFill];
    }
    else {
        [cell setBottomLineStyle:CellLineStyleDefault];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    
    if ([dic objectForKey:@"mine"] != nil) {
        return 105.0f;
    }
    else {
        return 60.0f;
    }
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 2.0f;
    }
    return 5.0f;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    switch (indexPath.section) {
        case 1:{
            NSLog(@"用户编辑 %ld",indexPath.section);
            
            //  self presentModalViewController:svc animated:YES
            AccountSetViewController *accountSet = [AccountSetViewController new];
           [self.navigationController pushViewController:accountSet animated:NO];
          
            
            break;
        }
        case 2:{
            NSLog(@"网络设置 %ld",indexPath.section);
            AccountSetViewController *accountSet = [AccountSetViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
        }
        case 3:{
            NSLog(@"遥控器控制 %ld",indexPath.section);
            AccountSetViewController *accountSet = [AccountSetViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
        }
        case 4:{
            NSLog(@"更换网关 %ld",indexPath.section);
            AccountSetViewController *accountSet = [AccountSetViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
            
            
        }
        case 5:{
            NSLog(@"通知信息 %ld",indexPath.section);
            AccountSetViewController *accountSet = [AccountSetViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
            
        }
        case 6:{
            NSLog(@"版本号 %ld",indexPath.section);
            AccountSetViewController *accountSet = [AccountSetViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
            
            
        }
        case 7:{
            
            NSLog(@"清空数据 %ld",indexPath.section);
            AccountSetViewController *accountSet = [AccountSetViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
            
            
            
            
            
        }
            
            
            
            
        default:
            NSLog(@"没有反应");
            break;
    }
    






}


#pragma mark - 初始化
- (void) initTestData
{
    
    // 遥控器。网关。固件升级
    // 小组件 帮助中心 设置 关于
    
    NSDictionary *dic = @{@"mine" : @"YES"};
    
    NSDictionary *dic1 = @{@"title" : @"遥控器",
                           @"image" : @"网络设置"};
    NSDictionary *dic2 = @{@"title" : @"网关 ",
                           @"image" : @"遥控器设置"};
    NSDictionary *dic3 = @{@"title" : @"固件升级",
                           @"image" : @"MoreMyBankCard"};
    NSDictionary *dic4 = @{@"title" : @"小组件",
                           @"image" : @"MyCardPackageIcon"};
    NSDictionary *dic5 = @{@"title" : @"帮助中心",
                           @"image" : @"MoreExpressionShops"};
    NSDictionary *dic6 = @{@"title" : @"设置",
                           @"image" : @"MoreSetting"};
    NSDictionary *dic7 = @{@"title" : @"关于",
                           @"image" : @"MoreSetting"};

    
//     _data = [[NSMutableArray alloc] initWithObjects:@[], @[dic], @[dic1], @[dic2], @[dic3], @[dic4], @[dic5], @[dic6], nil];
    
     _data = [[NSMutableArray alloc] initWithObjects:@[], @[dic], @[dic1, dic2,dic3], @[dic4, dic5, dic6,dic7], nil];
    
    
    _user = [[TLUser alloc] init];
    _user.username = @"Hoyifo";
    _user.userID = @"18013569550";
    _user.avatarURL = [NSURL URLWithString:@"3.png"];
    
    [self.tableView reloadData];
}

@end
