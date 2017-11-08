//
//  TableViewController.m
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCellModel.h"
#import "TableViewCell.h"
#import "PasteViewController.h"
#import "MenuManager.h"

@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) MenuManager *menuManager;
@end

@implementation TableViewController

#pragma mark 懒加载初始化
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(MenuManager *)menuManager {
    if (!_menuManager) {
        _menuManager = [[MenuManager alloc]initWithView:self.view];
    }
    return _menuManager;
}

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.view addGestureRecognizer:self.menuManager.longPressGestureRecognizer];
    [self.view addGestureRecognizer:self.menuManager.tapGestureRecognizer];
    
    
    TableViewCellModel *model1 = [[TableViewCellModel alloc]initWithTitleString:@"Name1"];
    TableViewCellModel *model2 = [[TableViewCellModel alloc]initWithTitleString:@"Name2"];
    TableViewCellModel *model3 = [[TableViewCellModel alloc]initWithTitleString:@"Name3"];
    TableViewCellModel *model4 = [[TableViewCellModel alloc]initWithTitleString:@"Name4"];
    
    self.dataSource = @[model1,model2,model3,model4];
    
    [self.tableView reloadData];
}

#pragma mark --UITableViewDatasouce,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    }
    
    TableViewCellModel *model = self.dataSource[indexPath.row];
    
    cell.model = model;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PasteViewController *pasteVC = [[PasteViewController alloc]init];
    
    [self.navigationController pushViewController:pasteVC animated:YES];
}




@end
