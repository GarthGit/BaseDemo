//
//  AccountSetViewController.m
//  MineDemo
//
//  Created by hoyifo on 2018/11/28.
//  Copyright © 2018 hoyifo. All rights reserved.
//

#import "AccountSetViewController.h"

#import "TLFounctionCell.h"

#import "TLUserDetailCell.h"

#import "ViewController.h"
@interface AccountSetViewController ()



@end

@implementation AccountSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 账户设置
    self.navigationItem.title = [NSString stringWithFormat:@"账户设置"];
    
    [self.navigationController setNavigationBarHidden:NO];

    [self setHidesBottomBarWhenPushed:NO];
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
            ViewController *accountSet = [ViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
        }
       
        case 2:{
            NSLog(@"修改用户名 %ld",indexPath.section);
            ViewController *accountSet = [ViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
        }
        case 3:{
            NSLog(@"修改登录密码 %ld",indexPath.section);
            ViewController *accountSet = [ViewController new];
            [self.navigationController pushViewController:accountSet animated:NO];
            
            break;
            
            
        }
        case 4:{
            NSLog(@"退出登录 %ld",indexPath.section);
            ViewController *accountSet = [ViewController new];
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
    
    // 网络设置  遥控器控制  更换网关  通知信息  版本号 清空数据
    
    NSDictionary *dic = @{@"mine" : @"YES"};
    
    NSDictionary *dic1 = @{@"title" : @"修改用户名 ",
                           @"image" : @"遥控器设置"};
    NSDictionary *dic2 = @{@"title" : @"修改登录密码",
                           @"image" : @"MoreMyBankCard"};
    NSDictionary *dic3 = @{@"title" : @"退出登录",
                           @"image" : @"MyCardPackageIcon"};
   
    
    
    _data = [[NSMutableArray alloc] initWithObjects:@[], @[dic], @[dic1], @[dic2], @[dic3], nil];
    
    
    _user = [[TLUser alloc] init];
    _user.username = @"Hoyifo";
    _user.userID = @"18013569550";
    _user.avatarURL = [NSURL URLWithString:@"3.png"];
    
    [self.tableView reloadData];
    
}

























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
