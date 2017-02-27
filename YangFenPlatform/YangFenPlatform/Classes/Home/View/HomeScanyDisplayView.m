//
//  HomeScanyDisplayView.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "HomeScanyDisplayView.h"

#define ReusedID @"HomeDisplaycell"
@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic,assign) NSInteger moveDistance;
@property (nonatomic,weak) UIImageView *imageView;
@property (nonatomic,strong) UIImage *myImage;
@property (nonatomic,assign) BOOL isDisplay;
@end

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView  *imageV = [[UIImageView  alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [self addSubview:imageV];

        self.imageView = imageV;
    
    }
    
    return self;
}
@end
@interface HomeScanyDisplayView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionV;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger currentIndex;

@end
@implementation HomeScanyDisplayView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //添加图片展示
        UICollectionViewFlowLayout *flowOut = [[UICollectionViewFlowLayout alloc] init];
        
        flowOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        flowOut.minimumLineSpacing = 0;
        
        flowOut.minimumInteritemSpacing = 0;
        
        flowOut.itemSize = frame.size;
        
        _collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:flowOut];
        
        [_collectionV registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:ReusedID];
        
        
        _collectionV.pagingEnabled = YES;
        
        _collectionV.delegate = self;
        
        _collectionV.dataSource = self;
        
        _collectionV.bounces = NO;
        
        _collectionV.showsHorizontalScrollIndicator = NO;
        
        [self addSubview:_collectionV];
        
        [self startTimer];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
            
        });
        
        //添加pageControl
       CGFloat Y =  CGRectGetMaxY(self.bounds);
        
       CGFloat X =   CGRectGetMaxX(self.bounds);
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(X-MainScreenWidth*2/3, Y-50, MainScreenWidth*2/3, 50)];
        
        _pageControl.pageIndicatorTintColor = [UIColor greenColor];
        
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        
        _pageControl.backgroundColor = [UIColor clearColor];
        
        _pageControl.defersCurrentPageDisplay = NO;
        
        
       
        [self addSubview:_pageControl];
        
        [self bringSubviewToFront:_pageControl];
        
    }

    return self;

}
-(void)setImageArray:(NSArray *)imageArray{

    _imageArray = imageArray;
    
    _pageControl.numberOfPages = _imageArray.count;


}
#pragma 实现数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.imageArray.count+2;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReusedID forIndexPath:indexPath];
    
    NSInteger items = [collectionView numberOfItemsInSection:indexPath.section];
    
    NSIndexPath *newIndexPath;
    
    NSInteger currentIndex;
    
    if (indexPath.item == 0) {
        
        newIndexPath = [NSIndexPath indexPathForItem:items-3 inSection:indexPath.section];
        
        currentIndex = 0;
        
    }else if (indexPath.item == items-1){
        
        newIndexPath = [NSIndexPath indexPathForItem:0 inSection:indexPath.section];
        
        currentIndex = self.imageArray.count-1;
        
    }else{
        
        newIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
        
        currentIndex = indexPath.item-1;
    }
    
 
//    _pageControl.currentPage = currentIndex;
    
    cell.imageView.image = [UIImage imageNamed:self.imageArray[newIndexPath.item]];
    
    return cell;
    
}
#pragma 添加timer
-(void)startTimer{
    
    if (self.timer == nil) {
        
        self.timer = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            
            [self.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex+1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
            
        }];
        
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    
}
-(void)stopTimer{
    
    if (self.timer) {
        
        [self.timer invalidate];
        
        self.timer = nil;
    }
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
    UICollectionView *collectionV = (UICollectionView *)scrollView;
    
    NSLog(@"%s",__func__);
    
    CGFloat currentIndexF = (float)scrollView.contentOffset.x/(float)scrollView.bounds.size.width;

    CGFloat otherIndex =  currentIndexF - floorf(currentIndexF);
    
    if (otherIndex == 0) {
        
        self.currentIndex = (NSInteger)currentIndexF;
        
        NSInteger currentPage;
        
        
        if ((NSInteger)floorf(currentIndexF) == [_collectionV numberOfItemsInSection:0]-1) {
            
            
            [collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition: UICollectionViewScrollPositionRight  animated:NO];
            
            currentPage = 0;
            
            
            
        }else if ((NSInteger)ceilf(currentIndexF) == 0){
            
            
            [collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:[_collectionV numberOfItemsInSection:0]-2 inSection:0] atScrollPosition: UICollectionViewScrollPositionLeft  animated:NO];
            
            currentPage = [_collectionV numberOfItemsInSection:0]-2-1;
            
            
        }else{
        
            currentPage = self.currentIndex-1;
        
            
        }
        
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
            self.pageControl.currentPage = currentPage;
            
//            [self.pageControl updateCurrentPageDisplay];

//        });
        
    }
 
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    [self stopTimer];

}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    [self startTimer];

}
-(void)dealloc{

    [self stopTimer];
    
}
@end
