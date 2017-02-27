//
//  HomeCollectionViewFlowout.m
//  YangFenPlatform
//
//  Created by 柴苗苗 on 17/2/24.
//  Copyright © 2017年 xytxw. All rights reserved.
//

#import "HomeCollectionViewFlowout.h"
#define margin 10
#define step 10

@implementation HomeCollectionViewFlowout

-(void)prepareLayout{

    [super prepareLayout];


}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attribute  in array) {
        
        if (attribute.indexPath == [NSIndexPath indexPathForRow:1 inSection:2]) {
            UICollectionViewLayoutAttributes *lastAttribute = [super layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:attribute.indexPath.item-1 inSection:attribute.indexPath.section]];
            
            attribute.frame = CGRectMake(CGRectGetMaxX(lastAttribute.frame)+10, lastAttribute.frame.origin.y, attribute.size.width, ((MainScreenWidth-2*margin-step)*0.5-step)*0.5);

            
        }else if (attribute.indexPath == [NSIndexPath indexPathForRow:2 inSection:2]){
            
            UICollectionViewLayoutAttributes *lastAttribute = [super layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:attribute.indexPath.item-1 inSection:attribute.indexPath.section]];
            
            attribute.frame = CGRectMake(lastAttribute.frame.origin.x, lastAttribute.center.y+5, attribute.size.width, ((MainScreenWidth-2*margin-step)*0.5-step)*0.5);
            
            
        }
    }
    
    return array;

}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

  UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    if (indexPath == [NSIndexPath indexPathForRow:1 inSection:2]) {
        
        
        
    }else if (indexPath == [NSIndexPath indexPathForRow:2 inSection:2]){
    
    
    
    
    }
    
    
    return attributes;
    
    


}
@end
