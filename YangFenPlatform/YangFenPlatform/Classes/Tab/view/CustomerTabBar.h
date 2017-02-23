//
//  CustomerTabBar.h
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/22.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerTabBar : UITabBar
@property (nonatomic,copy) void (^plusBlock)();
@end
