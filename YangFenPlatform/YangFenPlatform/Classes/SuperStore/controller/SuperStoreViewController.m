//
//  SuperStoreViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "SuperStoreViewController.h"

@interface SuperStoreViewController ()

@end

@implementation SuperStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNaviBar];
}
-(void)setupNaviBar{
    
    self.navigationItem.title = @"商城";
    
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
