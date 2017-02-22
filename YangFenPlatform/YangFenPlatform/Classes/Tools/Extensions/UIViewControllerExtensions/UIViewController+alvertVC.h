//
//  UIViewController+alvertVC.h
//  xytxwNewlyMall
//
//  Created by 柴苗苗 on 16/9/29.
//  Copyright © 2016年 xytxw. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^confirmBlock)(UIAlertController *alvertVC);

typedef void(^cancelBlock)(UIAlertController *alvertVC);

typedef void(^completionBlock)();

@interface UIViewController (alvertVC)
-(void)alvertVCWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style confirmBlock:(confirmBlock)confirmB cancelBlock:(cancelBlock)cancelB  completeBlock:(completionBlock)completeB leftCancelTitle:(NSString *)leftTitle rightConfirmTitle:(NSString *)rightTitle;
-(void)alvertVCWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style confirmBlock:(confirmBlock)confirmB cancelBlock:(cancelBlock)cancelB  completeBlock:(completionBlock)completeB;
-(void)alvertTipLabelWithString:(NSString *)contenString completeBLock:(void (^)())alvertCompleteBlock;
@end
