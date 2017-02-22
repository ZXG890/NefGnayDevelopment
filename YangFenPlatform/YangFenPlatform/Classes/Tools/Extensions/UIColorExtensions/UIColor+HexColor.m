//
//  UIColor+HexColor.m
//  layerProgress
//
//  Created by 柴苗苗 on 16/8/11.
//  Copyright © 2016年 柴苗苗. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
+(instancetype)colorWithHex:(NSInteger)hex{


    return [UIColor colorWithRed:(CGFloat)((hex&0xFF0000)>>16)/255.0 green:(CGFloat)((hex&0xFF00)>>8)/255.0 blue:(CGFloat)(hex&0xFF)/255.0 alpha:1];


}

+(instancetype)colorRGBWithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueVlaue{


    return [UIColor colorWithRed:redValue/255.0 green:greenValue/255.0 blue:blueVlaue/255.0 alpha:1];

}
@end
