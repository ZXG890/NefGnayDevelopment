//
//  HomeScanyDisplayView.h
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScanyDisplayView : UIView
@property (nonatomic,copy) NSArray *imageArray;
-(void)stopTimer;
-(void)startTimer;

@end
