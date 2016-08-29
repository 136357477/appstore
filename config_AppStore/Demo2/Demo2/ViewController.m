//
//  ViewController.m
//  Demo2
//
//  Created by guohui on 16/8/26.
//  Copyright © 2016年 guohui. All rights reserved.
//

#import "ViewController.h"
#import "TabLabCell.h"
#import "Model.h"
#define IDENTIFIER @"TabLabCellIdenrifier"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *mt_array ;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //TODO: 注册某个重用标识 对应的 Cell类型
    [self.tableView registerClass:[TabLabCell class] forCellReuseIdentifier:IDENTIFIER];

    mt_array = [NSMutableArray arrayWithCapacity:3];
    NSArray *array = @[@{@"name":@"打开 appstore 应用界面："},@{@"name":@"打开 appstore 评论界面："},@{@"name":@"本地若有应用则打开否则去 AppStore 下载"}];
    for (NSDictionary *dic in array) {
        Model *model = [[Model alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [mt_array addObject:model];
    }
    [self.tableView reloadData];
    
}
#pragma mark - TabDatasource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mt_array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TabLabCell *cell = (TabLabCell *)[tableView dequeueReusableCellWithIdentifier:IDENTIFIER forIndexPath:indexPath];
    Model *model = mt_array[indexPath.row];
    [cell configwithmodel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            //打开 appstore 应用界面：
            [self open_app_in_appStory];
        }
            break;
        case 1:
        {
            //打开 appstore 评论界面:
            [self judje_in_appStory];
        }
            break;
        case 2:
        {
            //本地若有应用则打开否则去 AppStore 下载:
            [self open_local_app_or_downloadapp];
        }
            break;
            
        default:
            break;
    }

}
- (void)open_app_in_appStory{
    NSString *appid = @"1108714316";
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@", appid];
    NSURL *url = [NSURL URLWithString:str];
    [[UIApplication sharedApplication] openURL:url];
}
- (void)judje_in_appStory{
    NSString *appid = @"1108714316";
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=%@", appid];
    NSURL *url = [NSURL URLWithString:str];
    [[UIApplication sharedApplication] openURL:url];
}


//跳转到demo1
- (void)open_local_app_or_downloadapp
{
    NSURL *customUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",@"comlecuntaolxyios",@"lecuntaoios" ]];
    UIApplication *app = [UIApplication sharedApplication];
    NSLog(@"%@",customUrl);
    if ([app canOpenURL:customUrl])
    {
        //有安装应用，打开应用
        [app openURL: customUrl];
    }else{
        [app openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/le-xian-yu/id1108714316?l=zh&ls=1&mt=8" ]];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
