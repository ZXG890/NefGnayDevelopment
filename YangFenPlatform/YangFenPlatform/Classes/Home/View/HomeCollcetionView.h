//
//  HomeCollcetionView.h
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/23.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScanyDisplayView.h"
@interface HomeCollcetionView : UICollectionView
+(instancetype)collectionViewWithFrame:(CGRect)frame;
@property(nonatomic,weak) HomeScanyDisplayView *scanDisplayView;
@end
