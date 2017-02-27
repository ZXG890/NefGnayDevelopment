//
//  TableHeaderView.h
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableHeaderView;
@protocol TableHeaderViewDelegate <NSObject>
-(void)tableHeaderView:(TableHeaderView *)tableHeadeView clickBtn:(UIButton *)btn;
-(void)tableHeaderView:(TableHeaderView *)tableHeadeView revisePersonalInfoBtn:(UIButton *)btn;
-(void)tableHeaderView:(TableHeaderView *)tableHeadeView reviseIconBtn:(UIButton *)btn;

@end

@interface TableHeaderView : UIView
@property (weak,nonatomic)  id<TableHeaderViewDelegate> delegate;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *introduce;
@property (nonatomic,copy) NSString *score;
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *imageUrl;
+(instancetype)tableviewWithHeight:(CGFloat)height;
- (IBAction)clickIconBtn:(UIButton *)sender;
- (IBAction)clickIdealBtn:(id)sender;
- (IBAction)clickOrderBtn:(id)sender;
- (IBAction)clickPaiMaiBtn:(id)sender;
- (IBAction)clickShouCangBtn:(id)sender;
- (IBAction)clickRevisedPersonalInfo:(id)sender;

@end
