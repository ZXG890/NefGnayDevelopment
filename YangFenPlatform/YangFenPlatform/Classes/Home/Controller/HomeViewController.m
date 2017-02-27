//
//  HomeViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollcetionView.h"

@interface HomeViewController ()
@property (nonatomic,strong) HomeCollcetionView *collectionV;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self setupNaviBar];
    
    [self setupUI];
}
-(void)setupNaviBar{

 self.navigationItem.title = @"首页";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn:)];

}
-(void)searchBtn:(UIBarButtonItem *)barBtn{

    NSLog(@"点击搜索");

}
-(void)setupUI{

    _collectionV = [HomeCollcetionView collectionViewWithFrame:self.view.bounds];
    
    _collectionV.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionV];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [_collectionV.scanDisplayView startTimer];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [_collectionV.scanDisplayView stopTimer];
    
}



@end
