//
//  NSString+MD5.m
//  ScanToProductXML
//
//  Created by 柴苗苗 on 17/2/4.
//  Copyright © 2017年 柴苗苗. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
+ (NSString *) md5:(NSString *) input {
    
    int length = (int)strlen(input.UTF8String);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(input.UTF8String, length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
@end
