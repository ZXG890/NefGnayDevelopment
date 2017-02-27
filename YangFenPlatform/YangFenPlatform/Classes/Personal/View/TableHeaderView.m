//
//  TableHeaderView.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "TableHeaderView.h"

@interface TableHeaderView()


@property (weak, nonatomic) IBOutlet UIButton *iconImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@end

@implementation TableHeaderView

+(instancetype)tableviewWithHeight:(CGFloat)height{
    
    TableHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"TableHeaderView" owner:nil options:nil].lastObject;
    
    headerView.frame = CGRectMake(0, 0, 0, height);
    
    return headerView;


}

/*@property (nonatomic,copy) NSString *name;
 @property (nonatomic,copy) NSString *introduce;
 @property (nonatomic,copy) NSString *score;
 @property (nonatomic,copy) NSString *level;
 @property (nonatomic,copy) NSString *imageUrl;*/
#pragma 属性

-(void)setName:(NSString *)name{

    _name = name;
    
    _nameLable.text = name;

}
-(void)setIntroduce:(NSString *)introduce{

    _introduce = introduce;
    
    _introduceLabel.text = introduce;

}

-(void)setScore:(NSString *)score{

    _score = score;
    
    NSString *newScore = [_score stringByAppendingFormat:@"积分  %@",_score];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:newScore];
    
    NSRange range = [newScore rangeOfString:_score];
    
    [attributeStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0xa11c17]} range:range];
 
    _scoreLabel.attributedText = attributeStr;
}
-(void)setLevel:(NSString *)level{


    _level = level;
    
    NSString *newScore = [_level stringByAppendingFormat:@"级别  %@",_score];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:newScore];
    
    NSRange range = [newScore rangeOfString:_level];
    
    [attributeStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0xa11c17]} range:range];
    
    _levelLabel.attributedText = attributeStr;

    
}
-(void)setImageUrl:(NSString *)imageUrl{

    _imageUrl = imageUrl == nil ? @"icon" :imageUrl;
    
    [_iconImageBtn setImage:[UIImage imageNamed:_imageUrl] forState:UIControlStateNormal];

}
#pragma 代理方法

- (IBAction)clickIdealBtn:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(tableHeaderView:clickBtn:)]) {
        
        [self.delegate tableHeaderView:self clickBtn:(UIButton *)sender];
    }
}

- (IBAction)clickOrderBtn:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(tableHeaderView:clickBtn:)]) {
        
        [self.delegate tableHeaderView:self clickBtn:(UIButton *)sender];
    }

}

- (IBAction)clickPaiMaiBtn:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(tableHeaderView:clickBtn:)]) {
        
        [self.delegate tableHeaderView:self clickBtn:(UIButton *)sender];
    }

}

- (IBAction)clickShouCangBtn:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(tableHeaderView:clickBtn:)]) {
        
        [self.delegate tableHeaderView:self clickBtn:(UIButton *)sender];
    }

}

- (IBAction)clickRevisedPersonalInfo:(id)sender {
    
    if ([self .delegate respondsToSelector:@selector(tableHeaderView:revisePersonalInfoBtn:)]) {
        
        [self.delegate tableHeaderView:self revisePersonalInfoBtn:(UIButton *)sender];
    }
}
- (IBAction)clickIconBtn:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(tableHeaderView:reviseIconBtn:)]) {
        
        [self.delegate tableHeaderView:self reviseIconBtn:sender];
    }
}

@end
