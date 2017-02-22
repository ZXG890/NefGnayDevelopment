//
//  UtilsScan.h
//  Scan
//
//  Created by 微创科技 on 15/10/20.
//  Copyright (c) 2015年 weichuang.com. All rights reserved.
//

#ifndef Scan_UtilsScan_h
#define Scan_UtilsScan_h

#define titleFont 14

#define listName @"list"
#define mapName @"map"

#define UserID [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]
#define RoleID [[NSUserDefaults standardUserDefaults]objectForKey:@"roleId"]
#define SetUserId(idString) [[NSUserDefaults standardUserDefaults] setObject:idString forKey:@"userId"]
#define SetRoleId(tokenString) [[NSUserDefaults standardUserDefaults] setObject:tokenString forKey:@"roleId"]

#define SetUserName(userName) [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"]
#define SetCodeNum(code) [[NSUserDefaults standardUserDefaults] setObject:code forKey:@"codeNum"]

#define UserName [[NSUserDefaults standardUserDefaults]objectForKey:@"userName"]
#define CodeNum [[NSUserDefaults standardUserDefaults]objectForKey:@"codeNum"]

#define RemoveUserName [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName"]
#define RemoveCodeNum [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"codeNum"]

#define RemoveUserId [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"]
#define RemoveRoleId [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"roleId"]

// 请求url字符串拼接

#define HttpHeader(detailName) [NSString stringWithFormat:@"http://n.xytxw.com.cn/%@",detailName]

/**
 *  color
 */
#define TXMBgHeaderColor HEXCOLOR(0X383838)


#define TXMPreTitleColor HEXCOLOR(0Xe9900f)

#define NavTitleColor HEXCOLOR(255255255)
#define CellBgColor HEXCOLOR(242831)
#define ControllerBgColor HEXCOLOR(374144)

//颜色
#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]


#define YellowTextColor                     [UIColor colorWithRed:242/255.f green:211/255.f blue:87/255.f alpha:1.0]


#define bgViewColor                         [UIColor colorWithRed:23/255.f green:26/255.f blue:29/255.f alpha:1]

/**
 系统及设备
 */
#define iOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

#define iOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0
/**
 *  适配
 */
#define NavBarHeight                        (iOS7 ? 64.0 : 44.0)
#define ViewOriginY                         (iOS7 ? 64.0 : 44.0)
#define StatusBarHeight                     (iOS7 ? 20.0 : 0.0)
#define TabBarHeight                        49.0
#define MainScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define MainScreenHeight                        [[UIScreen mainScreen] bounds].size.height


/**
 *  系统方法
 */
#define NOTIFICATION_CENTER                  [NSNotificationCenter defaultCenter]
#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define WS(weakSelf)                        __weak __typeof(&*self)weakSelf = self;



#endif


















