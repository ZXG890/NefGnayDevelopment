//
//  TabBarViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
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
    
    CustomerTabBar *tabar = [[CustomerTabBar alloc] init];
    
    tabar.plusBlock = ^{
    
        NSLog(@"点击了");
    
    };
    
    [self setValue:tabar forKey:@"tabBar"];
    
    

    UITabBar *tabbar = [UITabBar appearance];
    
    [tabbar setTintColor:[UIColor purpleColor]];
    
    [tabbar setBarTintColor:[UIColor orangeColor]];
    
    [tabbar setUnselectedItemTintColor:[UIColor whiteColor]];


}
-(void)setupChildViewController{

    self.controllerNameArray = @[@"HomeViewController",@"PersonalViewController"];
    
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:10];
    
    for (NSString *VCClassName in self.controllerNameArray) {
        
        UIViewController *vc = [NSClassFromString(VCClassName) new];
        
        BasicNavigationController *navVC = [[BasicNavigationController alloc] initWithRootViewController:vc];
        
        navVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"控制器%@",@"123"] image:nil selectedImage:nil];
        
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
