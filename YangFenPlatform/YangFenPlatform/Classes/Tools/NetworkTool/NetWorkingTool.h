//
//  XMLNetWorkingTool.h
//  ScanToProductXML
//
//  Created by 柴苗苗 on 16/11/28.
//  Copyright © 2016年 柴苗苗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface NetWorkingTool : AFHTTPSessionManager
+(NetWorkingTool*)shareManager;
+(NetWorkingTool*)shareImageManager;
@end
