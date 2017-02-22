//
//  XMLNetWorkingTool.m
//  ScanToProductXML
//
//  Created by 柴苗苗 on 16/11/28.
//  Copyright © 2016年 柴苗苗. All rights reserved.
//

#import "NetWorkingTool.h"

@implementation NetWorkingTool

+(NetWorkingTool *)shareManager{
    
   static dispatch_once_t onceToken;
    
   static NetWorkingTool *manager;

   dispatch_once(&onceToken, ^{
    
    
    manager = [NetWorkingTool manager];
       
       //AFXMLDocumentResponseSerializer
       //AFXMLDocumentResponseSerializer
    
       manager.responseSerializer = [AFJSONResponseSerializer serializer];
       
       manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml",@"text/xml",@"text/html",@"image/png",@"application/json",@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/x-json",@"text/plain",@"multipart/form-data",nil];
       manager.requestSerializer = [AFHTTPRequestSerializer serializer];
       
    
   });

    
    
    return manager;

}
+(XMLNetWorkingTool *)shareManager1{

    static dispatch_once_t onceToken;
    
    static NetWorkingTool *manager;
    
    dispatch_once(&onceToken, ^{
        
        
        manager = [NetWorkingTool manager];
        
        //AFXMLDocumentResponseSerializer
        //AFXMLDocumentResponseSerializer
        
        // [AFJSONResponseSerializer serializer];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml",@"text/xml",@"text/html",@"image/png",@"application/json",@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/x-json",@"text/plain",@"multipart/form-data",@"image/jpeg",nil];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        
    });
    
    
    
    return manager;
    
}
-(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{

    [SVProgressHUD showWithStatus:@"加载中。。。"];
    
   NSURLSessionDataTask *dataTask = [super POST:URLString parameters:parameters progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull DataTask, id _Nullable responseObject){
       
       [SVProgressHUD dismiss];
       
       success(dataTask,responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    
       [SVProgressHUD dismiss];
        
       failure(task,error);
    
    }];
    
    return dataTask;

}
-(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull))block progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{

    [SVProgressHUD showProgress:0.0 status:@"图片上传中"];
    
    NSURLSessionDataTask *dataTask = [super POST:URLString parameters:parameters constructingBodyWithBlock:block progress:^(NSProgress * _Nonnull progress){
    
        [SVProgressHUD showProgress:(float)progress.completedUnitCount/(float)progress.totalUnitCount status:@"图片上传中"];
        
        uploadProgress(progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject){
    
        [SVProgressHUD dismiss];
        
        success(dataTask,responseObject);
    
    
    } failure:^(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error){
    
        [SVProgressHUD dismiss];
    
        failure(dataTask,error);
    
    }];

    return dataTask;

}
@end
