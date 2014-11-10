//
//  AssociatedViewController.m
//  EERuntimeDemo
//
//  Created by 卓哥的世界你不懂 on 14/11/10.
//  Copyright (c) 2014年 李卓. All rights reserved.
//

#import "AssociatedViewController.h"

@interface AssociatedViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *keyText;
@property (strong, nonatomic) IBOutlet UITextField *valueText;
@property (strong, nonatomic) IBOutlet UITableView *associateTable;
@property (strong, nonatomic) NSMutableArray *associatedArray;
@property (copy  , nonatomic) NSString *key;
@end

@implementation AssociatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _associatedArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)addAssociate:(id)sender {
    if (_valueText.text.length>1&&_keyText.text.length>1) {
        _key = _keyText.text;
        //添加关联对象
        objc_setAssociatedObject(self, &_key, _valueText.text, OBJC_ASSOCIATION_COPY_NONATOMIC);
        NSDictionary *dic= @{@"key":_key,@"value":_valueText.text};
        [_associatedArray addObject:dic];
        [_associateTable reloadData];
    }
    
}
- (IBAction)deleteAssociate:(id)sender {
    objc_removeAssociatedObjects(self);
    [_associatedArray removeAllObjects];
    [_associateTable reloadData];
}
- (IBAction)findAssociate:(id)sender {
    //获取关联对象的value
    _key = _keyText.text;
    NSString *value = [NSString stringWithFormat:@"%@",objc_getAssociatedObject(self, &_key)];
    _valueText.text = value;
}
#pragma mark- tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _associatedArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifer = @"associate";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
    }
    cell.textLabel.text = _associatedArray[indexPath.row][@"key"];
    cell.detailTextLabel.text = _associatedArray[indexPath.row][@"value"];
    return cell;
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
