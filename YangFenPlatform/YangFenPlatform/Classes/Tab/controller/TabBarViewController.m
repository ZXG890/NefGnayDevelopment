//
//  TabBarViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "SuperStoreViewController.h"
#import "StarViewController.h"
#import "FenBarViewController.h"
#import "PersonalViewController.h"
#import "CustomerTabBar.h"
@interface TabBarViewController ()
@property (nonatomic,copy) NSArray *controllerNameArray;
@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTabbar];
    
    [self setupChildViewController];
    
}
-(void)setTabbar{
//    
//    CustomerTabBar *tabar = [[CustomerTabBar alloc] init];
//    
//    tabar.plusBlock = ^{
//    
//        NSLog(@"点击了");
//    
//    };
//    
//    [self setValue:tabar forKey:@"tabBar"];
    
    UITabBar *tabbar = [UITabBar appearance];
    
    [tabbar setTintColor:[UIColor colorWithHex:0xa11c17]];
    
    [tabbar setBarTintColor:[UIColor whiteColor]];
    
    [tabbar setUnselectedItemTintColor:[UIColor colorWithHex:0x666666]];


}
-(void)setupChildViewController{

    self.controllerNameArray = @[@"HomeViewController",@"SuperStoreViewController",@"StarViewController",@"FenBarViewController",@"PersonalViewController"];
    
    NSDictionary *nameDic = @{@"Home":@"首页",@"SuperStore":@"商城",@"Star":@"明星",@"FenBar":@"粉Pa",@"Personal":@"我的"};
    
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:10];
    
    for (NSString *VCClassName in self.controllerNameArray) {
        
        UIViewController *vc = [NSClassFromString(VCClassName) new];
        
        BasicNavigationController *navVC = [[BasicNavigationController alloc] initWithRootViewController:vc];
        
        NSString *imageName = [VCClassName substringWithRange:NSMakeRange(0, VCClassName.length-[VCClassName rangeOfString:@"ViewController"].length)];
        
        navVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nameDic[imageName] image:[UIImage imageNamed:[NSString stringWithFormat:@"%@-",imageName]] selectedImage:[UIImage imageNamed:imageName]];
        
        
        [controllers addObject:navVC];
    }
    
    
    self.viewControllers = controllers.copy;


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
