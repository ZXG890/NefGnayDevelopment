//
//  ViewController.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    BasicWebViewController *webVC = [[BasicWebViewController alloc]init];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:webVC];


  [self presentViewController:navVC animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
