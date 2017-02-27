//
//  PersonalViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalTableView.h"
#import "TableHeaderView.h"

@interface PersonalViewController ()<TableHeaderViewDelegate>
@property (nonatomic,strong) PersonalTableView *personTabV;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor yellowColor];

    [self setupNaviBar];
    
    [self setupUI];
    
}
-(void)setupNaviBar{
    
    self.navigationItem.title = @"我的";
    
}
-(void)setupUI{

    _personTabV = [[PersonalTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _personTabV.tabHeaderV.delegate = self;
    
    [self.view addSubview:_personTabV];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
