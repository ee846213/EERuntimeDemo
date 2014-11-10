//
//  ViewController.m
//  EERuntimeDemo
//
//  Created by 卓哥的世界你不懂 on 14/11/10.
//  Copyright (c) 2014年 李卓. All rights reserved.
//

#import "ViewController.h"
#import "AssociatedViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *itemArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _itemArray = @[@"关联对象"];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark- tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    cell.textLabel.text = _itemArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            AssociatedViewController *associate = [[AssociatedViewController alloc]init];
            [self.navigationController pushViewController:associate animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
