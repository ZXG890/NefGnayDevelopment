//
//  HomeCollcetionView.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/23.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "HomeCollcetionView.h"
#import "HomeCollectionCell.h"
#import "HomeCollectionViewFlowout.h"


#define sectionInsetTop 20
#define margin 10
#define step 10

@interface HomeCollcetionView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end
@implementation HomeCollcetionView
+(instancetype)collectionViewWithFrame:(CGRect)frame{


    UICollectionViewFlowLayout *flowOut = [[HomeCollectionViewFlowout alloc] init];
    
    flowOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    flowOut.minimumLineSpacing = step;
    
    flowOut.minimumLineSpacing = step;
    
//    flowOut.estimatedItemSize = CGSizeMake(10, 10);
    
    flowOut.sectionInset = UIEdgeInsetsMake(sectionInsetTop, 0, sectionInsetTop, 0);
    
    HomeCollcetionView *collectionV = [[self alloc] initWithFrame:frame collectionViewLayout:flowOut];
    
//    [collectionV registerClass:[HomeCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    
    [collectionV registerNib:[UINib nibWithNibName:@"HomeCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    collectionV.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    collectionV.delegate = collectionV;
    
    collectionV.dataSource = collectionV;
    
    collectionV.showsVerticalScrollIndicator = NO;
    
    
//添加轮播图
    
    //
    HomeScanyDisplayView *scanDisplayView = [[HomeScanyDisplayView alloc]initWithFrame:CGRectMake(0, -collectionV.contentInset.top,frame.size.width, collectionV.contentInset.top)];
    
    collectionV.scanDisplayView = scanDisplayView;
    
    collectionV.scanDisplayView.imageArray = @[@"girl3",@"h6",@"h7",@"girl3",@"h6",@"h7",@"girl3",@"h6",@"h7"];
    
    
    [collectionV addSubview:scanDisplayView];
    
    return collectionV;

}
#pragma 实现数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 5;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            
            return 2;
            break;
        case 1:
            
            return 3;
            break;
        case 2:
            
            return 3;
            break;
        case 3:
            
            return 3;
            break;
        case 4:
            
            return 4;
            break;
            
        default:
            
            return 0;
            break;
    }

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    cell.cellImageView.image = [UIImage imageNamed:@"h6"];
    
    cell.layer.shouldRasterize = YES;
    
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    cell.layer.drawsAsynchronously = YES;


    return cell;

}
#pragma 实现delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    NSLog(@"已选中%ld--%ld",(long)indexPath.section,(long)indexPath.item);

}
#pragma 设置整体布局
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    NSLog(@"🐶🐶🐶🐶🐶");

    switch (indexPath.section) {
        case 0:
        {
            CGFloat itemWidth = MainScreenWidth-2*margin;
            
            if (indexPath.item == 0) {
                
                return CGSizeMake(itemWidth, 120);
                
            }else{
            
                return CGSizeMake(itemWidth, 100);
            
            }
    
        }
           
            break;
        case 1:
        {
            CGFloat itemWidth = (MainScreenWidth-2*margin-2*step)/3;
            
            return CGSizeMake(itemWidth,itemWidth);
        }
            
            break;
        case 2:
        {
            
            CGFloat itemWidth = (MainScreenWidth-2*margin-step)*0.5;
            
            
            
            if (indexPath.item == 0) {
                
                return CGSizeMake(itemWidth, itemWidth);
                
            }else{
                
                return CGSizeMake(itemWidth, 0);
            }
            
        }
            
            break;
        case 3:
        {
            CGFloat itemWidth = MainScreenWidth-2*margin;
            return CGSizeMake(itemWidth, 100);
        }
            
            break;
        case 4:
        {
            CGFloat itemWidth = (MainScreenWidth-2*margin-step)*0.5;
            
            return CGSizeMake(itemWidth, itemWidth*2/3);
        }
            
            break;
        default:
            
            return CGSizeZero;
            break;
    }

    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    
    return CGSizeMake(MainScreenWidth, 20);
    

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeZero;

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(0, margin, 0, margin);

}
@end
