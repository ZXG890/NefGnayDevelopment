//
//  CustomerTabBar.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "CustomerTabBar.h"
#define tabbarItemW MainScreenWidth/3
@interface CustomerTabBar()
@property (nonatomic,weak) UIButton *plusBtn;
@end
@implementation CustomerTabBar
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        self.plusBtn = plusBtn;
        
        [plusBtn setTitle:@"添加数据" forState:UIControlStateNormal];
        
        [plusBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [plusBtn setTintColor:[UIColor purpleColor]];
        
        [plusBtn setBackgroundColor:[UIColor whiteColor]];
        
        [plusBtn addTarget:self action:@selector(plusClick:) forControlEvents:UIControlEventTouchUpInside];
        
        plusBtn.frame = CGRectMake(tabbarItemW, 49-tabbarItemW, tabbarItemW, tabbarItemW);
        
        plusBtn.layer.cornerRadius = tabbarItemW*0.5;
        
        plusBtn.layer.masksToBounds = YES;
        
        [self addSubview:plusBtn];
        
        [self bringSubviewToFront:plusBtn];
        
        
    }

    return self;

}
-(void)plusClick:(UIButton *)btn{


    if (self.plusBlock) {
        
        self.plusBlock();
    }

}
-(void)layoutSubviews{

    [super layoutSubviews];
    
   int itemIndex = 0;
    
    
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (itemIndex == 1) {
                
                itemIndex++;
            }
            
            view.left = itemIndex*tabbarItemW;
            view.width = tabbarItemW;
            
            itemIndex++;
            
        }
        
    }

}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *view = [super hitTest:point withEvent:event];
    
    CGPathRef ref = CGPathCreateWithEllipseInRect(_plusBtn.bounds, NULL);
    
    if (view == nil) {
        
        for (UIView *subView in self.subviews) {
            
            CGPoint tp = [subView convertPoint:point fromView:self];
            
            if (CGPathContainsPoint(ref, NULL, tp, NO)) {
                
                view = subView;
            }
        }
    }

    return view;
}
@end
