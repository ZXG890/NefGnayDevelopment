//
//  NSString+RandomStr.m
//  ScanToProductXML
//
//  Created by 柴苗苗 on 17/2/4.
//  Copyright © 2017年 柴苗苗. All rights reserved.
//

#import "NSString+RandomStr.h"

@implementation NSString (RandomStr)
+ (NSString *)generateTradeNOWithLength:(int)lengtn{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++) {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
@end
