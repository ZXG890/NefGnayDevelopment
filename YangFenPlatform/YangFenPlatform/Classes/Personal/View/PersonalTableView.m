//
//  PersonalTableView.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "PersonalTableView.h"

#define TableCellReuseID @"tableCell"
@interface PersonalTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *personContentArray;
@end
@implementation PersonalTableView
-(NSArray *)personContentArray{

    if (!_personContentArray) {
        
        _personContentArray = @[
                                @[
                                   @{@"title":@"VIP通道",@"image":@"my_attestation"},
                                   @{@"title":@"我的订单",@"image":@"my_order"},
                                   @{@"title":@"我的收获地址",@"image":@"my_address"},
                                   @{@"title":@"消息中心",@"image":@"my_msg"},
                                   @{@"title":@"更多福利",@"image":@"my_welfare"},
                                   @{@"title":@"用户反馈",@"image":@"my_feedback"}
                                  
                                  ],
                                @[
                                    @{@"title":@"扫一扫",@"image":@"scan"},
                                    @{@"title":@"设置",@"image":@"scan"}
                                    
                                    
                                  ]
                                
                                ];
    }

    return _personContentArray;

}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    if (self = [super initWithFrame:frame style:style]) {
        
        self.dataSource = self;
        
        self.delegate = self;
        
        self.tableHeaderView = [self generateTableHeaderView];
        
        self.tabHeaderV = (TableHeaderView *)self.tableHeaderView;
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:TableCellReuseID];
        
    }

    return self;

}
#pragma 实现代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 2;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        
        return 6;
        
    }else{
    
        return 2;
    
    }


}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableCellReuseID];
    
    NSArray *sectionContentArray = [self.personContentArray objectAtIndex:indexPath.section];
    
    NSDictionary *rowContentDic = sectionContentArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:rowContentDic[@"image"]];
    
    cell.textLabel.text = rowContentDic[@"title"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 40;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


   return 20;

}



-(UIView *)generateTableHeaderView{

    UIView *tableHeaderV = [TableHeaderView tableviewWithHeight:220];
    
    
    return tableHeaderV;

}
@end
