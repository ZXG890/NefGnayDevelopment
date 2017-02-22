//
//  UIColor+HexColor.h
//  layerProgress
//
//  Created by 柴苗苗 on 16/8/11.
//  Copyright © 2016年 柴苗苗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
+(instancetype)colorWithHex:(NSInteger)hex;
+(instancetype)colorRGBWithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueVlaue;
@end
