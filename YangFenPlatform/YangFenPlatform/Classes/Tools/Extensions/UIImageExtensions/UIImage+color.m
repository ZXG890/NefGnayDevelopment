//
//  UIImage+color.m
//  xytxwNewlyMall
//
//  Created by 柴苗苗 on 16/9/22.
//  Copyright © 2016年 xytxw. All rights reserved.
//

#import "UIImage+color.h"

@implementation UIImage (color)

+(instancetype)imageWithColor:(UIColor *)imageColor{

    return [self imageWithColor:imageColor size:CGSizeMake(1, 1)];
    
}
+(instancetype)imageWithColor:(UIColor *)imageColor size:(CGSize)imageSize{
    
    UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ref, imageColor.CGColor);
    
    CGContextFillRect(ref, CGRectMake(0, 0, imageSize.width, imageSize.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    
    return image;
}
@end
